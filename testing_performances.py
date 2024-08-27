import argparse
import random
import numpy as np
import torch
from torch.utils.data import DataLoader
from copy import deepcopy
import torchvision.transforms as transforms

from help_code_demo import ToTensor, IEGM_DataSET, stats_report


def main():
    seed = 222
    torch.manual_seed(seed)
    torch.cuda.manual_seed_all(seed)
    np.random.seed(seed)
    random.seed(seed)

    # Hyperparameters
    BATCH_SIZE_TEST = 1
    SIZE = args.size
    path_data = args.path_data
    path_records = args.path_record
    path_net = args.path_net
    path_indices = args.path_indices
    sampleRate = args.sample_rate#
    stats_file = open(path_records + 'seg_stat.txt', 'w')

    # load trained network
    net = torch.load(path_net + 'IEGM_net.pkl', map_location='cpu') #cuda:0 #pd had to force cpu here
    net.eval()
    
    #net.cuda()
    device = torch.device('cuda:0' if torch.cuda.is_available() else 'cpu')
    net.to(device)# added this here and commented out the cuda() call
    #print(device)
    testset = IEGM_DataSET(root_dir=path_data,
                           indice_dir=path_indices,
                           mode='test',
                           size=SIZE,
                           transform=transforms.Compose([ToTensor()]),
                           sampleRate=sampleRate)

    testloader = DataLoader(testset, batch_size=BATCH_SIZE_TEST, shuffle=True, num_workers=0)

    segs_TP = 0
    segs_TN = 0
    segs_FP = 0
    segs_FN = 0

    for data_test in testloader:
        IEGM_test, labels_test = data_test['IEGM_seg'], data_test['label']
        seg_label = deepcopy(labels_test)

        IEGM_test = IEGM_test.float().to(device)
        labels_test = labels_test.to(device)

        outputs_test = net(IEGM_test)
        _, predicted_test = torch.max(outputs_test.data, 1)

        if seg_label == 0:
            segs_FP += (labels_test.size(0) - (predicted_test == labels_test).sum()).item()
            segs_TN += (predicted_test == labels_test).sum().item()
        elif seg_label == 1:
            segs_FN += (labels_test.size(0) - (predicted_test == labels_test).sum()).item()
            segs_TP += (predicted_test == labels_test).sum().item()

    # report metrics
    stats_file.write('segments: TP, FN, FP, TN\n')
    output_segs = stats_report([segs_TP, segs_FN, segs_FP, segs_TN])
    stats_file.write(output_segs + '\n')
    #stats_file.write(str(sampleRate) + '\n')#

    del net


if __name__ == '__main__':
    argparser = argparse.ArgumentParser()
    argparser.add_argument('--cuda', type=int, default=0)
    argparser.add_argument('--size', type=int, default=1250)
    argparser.add_argument('--path_data', type=str, default='C:/Users/jodge/Documents/School/Summer24/tinyml_contest_data_training/')
    argparser.add_argument('--path_net', type=str, default='./saved_models/')
    argparser.add_argument('--path_record', type=str, default='./records/')
    argparser.add_argument('--path_indices', type=str, default='./data_indices/')
    argparser.add_argument('--sample_rate', type=float, help="haven't decided yet", default = 1.0)#

    args = argparser.parse_args()

    device = torch.device("cuda:" + str(args.cuda) if torch.cuda.is_available() else 'cpu')
    #print("device is --------------", device)
    #print("sampleRate is : ", args.sample_rate)#

    main()
