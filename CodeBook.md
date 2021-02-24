# **Code Book for Getting and Cleaning Data Course Project**

The script <span style="color:blue">run_analysis.R</span> uses source function calls to run each code chunk
described in this book below.  The **dplyr** library is loaded at the start of 
the <span style="color:blue">run_analysis.R</span> script and is the only library dependency. 

- library(dplyr)

The data for this project was manually downloaded and unzipped in the working 
directory for the project in a folder called **UCI HAR Dataset**.

See the README file for original data set descriptions and related files.

The first step of <span style="color:blue">run_analysis.R</span> is to load the data.

- source("<span style="color:blue">load_data.R</span>")

Each data txt filepath is assigned to its own variable along with the parent file path in the <span style="color:blue">load_data.R</span> script.

- <mark>path</mark> <- paste0("C:/Users/ds90972/Personal/Career/Trainings/Coursera/",
                    "Data Scientist Learning Path/Getting and Cleaning Data/",
                    "UCI HAR Dataset/")
                    
- <mark>train</mark> <- "train/X_train.txt"
- <mark>test</mark> <- "test/X_test.txt"
- <mark>train_lab</mark> <- "train/y_train.txt"
- <mark>test_lab</mark> <- "test/y_test.txt" 
- <mark>train_subject</mark> <- "train/subject_train.txt"
- <mark>test_subject</mark> <- "test/subject_test.txt"
- <mark>activity_labels</mark> <- "activity_labels.txt"
- <mark>features</mark> <- "features.txt"

The data is then loaded using read.table functions and each assigned to its own object.

- <mark>act</mark> <- read.table(paste0(path, activity_labels),sep="", col.names = c("activity_id", "activity"))
  - 6 obs. of 2 variables

- <mark>feat</mark> <- read.table(paste0(path, features),sep="", col.names = c("feature_id", "feature"))      
  - 561 obs. of 2 variables

- <mark>tst_sub</mark> <- read.table(paste0(path, test_subject),sep="", col.names = c("subjects"))                  
  - 2947 obs. of 1 variable

- <mark>tst_lbl</mark> <- read.table(paste0(path, test_lab),sep="", col.names = c("activity_id"))               
  - 2947 obs. of 1 variable

- <mark>tst</mark> <- read.table(paste0(path, test),sep="", col.names = feat$feature)                  
  - 2947 obs. of 561 variables

- <mark>trn_sub</mark> <- read.table(paste0(path, train_subject),sep="", col.names = c("subjects"))                  
  - 7352 obs. of 1 variable

- <mark>trn_lbl</mark> <- read.table(paste0(path, train_lab),sep="", col.names = c("activity_id"))            
  - 7352 obs. of 1 variable

- <mark>trn</mark> <- read.table(paste0(path, train),sep="", col.names = feat$feature)                
  - 7352 obs. of 561 variables

Objects no longer needed after this step are then removed from the environment.

- rm(list=c("activity_labels", "features", 
          "test", "test_lab", "test_subject",
          "train", "train_lab", "train_subject",
          "path"))

With the data loaded, the rest of the <span style="color:blue">run_analysis.R</span> script cleans the data.
This is described in 5 steps below, with <span style="color:blue">blue font</span> noting each respective .R script file name(s) involved.

1. **Merges the training and the test sets to create one data set.**

- <span style="color:blue">run_analysis.R</span> calls the <span style="color:blue">merge_trn_tst.R</span> script.
  - source("<span style="color:blue">merge_trn_tst.R</span>") which creates:
    - <mark>df_meas</mark> (10299 obs, 561 variables) is created by merging <mark>trn</mark> and <mark>tst</mark> using **rbind()** function.
    - <mark>df_lab</mark> (10299 obs, 1 variables) is created by merging <mark>trn_lbl</mark> and <mark>tst_lbl</mark> using **rbind()** function.
    - <mark>subjects</mark> (10299 obs, 1 variables) is created by merging <mark>trn_sub</mark> and <mark>tst_sub</mark> using **rbind()** function.
    - <mark>df</mark> (10299 obs, 563 variables) is created by merging <mark>subjects</mark>, <mark>df_lab</mark>, and <mark>df_meas</mark> using **rbind()** function.

Objects no longer needed after this step are then removed from the environment.

- rm(list=c("subjects", "feat",
          "tst_lbl", "tst_sub", "tst",
          "trn_lbl", "trn_sub", "trn",
          "df_meas", "df_lab"))

