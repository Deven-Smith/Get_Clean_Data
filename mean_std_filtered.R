#filter df for just measurement means and standard deviations
df <- select(df, subjects, activity_id, contains("mean"), contains("std"))