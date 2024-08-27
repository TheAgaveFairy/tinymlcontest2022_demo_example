@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.avgpool model_1.py
for /l %%i in (1,1,5) do (
	echo iteration %%i
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py  --path_data C:\Users\jodge\Documents\School\Summer24\temp_data\ --size 162  >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_sym4_zero_5-3_r162-162_avgpool.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py  --path_data C:\Users\jodge\Documents\School\Summer24\temp_data\ --size 162  >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_sym4_zero_5-3_r162-162_avgpool.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.avgpool
pause
