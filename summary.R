summary_data <- df %>%
  group_by(Subject, ActivityDescription) %>%
  summarise_all(funs(mean))