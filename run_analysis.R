## Read Test Set
xtest <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt"))
## Read Test Lables
ytest <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt"))
## Read Test Subject list
testsubj <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt"))
## Read Train Set
xtrain <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt"))
## Read Train Labels
ytrain <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt"))
## Read Train Subject List
trainsubj <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"))
## Read Train Subject List
actlabels <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt"))
## Read Activity descriptive labels
activity <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt"))

##Combine the labels in train and test
alllabels <- rbind(ytrain, ytest)

## Replace the activity numbers column with descriptive activity labels.
alllabels$V1 <- activity$V2[alllabels$V1]

## Combine the train and test data
alldat <- rbind (xtrain, xtest)

## Combine all the subjects in the same order as data.
allsubj <- rbind (trainsubj, testsubj)

## name all the columns in alldat using features.txt
## first read in features.txt
collabels <- data.table(read.table("./getdata-projectfiles-UCI HAR Dataset//UCI HAR Dataset/features.txt"))
## create a charachter vector containing new colnames.
newcolname <- as.character(collabels$V2)
## create a charachter vector containing old col names in alldat
oldcolname <- as.character(colnames(alldat))
## rename the columnes of alldat
setnames(alldat, oldcolname, newcolname)

## Now try to select only the columns that have mean and std dev information.
reqddat <- as.data.frame(alldat)
reqddat<-reqddat[,grep("\\bmean()\\b|std()",colnames(reqddat))]

## Combine the labels to the selected columns (reqddat)
## Activity labels become the first column and rename it to Activity.
reqddat <- cbind(alllabels, reqddat)
setnames(reqddat, "V1", "Activity")

##Combine the subject ids to alldat
## Add subject id as the first column and now activities become the second
## column
reqddat <- cbind(allsubj, reqddat)
## Rename the first column as SubjectID and the second column as Activity
setnames(reqddat, "V1", "SubjectID")

## Group the data based on SubjectID & Activity, then calculate the mean for each column
datmean <- reqddat %>%
        group_by(SubjectID, Activity) %>%
        summarise_each(funs(mean))

