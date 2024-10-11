@echo off
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py.og model_1.py
for /l %%i in (1,1,10) do (
	echo iteration %%i
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\training_save_deep_models.py --path_data C:\Users\jodge\Documents\School\Summer24\fft_data\ --path_indices C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\fft_indices\   >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\train_fft_r200RECON_1250_original.txt
	python C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\testing_performances.py --path_data C:\Users\jodge\Documents\School\Summer24\fft_data\ --path_indices C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\fft_indices\   >> C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\results\TEST_fft_r200RECON_1250_original.csv
)
ren C:\Users\jodge\Documents\School\Summer24\tinymlcontest2022_demo_example\models\model_1.py model_1.py.og
pause
