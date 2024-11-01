# Instructions to run the matlab code

## Renaming policies

The name protocol used for this project is very specific and the preprocessing code will NOT run if not followed. 

After performing the test you should rename the .bin file generated (default: adc_data.bin) to this format:

```Test{N}_i{k}.bin ``` 

N: is the test number 

    - this should be increasing and not be the same for any test (if numbers are missing it is fine the preproccessing code accounts for that).

k: is the number of interruptions 

    - this starts from 0 for no interruptions until 5 which is the freezing case (can be changed in the preproccesing code to include frequency and amplitude decriments as well).

capitalization of the word 'test' does not matter.

example names: 
- 'Test1000_i2.bin' this is a test with number 1000 and 2 interruptions.

- 'test1500_i5.bin' this is a test with number 1500 and, in our case, freezing.

- 'test2000_f.bin' this is test with number 2000 but it will be skipped in the current python code.

For more examples of the name format you can refer to our collected data on this link: https://www.kaggle.com/datasets/manousos/all-matrices-new.

## Matlab code

The matlab code 'Main_to_save':
-  Loads the binary data from the 'data' folder
-  Plots the time/velocity graph of each test
-  Saves the data matrices in a .mat format in a 'matrices' folder that it creates. 

