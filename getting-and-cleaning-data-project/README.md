# Getting and Cleaning Data project

by Éderson Dias

## Description

This folder contains all files required for the getting an cleaning data course week 4 project.

## Project goals

The project goal was to develop and show skills in gathering, processing and exporting data for further analysis. In order to accomplish the goal, the following files wereuploaded to this repository:  

Link | Description
--- | ---
[run_analysis.R](https://github.com/edersond/jhu-datascience-coursera/blob/master/getting-and-cleaning-data-project/run_analysis.R) | R script that imports, proccesses and exports required data   
[tidy_data.csv](https://github.com/edersond/jhu-datascience-coursera/blob/master/getting-and-cleaning-data-project/tidy_data.csv) | file containing the tidy data set outputed by run_analysis.R
[CodeBook.md](https://github.com/edersond/jhu-datascience-coursera/blob/master/getting-and-cleaning-data-project/CodeBook.md) | code book that describes the variables, the data, and any transformations or work that performed to clean up the data  

## How the script works  

Essentially, the script creates a directory, downloads and unzips the data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip);  
After, it performs all the proccessing decribed in the CodeBook in order to achieve the proccessing tasks. 
Then, it outputs the tidy_data.csv file in the created folder.
