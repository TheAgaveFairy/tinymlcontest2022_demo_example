@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.avgpool model_1.py
for /l %%i in (1,1,5) do (
	echo iteration %%i
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py --path_data C:\Users\jodge\Documents\School\Summer24\trunc_data\ --path_indices C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\trunc_indices\  --size 552 >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_trunc_r552_552_avgpool.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py --path_data C:\Users\jodge\Documents\School\Summer24\trunc_data\ --path_indices C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\trunc_indices\  --size 552 >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_trunc_r552_552_avgpool.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.avgpool
pause
