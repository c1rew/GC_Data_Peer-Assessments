labeldata <- read.table("UCI HAR Dataset/activity_labels.txt")
labelnames <- as.character(labeldata[,2])

testdata <- read.table("UCI HAR Dataset/test/X_test.txt")
testActivity <- read.table("UCI HAR Dataset/test/Y_test.txt")
testIds <- read.table("UCI HAR Dataset/test/subject_test.txt")
testActindex <- as.numeric(as.character(testActivity[ ,1]))
for(index in 1:length(testActindex)) {
    testActivity[index,1] <- labelnames[testActindex[index]]
}
testData <- data.frame(testIds, testActivity, testdata)

traindata <- read.table("UCI HAR Dataset/train/X_train.txt")
trainActivity <- read.table("UCI HAR Dataset/train/Y_train.txt")
trainIds <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainActindex <- as.numeric(as.character(trainActivity[ ,1]))
for(index in 1:length(trainActindex)) {
    trainActivity[index,1] <- labelnames[trainActindex[index]]
}
trainData <- data.frame(trainIds, trainActivity, traindata)

features <- read.table("UCI HAR Dataset/features.txt")
featureNames <- c("ID", "Activity", as.character(features[ ,2]))
dataSet <- merge(testData,trainData,all=TRUE)

meancol <- grepl("^.*mean\\(\\).*",featureNames)
stdcol <- grepl("^.*std\\(\\).*",featureNames)
meansdcol <- meancol | stdcol
subDatameansd <- dataSet[, meansdcol]
subDataMeanSd <- data.frame(dataSet[,1:2],subDatameansd)
meansdcol[1:2] <- TRUE
names(subDataMeanSd) <- featureNames[meansdcol]

dataMean <- aggregate(.~ID+Activity,data=subDataMeanSd,mean)
write.table(dataMean, "dataMean.txt",row.names = FALSE)
