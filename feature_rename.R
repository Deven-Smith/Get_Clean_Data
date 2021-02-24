#rename columns to be more intuitive

names(df)[1] <- "Subject"                               
names(df)[2] <- "ActivityDescription"                     
names(df) <- gsub("^t", "Time", names(df))           
names(df) <- gsub("Freq", "Frequency", names(df))
names(df) <- gsub("^f", "Frequency", names(df))
names(df) <- gsub("Acc", "Accelerometer", names(df))
names(df) <- gsub("mean", "Mean", names(df))
names(df) <- gsub("Gyro", "Gyroscope", names(df))
names(df) <- gsub("std", "StandardDeviation", names(df))
names(df) <- gsub("Mag", "Magnitude", names(df))
names(df) <- gsub("BodyBody", "Body", names(df))
names(df) <- gsub("gravity", "Gravity", names(df))
names(df) <- gsub("tBody", "TimeBody", names(df))
names(df) <- gsub("angle", "Angle", names(df))
names(df) <- gsub("\\.X", "\\.Xaxis", names(df))
names(df) <- gsub("\\.Y", "\\.Yaxis", names(df))
names(df) <- gsub("\\.Z", "\\.Zaxis", names(df))
names(df) <- gsub("\\.\\.\\.", "\\.", names(df))
names(df) <- gsub("\\.\\.", "\\.", names(df))
names(df) <- gsub("\\.$", "", names(df))
