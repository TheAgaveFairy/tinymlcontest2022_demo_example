@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.avgpoolmulti model_1.py
for /l %%i in (1,1,1) do (
	echo iteration %%i
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py --path_indices ./multi_indices >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_stock_avgpoolmulti.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances_multi.py --path_indices ./multi_indices >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_stock_avgpoolmulti.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.avgpoolmulti
pause
