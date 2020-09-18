# Code to copy/paste into the R module in JASP to create boxplots

# Create a new dataframe with reading data in long format

# Create new variables with the data from the Reading_Int and Reading_NoInt columns in our data
ReadingInt <- data$Reading_Int
ReadingNoInt <- data$Reading_NoInt

# Create a new variable called "RT" for "reaction time" or "response time"which contains first the response time for ReadingInt, and then ReadingNoInt
RT <- c(ReadingInt, ReadingNoInt)

# Create a new variable called "Condition", which repeats the label "ReadingInt" once for every data point in the ReadingInt condition, and then repeats the label "ReadingNoInt" for the number of data points in the ReadingNoInt condition
Condition <- c(rep("ReadingInt", length(ReadingInt)), rep("ReadingNoInt", length(ReadingNoInt)))


# create a new dataframe (like a spreadsheet) with two columns: Condition, and RT
df <- data.frame(Condition, RT)

# Plot the data as notched boxplots and points

# load the data visualization library "ggplot2"
library(ggplot2)

# create a variable "p" which creates a plot with Condition on the x-axis, and RT on the y-axis, and plots both notched boxplots and the individual data points. Data are drawn from the new dataframe we created: "df".
p <- ggplot(df, aes(Condition, RT, fill = Condition)) + geom_boxplot(notch = TRUE) + geom_point() + theme_classic()

# It seems to work better if you paste in everything above first, and then after that has run, add this last bit:

# show the plot
plot(p)