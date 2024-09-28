@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.avgpool model_1.py
for /l %%i in (250,100,1250) do (
	echo length %%i
	for /l %%j in (1,1,5) do (
		echo iteration %%j
		python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py --size %%i --epoch 3 >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_len%%i_avgpool3.txt
		python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py --size %%i >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_len%%i_avgpool3.csv
	)
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.avgpool
pause
