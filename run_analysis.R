library(dplyr)

source("load_data.R")  #run script that loads all of the text files
source("merge_trn_tst.R")  #run script that unions trn and tst data frames
source("mean_std_filtered.R") #filter for mean and std measurements
source("activity_names.R") #assign activity names to the data frame
source("feature_rename.R") #create more intuitive column names
source("export_data.R") #export cleaned data to working directory
