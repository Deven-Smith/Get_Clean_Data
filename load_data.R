#assign the main file path
path <- paste0("C:/Users/ds90972/Personal/Career/Trainings/Coursera/",
                    "Data Scientist Learning Path/Getting and Cleaning Data/",
                    "UCI HAR Dataset/")

train <- "train/X_train.txt"                #assign the train data name
test <- "test/X_test.txt"                   #assign the test data name
train_lab <- "train/y_train.txt"            #assign the train labels name
test_lab <- "test/y_test.txt"               #assign the test labels name
train_subject <- "train/subject_train.txt"  #assign train subjects name
test_subject <- "test/subject_test.txt"     #assign test subjects name
activity_labels <- "activity_labels.txt"    #assign the activity labels name
features <- "features.txt"                  #assign the features name

act <- read.table(
  paste0(path, activity_labels),                       #read in activities
  sep="", col.names = c("activity_id", "activity"))    #name the columns

feat <- read.table(
  paste0(path, features),                              #read in features
  sep="", col.names = c("feature_id", "feature"))      #name the columns

tst_sub <- read.table(
  paste0(path, test_subject),                          #read in test subjects
  sep="", col.names = c("subjects"))                   #name the columns

tst_lbl <- read.table(
  paste0(path, test_lab),                              #read in test labels
  sep="", col.names = c("activity_id"))                #name the columns

tst <- read.table(
  paste0(path, test),                                  #read in test data
  sep="", col.names = feat$feature)                    #name the columns


trn_sub <- read.table(
  paste0(path, train_subject),                         #read in train subjects
  sep="", col.names = c("subjects"))                   #name the columns

trn_lbl <- read.table(
  paste0(path, train_lab),                             #read in train labels
  sep="", col.names = c("activity_id"))                #name the columns

trn <- read.table(
  paste0(path, train),                                 #read in train data
  sep="", col.names = feat$feature)                    #name the columns



#remove objects from environment
rm(list=c("activity_labels", "features", 
          "test", "test_lab", "test_subject",
          "train", "train_lab", "train_subject",
          "path"))
