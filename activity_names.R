df$activity_id <- act[df$activity_id,2] #replace activity_id with activity desc

#remove objects from environment
rm(list=c("act"))
