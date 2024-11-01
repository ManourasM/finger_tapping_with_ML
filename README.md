# finger_tapping_with_ML
This repository contains detailed steps to collect data for finger-tapping test, using the FMCW radar sensor manufactured by Texas Instruments, convert them to matrices to be used in python and train ML models to identify the number of interruptions in each test. This project was developed in the scope of the 'Advanced topics in Biomedical Engineering' course from 'Biomedical engineering' master students of Chalmers University of Technology.
More information can be found on the final report.




## Detailed steps to collect data and run the model
- clone this repository using https ``` git clone https://github.com/ManourasM/finger_tapping_with_ML.git ```.

- setup the sensor following the instructions on the 'Sensor_setup' folder.

- perform the finger tapping tests.

- export the .mat files from Matlab by following the instructions in the 'MatLab' folder.

- upload the data to kaggle or the coding environment of your choice (the provided code is developed in Kaggle so you need to modify some paths if you choose another environment).

- run and optionally modify the Python code for the preprocessing of the data and the model training located on the 'Python' folder.


Our own dataset with self collected data and a few physiotherapist data is located in this path: 'https://www.kaggle.com/datasets/manousos/all-matrices-new'.


## Disclaimer 

The code presented here was developed and tested for our self-collected data. (see report for more information)
Results may differ depending on the nature of the collected data.
The code should be studied and modified accordingly depending on the desired application.
For any question contact 'manousos@student.chalmers.se' or create an issue in this repository.