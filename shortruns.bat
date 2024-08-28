@echo off
for /l %%i in (1,1,5) do (
    echo Running iteration %%i
    @echo on
	python training_save_deep_models.py --size 250 >> results\avgpool\short_250_train.txt
	python testing_performances.py --size 250 >> results\avgpool\short_250_test.csv
	@echo off
)
pause