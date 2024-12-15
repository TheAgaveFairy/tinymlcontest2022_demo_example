@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.CNNRNN model_1.py
for /l %%j in (1,1,10) do (
	echo iteration %%j
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_len626_CNNRNN.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_len626_CNNRNN.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.CNNRNN
pause
S