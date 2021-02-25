train <- "./UCI HAR Dataset/train/X_train.txt"                #assign the train data name
test <- "./UCI HAR Dataset/test/X_test.txt"                   #assign the test data name
train_lab <- "./UCI HAR Dataset/train/y_train.txt"            #assign the train labels name
test_lab <- "./UCI HAR Dataset/test/y_test.txt"               #assign the test labels name
train_subject <- "./UCI HAR Dataset/train/subject_train.txt"  #assign train subjects name
test_subject <- "./UCI HAR Dataset/test/subject_test.txt"     #assign test subjects name
activity_labels <- "./UCI HAR Dataset/activity_labels.txt"    #assign the activity labels name
features <- "./UCI HAR Dataset/features.txt"                  #assign the features name

act <- read.table(activity_labels,                     #read in activities
  sep="", col.names = c("activity_id", "activity"))    #name the columns

feat <- read.table(features,                              #read in features
  sep="", col.names = c("feature_id", "feature"))      #name the columns

tst_sub <- read.table(test_subject,                          #read in test subjects
  sep="", col.names = c("subjects"))                   #name the columns

tst_lbl <- read.table(test_lab,                              #read in test labels
  sep="", col.names = c("activity_id"))                #name the columns

tst <- read.table(test,                                  #read in test data
  sep="", col.names = feat$feature)                    #name the columns


trn_sub <- read.table(train_subject,                         #read in train subjects
  sep="", col.names = c("subjects"))                   #name the columns

trn_lbl <- read.table(train_lab,                             #read in train labels
  sep="", col.names = c("activity_id"))                #name the columns

trn <- read.table(train,                                 #read in train data
  sep="", col.names = feat$feature)                    #name the columns



#remove objects from environment
rm(list=c("activity_labels", "features", 
          "test", "test_lab", "test_subject",
          "train", "train_lab", "train_subject"))
