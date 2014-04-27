run_analysis <- function()
{
  features <- read.table("features.txt")  
  x_test <- read.table("test\\X_test.txt")
  y_test <- read.table("test\\y_test.txt")
  subject_test <- read.table("test\\subject_test.txt")  
  test <- cbind(y_test, subject_test, x_test)
  x_train <- read.table("train\\X_train.txt")
  y_train <- read.table("train\\y_train.txt")
  subject_train <- read.table("train\\subject_train.txt")
  train <- cbind(y_train, subject_train, x_train)
  
  all <- rbind(test, train)
  labels <- t(features[,2])  
  names(all) <- c("Label", "Subject", as.character(labels))
  
  selFeatures <- features[str_detect(string = features[,2], pattern = "std\\(\\)|mean\\(\\)"),]
  selCol <- selFeatures[,1] + 2
  
  data <- all[,c(1,2,selCol)]
  #labels <- unique(data[,1])
  #subject <- unique(data[,2])
  
  #splitF <- list(gl(30,6), gl(6,30))
  #splitData <- split(data, splitF)
  
  #finalData <- lapply(data, )
  
  finalData <- ddply(data, c("Label", "Subject"), function(df)colMeans(df))
  #names(finalData)[3:68] <- labels[selCol]
  
  write.table(finalData, "TidyData.txt")
  
  finalData
  
  
  
}
