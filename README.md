---
output:
  html_document: default
  pdf_document: default
---
# **Peer-graded Assignment: Getting and Cleaning Data Course Project**
This submission is the work of **Deven Smith**.  The repository this project is
located in contains instructions for how to run the data cleanup on the 
Human Activity Recognition Using Smartphones Data Set.

The data was manually downloaded and unzipped into the working directory for
the GitHub linked project repository.

### Dataset
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Additional Dataset Information
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The website the data was obtaind from contains the following citation request:

Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and 
Jorge L. Reyes-Ortiz. A Public Domain Dataset for 
Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, 
Computational Intelligence and Machine Learning, 
ESANN 2013. Bruges, Belgium 24-26 April 2013.

### Dependencies
- Library: DPLYR

### Repository Files
- README.md
  - Descriptions of the repository and files within
  
- CodeBook.md
  - Describes the attributes, data, and work performed to clean the data

- run_analysis.R
  - Loads the DPLYR library
  - Performs the source calls to the various .R files in the working directory
  - Individual chunks are detailed below
  - load_data.R
    - Loads the data from the working directory into R
  - merge_trn_tst.R
    - Performs the merging steps of the data by merging training and test sets
    - Merges train and test sets for measurements, labels, and subjects
  - mean_std_filtered.R
    - Selects only the columns that contain "mean" or "std" in their names
    - This reduces the attributes down to only desired feature measurements
    - std is standard deviation
  - activity_names.R
    - Labels the dataset with activity names by replacing the activity IDs
  - feature_rename.R
    - Performs renaming/cleanup of data attribute names to more intuitive names
  - export_data.R
    - Performs the write to CSV function to export the cleaned data set
    
- Clean_Data.csv
  - CSV file for the final cleaned data set