
##Varibles
x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

x_data, y_data and subject_data merge the previous datasets  (Using rbind()function ) to further analysis features contains
the correct names for the x_data dataset, which are applied to the column names stored in mean_std, a numeric 
vector used to extract the desired data.

A similar approach is taken with activity names through the activities variable.

data_final merges x_datause, y_datanew and subject_data in a big dataset.

Finally, result contains the relevant averages which will be later stored in a .txt file. ddply() from the plyr package is 
used to apply colMeans() and ease the development.
