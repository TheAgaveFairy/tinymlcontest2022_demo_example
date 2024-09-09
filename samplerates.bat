@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.avgpool model_1.py
for /l %%i in (1,1,10) do (
	echo iteration %%i
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py --sample_rate 5.0 >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_sampleRate_5_avgpool.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py --sample_rate 5.0 >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_sampleRate_5_avgpool.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.avgpool
pause
