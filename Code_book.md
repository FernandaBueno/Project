act_labels -> data frame containing the name of the activities and their corresponding number
features -> data frame containing the name of the features

test -> data frame from the test
train -> data frame from the training
act_test -> activities linked to the test datas
act_train -> activities linked to the training datas
subj_test -> subjects linked to the test datas
subj_train -> subjects linked to the training datas
data -> temporary data frame containing all the data from test and training
activities -> data frame containing all the activities from test and training in text
subjects -> data frame containing all the sujects from test and training
mean_std -> list containing the row in which mean and standard deviation values are present in the data data frame
new_data -> data frame containing only the mean and std deviation from data
Total_data -> data frame containing the chosen variables in a tidy way with subject and activity
init -> flag to initialize final_set
subj -> count the subject to get the mean values
tmp_set -> working data frame
tmptmp_set -> working data frame
mean_values -> working data frame
final_set -> final tidy data frame containing the mean values for every subject and every activity for each variable
