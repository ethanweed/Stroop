# Code to copy/paste into the R module in JASP

# Create a new dataframe with reading data in long format
ReadingInt <- data$Reading_Int
ReadingNoInt <- data$Reading_NoInt
RT <- c(ReadingInt, ReadingNoInt)
Condition <- c(rep("ReadingInt", length(ReadingInt)), rep("ReadingNoInt", length(ReadingNoInt)))
df <- data.frame(Condition, RT)

# Plot the data as notched boxplots and points
library(ggplot2)
p <- ggplot(df, aes(Condition, RT, fill = Condition)) + geom_boxplot(notch = TRUE) + geom_point() + theme_classic()
plot(p)