@echo off
for /l %%i in (1,1,5) do (
	echo Iteration %%i
	python training_save_deep_models.py --sample_rate 1.0 >> results\avgpool\rate1train.txt
	python testing_performances.py --sample_rate 1.0 >> results\avgpool\rate1test.csv
	echo 1 done
	python training_save_deep_models.py --sample_rate 2.0 >> results\avgpool\rate2train.txt
	python testing_performances.py --sample_rate 2.0 >> results\avgpool\rate2test.csv
	echo 2 done
	python training_save_deep_models.py --sample_rate 3.0 >> results\avgpool\rate3train.txt
	python testing_performances.py --sample_rate 3.0 >> results\avgpool\rate3test.csv
	echo 3 done
	python training_save_deep_models.py --sample_rate 4.0 >> results\avgpool\rate4train.txt
	python testing_performances.py --sample_rate 4.0 >> results\avgpool\rate4test.csv
	echo 4 done
)
pause