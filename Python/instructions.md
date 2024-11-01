# Understanding the Python code

At this point you should have all your tests uploaded in your prefered workspace and with the correct naming policies.
Running this code will:
 - load the data from your dataset 
 - preproccess them
 - augment them 
 - plot them
 - split them into train/validation/test sets
 - define and train best performing models (random forest classifier, 1D-CNN)

## Loading data

- The paths may need changing according to the prefered workspace. The existing ones are using kaggle workspace.

- A dictionary will be created that will have the test number as key and the test label as value according to the name of the file.

- A list of matrices will be created with length the number of tests and matrix size of 1024,1247 before preproccessing

- There is a function that checks for gaps in the test numbers of the given dictionary and renames subsequent tests to maintain consecutive numbering.

## mean in chunks

- there is a function called 'mean_matrix_in_chunks' that means the matrix column wise based on the specified chunk.
- this is used mainly for the 'Random Forest Classifier' model and can be skipped for the convolution model.

## Physiotherapist data

- the pipeline of the collected data is also applied to physiotherapist data that were available at the time of the project

- these data are in a different folder called 'physio_data' in the original dataset and are used as a completely different set in this code.

## model training

- there are some commented out cells in the simple ML part of the code that contain different model architectures and algorithms as well as a randomsearch to optimize the hyperparameters 