## Rename the column nanes of "datmean" to follow tidy data guidelines.
datmean <- rename(datmean, subjectid = SubjectID)
datmean <- rename(datmean, activity = Activity)
datmean <- rename(datmean, tbodyaccmeanx = `tBodyAcc-mean()-X`)
datmean <- rename(datmean, tbodyaccmeany = `tBodyAcc-mean()-Y`)
datmean <- rename(datmean, tbodyaccmeanz = `tBodyAcc-mean()-Z`)
datmean <- rename(datmean, tbodyaccstdx = `tBodyAcc-std()-X`)
datmean <- rename(datmean, tbodyaccstdy = `tBodyAcc-std()-Y`)
datmean <- rename(datmean, tbodyaccstdz = `tBodyAcc-std()-Z`) 
datmean <- rename(datmean, tgravityaccmeanx = `tGravityAcc-mean()-X`)
datmean <- rename(datmean, tgravityaccmeany = `tGravityAcc-mean()-Y`)
datmean <- rename(datmean, tgravityaccmeanz = `tGravityAcc-mean()-Z`)
datmean <- rename(datmean, tgravityaccstdx = `tGravityAcc-std()-X`)
datmean <- rename(datmean, tgravityaccstdy = `tGravityAcc-std()-Y`)
datmean <- rename(datmean, tgravityaccstdz = `tGravityAcc-std()-Z`)
datmean <- rename(datmean, tbodyaccjerkmeanx = `tBodyAccJerk-mean()-X`)
datmean <- rename(datmean, tbodyaccjerkmeany = `tBodyAccJerk-mean()-Y`)
datmean <- rename(datmean, tbodyaccjerkmeanz = `tBodyAccJerk-mean()-Z`)
datmean <- rename(datmean, tbodyaccjerkstdx = `tBodyAccJerk-std()-X`)
datmean <- rename(datmean, tbodyaccjerkstdy = `tBodyAccJerk-std()-Y`)
datmean <- rename(datmean, tbodyaccjerkstdz = `tBodyAccJerk-std()-Z`)
datmean <- rename(datmean, tbodygyromeanx = `tBodyGyro-mean()-X`)
datmean <- rename(datmean, tbodygyromeany = `tBodyGyro-mean()-Y`)
datmean <- rename(datmean, tbodygyromeanz = `tBodyGyro-mean()-Z`)
datmean <- rename(datmean, tbodygyrostdx = `tBodyGyro-std()-X`)
datmean <- rename(datmean, tbodygyrostdy = `tBodyGyro-std()-Y`)
datmean <- rename(datmean, tbodygyrostdz = `tBodyGyro-std()-Z`)
datmean <- rename(datmean, tbodygyrojerkmeanx = `tBodyGyroJerk-mean()-X`)
datmean <- rename(datmean, tbodygyrojerkmeany = `tBodyGyroJerk-mean()-Y`)
datmean <- rename(datmean, tbodygyrojerkmeanz = `tBodyGyroJerk-mean()-Z`)
datmean <- rename(datmean, tbodygyrojerkstdx = `tBodyGyroJerk-std()-X`)
datmean <- rename(datmean, tbodygyrojerkstdy = `tBodyGyroJerk-std()-Y`)
datmean <- rename(datmean, tbodygyrojerkstdz = `tBodyGyroJerk-std()-Z`)
datmean <- rename(datmean, tbodyaccmagmean = `tBodyAccMag-mean()`)
datmean <- rename(datmean, tbodyaccmagstd = `tBodyAccMag-std()`)
datmean <- rename(datmean, tgravityaccmagmean = `tGravityAccMag-mean()`)
datmean <- rename(datmean, tgravityaccmagstd = `tGravityAccMag-std()`)
datmean <- rename(datmean, tbodyjerkmagmean = `tBodyAccJerkMag-mean()`)
datmean <- rename(datmean, tbodyaccjerkmagstd = `tBodyAccJerkMag-std()`)
datmean <- rename(datmean, tbodygyromagmean = `tBodyGyroMag-mean()`)
datmean <- rename(datmean, tbodygyromagstd = `tBodyGyroMag-std()`)
datmean <- rename(datmean, tbodyjerkmagmean = `tBodyGyroJerkMag-mean()`)
datmean <- rename(datmean, tbodygyrojerkmagstd = `tBodyGyroJerkMag-std()`)
datmean <- rename(datmean, fbodyaccmeanx = `fBodyAcc-mean()-X`)
datmean <- rename(datmean, fbodyaccmeany = `fBodyAcc-mean()-Y`)
datmean <- rename(datmean, fbodyaccmeanz = `fBodyAcc-mean()-Z`)
datmean <- rename(datmean, fbodyaccstdx = `fBodyAcc-std()-X`)
datmean <- rename(datmean, fbodyaccstdy = `fBodyAcc-std()-Y`)
datmean <- rename(datmean, fbodyaccstdz = `fBodyAcc-std()-Z`)
datmean <- rename(datmean, fbodyaccjerkmeanx = `fBodyAccJerk-mean()-X`)
datmean <- rename(datmean, fbodyaccjerkmeany = `fBodyAccJerk-mean()-Y`)
datmean <- rename(datmean, fbodyaccjerkmeanz = `fBodyAccJerk-mean()-Z`)
datmean <- rename(datmean, fbodyaccjerkstdx = `fBodyAccJerk-std()-X`)
datmean <- rename(datmean, fbodyaccjerkstdy = `fBodyAccJerk-std()-Y`)
datmean <- rename(datmean, fbodyaccjerkstdz = `fBodyAccJerk-std()-Z`)
datmean <- rename(datmean, fbodygyromeanx = `fBodyGyro-mean()-X`)
datmean <- rename(datmean, fbodygyromeany = `fBodyGyro-mean()-Y`)
datmean <- rename(datmean, fbodygyromeanz = `fBodyGyro-mean()-Z`)
datmean <- rename(datmean, fbodygyrostdx = `fBodyGyro-std()-X`)
datmean <- rename(datmean, fbodygyrostdy = `fBodyGyro-std()-Y`)
datmean <- rename(datmean, fbodygyrostdz = `fBodyGyro-std()-Z`)
datmean <- rename(datmean, fbodyaccmagmean = `fBodyAccMag-mean()`)
datmean <- rename(datmean, fbodyaccmagstd = `fBodyAccMag-std()`)
datmean <- rename(datmean, fbodyaccjerkmagmean = `fBodyBodyAccJerkMag-mean()`)
datmean <- rename(datmean, fbodyaccjerkmagstd = `fBodyBodyAccJerkMag-std()`)
datmean <- rename(datmean, fbodybodygyromagmean = `fBodyBodyGyroMag-mean()`)
datmean <- rename(datmean, fbodygyromagstd  = `fBodyBodyGyroMag-std()`)
datmean <- rename(datmean, fbodygyrojerkmagmean = `fBodyBodyGyroJerkMag-mean()`)
datmean <- rename(datmean, fbodygyrojerkmagstd = `fBodyBodyGyroJerkMag-std()`)



