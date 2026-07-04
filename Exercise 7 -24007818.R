#Task 1
# Create vectors
Name <- c("Aisha","Bryan","Chloe","Daniel","Emily")
Gender <- c("Female","Male","Female","Male","Female")
Age <- c(22,23,21,24,22)
Test_Score <- c(85,78,92,65,88)
Attendance <- c(90,85,95,70,88)

# Combine into data frame
students <- data.frame(Name, Gender, Age, Test_Score,Attendance)

# View data frame
students

#Task 2
#Display the Test_Score column using both df['Test_Score'] and df$Test_score.
students["Test_Score"]
students$Test_Score

#Display the first 3 rows of the data frame
students[1:3, ]

#Display students who are older than 22
students[students$Age > 22, ]

#Display female students with Test_Score greater than 80
students[students$Gender=="Female" &
           students$Test_Score>80, ]

#Task 3
#Add new data
newStudent<- data.frame(Name="Lina", Gender="Male", Age=20, Test_Score=95, Attendance=92)
students<-rbind(students, newStudent)
students

#Task 4
#Find NA
students_na <- data.frame(
  Name = c("Aisha", "Bryan", "Chloe", "Daniel", "Emily"),
  Gender = c("Female", "Male", "Female", "Male", "Female"),
  Age = c(22, NA, 21, 24, 22),
  Test_Score = c(85, 78, NA, 65, 88),
  Attendance = c(90, 85, 95, NA, 88)
)
print(students_na)
is.na(students_na)

#Replace NA in Age with mean
students_na$Age[is.na(students_na$Age)] <- mean(na.omit(students_na$Age))
#Replace NA in Test_Score with median
students_na$Test_Score[is.na(students_na$Test_Score)] <- median(na.omit(students_na$Test_Score))
#Replace NA in Attendance with 0
students_na$Attendance[is.na(students_na$Attendance)] <- 0
print(students_na)
