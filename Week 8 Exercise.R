library(readxl)
library(dplyr)
student_data <- read_excel("/Users/dennis/Documents/Data Science Tutor/student_dataW8.xlsx")

#1.Show the details of students whose final_exam_mark is greater than 80%.
student_above80 <- student_data %>% filter(final_exam_mark > 80)
View(student_above80)

#2.Arrange the dataset in ascending order based on course_work_mark.
mydata <- student_data %>% arrange(coursework_mark)
View(mydata)

#3.Display only the student name and final_exam_mark attributes from the dataset.
mydata2 <- student_data %>% select(student_name, final_exam_mark)
View(mydata2)

#4.Specify the number of rows and columns in the dataset.
nrow(student_data)
ncol(student_data)
dim(student_data)

#5.Explain how to obtain the details of the given dataset using R. 
#Show the dataset details based on the R query you execute.
glimpse(student_data) #shows variable names, data types, and sample values.
str(student_data) #displays the structure of the dataset.
summary(student_data) #provides descriptive statistics.
head(student_data) #displays the first six rows.
tail(student_data) #displays the last six rows.

#6.How can you identify and detect outliers in the given dataset? 
#Explain and demonstrate using R.

#Step1: Draw Boxplot
boxplot(student_data$final_exam_mark,
        main = "Boxplot of Final Exam Mark",
        ylab = "Final Exam Mark")

#Step2: Calculate Q1, Q3 and IQR
Q1 <- quantile(student_data$final_exam_mark, 0.25)
Q3 <- quantile(student_data$final_exam_mark, 0.75)
IQR_value <- IQR(student_data$final_exam_mark)
Q1
Q3
IQR_value

#Step3: Calculate Lower and Upper Limits
Lower <- Q1 - 1.5 * IQR_value
Upper <- Q3 + 1.5 * IQR_value
Lower
Upper

#Step4: Display Outliers
outliers <- student_data %>% filter(final_exam_mark < Lower | final_exam_mark > Upper)
View(outliers)
