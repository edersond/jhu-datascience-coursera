#Code Book  

By Éderson Dias

## Description  

This document contains the information about the data, transformations and other necessary info about the project.

## Source Data

The data source is provided by the UCI Macine Learning Repository ([here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)).  
The data was gathered in an experiment in which 30 persons aged 18 to 49 performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) with a smartphone atteched to ehir arms. Further information about the data is contained in the zip file referred in the README.md

## Data proccessing and transformations

The data was provided in splited files. Once it was a machine learning experiment, there was a training set and a training set which merged compose the full data set. Each data set observation is a record from the smartphone accelerometer.
There are also separate files for the variable names, the activity perfermed during each observation record, and the subject that was carrying the smartphone which recorded the observation.

So, the first step is to import the variable names. Then the names of the variables of interest are extracted by the text patterns mean() and std().

Then the accelerometer data is imported. So is the activity and subject data.  

Assuming that the variable names, activity and subject data are provided in the same order of the data set, only the variables of interest are selected and renamed, then the activity and subject data added. It is done for the training and for the test sets. After, both sets are merged, creating a sigle data frame for all observations

With the merged dataframe, the mean of the observations recorded by each subject performing each activity is calculated and stored in a new data frame in a tidy format, using functions melt() and dcast() from the reshape2 package.

## Outputting

The tidy dataframe with the ccalculated mean of the variables of interest measures for each activity performed by each subject is then exported in csv format.

