df_meas <- rbind(trn, tst)  #union the trn and tst data frames
df_lab <- rbind(trn_lbl, tst_lbl) #union the trn_lbl and tst_lbl data frames
subjects <- rbind(trn_sub, tst_sub) #union the subjects data frames
df <- cbind(subjects, df_lab, df_meas) #merge all train and test data

#remove objects from environment
rm(list=c("subjects", "feat",
          "tst_lbl", "tst_sub", "tst",
          "trn_lbl", "trn_sub", "trn",
          "df_meas", "df_lab"))