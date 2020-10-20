download.file('https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip','Datas\\data.zip')
unzip('Datas\\data.zip',exdir='Datas')

act_labels <- read.table("Datas\\UCI HAR Dataset\\activity_labels.txt")
features <- read.table("Datas\\UCI HAR Dataset\\features.txt")

test <- read.table("Datas\\UCI HAR Dataset\\test\\X_test.txt")

train <- read.table("Datas\\UCI HAR Dataset\\train\\X_train.txt")

act_test <- read.table("Datas\\UCI HAR Dataset\\test\\y_test.txt")

act_train <- read.table("Datas\\UCI HAR Dataset\\train\\y_train.txt")

subj_test <- read.table("Datas\\UCI HAR Dataset\\test\\subject_test.txt")

subj_train <- read.table("Datas\\UCI HAR Dataset\\train\\subject_train.txt")

names(test) <- features[,2]

names(train) <- features[,2]

data <- rbind(test,train)

activities <- rbind(act_test,act_train)

for (i in 1:dim(act_labels)[1]) {
    activities <- replace(activities, activities==act_labels[i,1],act_labels[i,2])
}
 
names(activities) <- "Activity"

subjects <- rbind(subj_test,subj_train)

names(subjects) <- "Subject"

mean_std <- grepl('mean()|std()',names(data))

new_data <- data[,mean_std]

Total_data <- cbind(subjects,activities,data)

init = 0
subj = 1
for (i in 1:length(table(subjects))) {
    tmp_set <- Total_data[Total_data[,1]==subj,]
    for (j in 1:dim(act_labels)[1]) {
        tmptmp_set <- tmp_set[tmp_set[,2]==act_labels[j,2],]
        mean_values <- colMeans(tmptmp_set[,3:length(tmptmp_set)])
        mean_values <- data.frame(matrix(mean_values,nrow=1))
        if (init==0){
            final_set <- cbind(tmptmp_set[1,1:2],mean_values)
            init = 1
        }else{
            tmptmp_set <- cbind(tmptmp_set[1,1:2],mean_values)
            final_set <- rbind(final_set,tmptmp_set)
        }
    }
    subj = subj + 1
}

names(final_set) <- names(Total_data)

row.names(final_set) <- 1:dim(final_set)[1]

write.table(final_set,file="Tidy_set.txt",row.name=FALSE)  
