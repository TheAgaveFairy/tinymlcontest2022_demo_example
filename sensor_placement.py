import numpy as np
import os
from scipy.linalg import qr
import pickle

BAD = ['VT', 'VFb', 'VFt'] # KIS,S

def saveObj(obj, filename):
    #print(f"saving to {filename}")
    with open(filename, 'wb') as file:
        pickle.dump(obj, file)

def readObj(filename):
    #print(f"reading from {filename}")
    with open(filename, 'rb') as file:
       return pickle.load(file)

class SVD:
    def __init__(self, U, S, VT):
        self.U = U
        self.S = S
        self.VT = VT
    def __str__(self):
        return f"(U: {self.U.shape}, S: {self.S.shape}, VT: {self.VT.shape})"

class ProblemSetup:
    def __init__(self, r, p, fullSVD, truncSVD, Q, R, pivots, C):
      self.r = r
      self.p = p
      self.fullSVD = fullSVD
      self.truncSVD = truncSVD
      self.Q = Q
      self.R = R
      self.pivots = pivots
      self.C = C

    def __str__(self):
        return f"r: {self.r} p:{self.p} fullSVD: {self.fullSVD} truncSVD: {self.truncSVD} Q: {self.Q.shape} R: {self.R.shape} pivots: {self.pivots.shape} C: {self.C.shape}"

def sampleSignal(problemSetup, signal):
    return problemSetup.C @ signal

def measureAndReconstruct(problemSetup, signal):
    # Measure a signal
    C, U_hat, p, r, pivots =  problemSetup.C, problemSetup.truncSVD.U, problemSetup.p, problemSetup.r, problemSetup.pivots
    y = sampleSignal(C, signal) # C @ signal
    
    # Solve for coefficients #CLAUDE assisted here down
    U_k_reduced = U_hat[:, :p][pivots, :]
    
    if p == r:
        a = np.linalg.lstsq(U_k_reduced, y, rcond=None)[0]
    elif p > r:
        a = np.linalg.pinv(C @ U_hat) @ y # idk if this is right
    else:
        return None # ERROR!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

    #mseFinal = np.mean((signal - x_reconstructed) ** 2)
    return U_hat @ a

for b in BAD:
    path = os.path.join(r'C:\Users\jodge\Documents\School\Summer24\playground\data', b + '.pkl')
    problem_setup = readObj(path)
    print(b, problem_setup)