@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.avgpool model_1.py
for /l %%i in (1,1,10) do (
	echo iteration %%i
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py --epoch 3 >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_avgpool3.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_avgpool3.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.avgpool
pause
