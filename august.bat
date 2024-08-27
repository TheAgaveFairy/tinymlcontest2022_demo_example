for /l %%i in (1,1,5) do (
    echo Running iteration %%i
    
	python training_save_deep_models.py --path_data C:\Users\jodge\Documents\School\Summer24\recon_data\ --path_indices .\recon_indices\ --size 216 >> results\recon_216_notpadded_train_avgpool.txt
	python testing_performances.py --path_data C:\Users\jodge\Documents\School\Summer24\recon_data\ --path_indices .\recon_indices\ --size 216 >> results\recon_216_notpadded_test_avgpool.csv
	echo Recon done, trunc now...
	python training_save_deep_models.py --path_data C:\Users\jodge\Documents\School\Summer24\trunc_data\ --path_indices .\trunc_indices\ --size 216 >> results\trunc_216_notpadded_train_avgpool.txt
	python testing_performances.py --path_data C:\Users\jodge\Documents\School\Summer24\trunc_data\ --path_indices .\trunc_indices\ --size 216 >> results\trunc_216_notpadded_test_avgpool.csv
	
)
pause