2. **Extracts only the measurements on the mean and standard deviation for each measurement.**
- <span style="color:blue">run_analysis.R</span> calls the <span style="color:blue">mean_std_filtered.R</span> script.
  - source("<span style="color:blue">mean_std_filtered.R</span>") which modifies:
    - <mark>df</mark> (10299 obs, 88 variables) using the **dplyr::select()** function to select only columns with "mean" or "std" in the column name.

3. **Uses descriptive activity names to name the activities in the data set.**
- <span style="color:blue">run_analysis.R</span> calls the <span style="color:blue">activity_names.R</span> script.
  - source("<span style="color:blue">activity_names.R</span>") which modifies:
    - <mark>df\$activity_id</mark> by replacing the <mark>df\$activity_id</mark> values with the <mark>act\$activity</mark>.

Objects no longer needed after this step are removed from the environment.

- rm(list=c("act"))

4. **Appropriately labels the data set with descriptive variable names.**
- <span style="color:blue">run_analysis.R</span> calls the <span style="color:blue">feature_rename.R</span> script.
  - source("<span style="color:blue">feature_rename.R</span>") which modifies:
    - <mark>df</mark> column names to be more intuitive with the following changes:
      - <mark>subject</mark> column name is changed to <mark>Subject</mark>.
      - <mark>activity_id</mark> column name is changed to <mark>ActivityDescription</mark>.
      - All start with character <mark>t</mark> in column's name replaced by <mark>Time</mark> using **gsub()** function.
      - All contains character string <mark>Freq</mark> in column's name replaced by <mark>Frequency</mark> **gsub()** function.
      - All start with character <mark>f</mark> in column's name replaced by <mark>Frequency</mark> **gsub()** function.
      - All contains charcater string <mark>Acc</mark> in column's name replaced by <mark>Accelerometer</mark> **gsub()** function.
      - All contains charcater string <mark>mean</mark> in column's name replaced by <mark>Mean</mark> **gsub()** function.
      - All contains charcater string <mark>Gyro</mark> in column's name replaced by <mark>Gyroscope</mark> **gsub()** function.
      - All contains charcater string <mark>std</mark> in column's name replaced by <mark>StandardDeviation</mark> **gsub()** function.
      - All contains charcater string <mark>Mag</mark> in column's name replaced by <mark>Magnitude</mark> **gsub()** function.
      - All contains charcater string <mark>BodyBody</mark> in column's name replaced by <mark>Body</mark> **gsub()** function.
      - All contains charcater string <mark>gravity</mark> in column's name replaced by <mark>Gravity</mark> **gsub()** function.
      - All contains charcater string <mark>tBody</mark> in column's name replaced by <mark>TimeBody</mark> **gsub()** function.
      - All contains charcater string <mark>angle</mark> in column's name replaced by <mark>Angle</mark> **gsub()** function.
      - All contains charcater string <mark>.X</mark> in column's name replaced by <mark>.Xaxis</mark> **gsub()** function.
      - All contains charcater string <mark>.Y</mark> in column's name replaced by <mark>.Yaxis</mark> **gsub()** function.
      - All contains charcater string <mark>.Z</mark> in column's name replaced by <mark>.Zaxis</mark> **gsub()** function.
      - All contains charcater string <mark>...</mark> in column's name replaced by <mark>.</mark> **gsub()** function.
      - All contains charcater string <mark>..</mark> in column's name replaced by <mark>.</mark> **gsub()** function.
      - All end with character <mark>.</mark> in column's name removed **gsub()** function.
      

5. **From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.**

- <span style="color:blue">run_analysis.R</span> calls the <span style="color:blue">summary.R</span> script.
  - source("<span style="color:blue">summary.R</span>") which creates:
    - <mark>summary_data</mark> (180 obs, 88 variables) using **group_by()** and **summarise_all()** functions from **dplyr** library.
      - Groups by df\$Subject and df\$ActivityDescription.
      - Summarises all other columns with the **mean()** function.
      - This results in the mean of each measurement by each Subject and ActivityDescription combination.
      

For validation purposes, the final data frames of <mark>df</mark> and <mark>summary_data</mark> are also exported in the last script from **run_analysis.R**: **export_data.R**.

- <mark>Clean_Data.csv</mark> is created in the working directory from the <mark>df</mark> data frame using **write.csv()** function.
- <mark>Summary_Data.csv</mark> is created in the working directory from the <mark>summary_data</mark> data frame **write.csv()** function.
