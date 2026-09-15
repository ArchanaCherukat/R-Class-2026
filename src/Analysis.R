rm(list=ls(all=TRUE))
df.t <- read.csv('data/tempExperiment_v2.csv')
str(df.t)
df.t$temp <- factor(df.t$temp)
boxplot(df.t$growthRate~df.t$temp+df.t$pop)
#making the boxplot neater below
boxplot(df.t$growthRate~df.t$temp+df.t$pop,
        names=c('10','20','10','20'),
        at=c(1,2,4,5),
        ylab='Growth Rate mm/day',
        xlab = '')
# mtext command is to add margin text
mtext('Pop 1', side=1, at=1.5, line=3)
mtext('Pop 2', side=1, at=4.5, line=3)
#here side=1 means bottom margin(2-left, 3-top and 4-right), 
#at is horizontal positioning along the x-coordinate 1.5 is b/w 1 and 2 and 4.5 is b/w 4 and 5
#line is distance from the axis with 0 being right on the axis
pdf('results/MyBoxplot.pdf', width = 5, height = 5)
boxplot(df.t$growthRate~df.t$temp+df.t$pop,
        names=c('10','20','10','20'),
        at=c(1,2,4,5),
        ylab='Growth Rate mm/day',
        xlab = '')
# mtext command is to add margin text
mtext('Pop 1', side=1, at=1.5, line=3)
mtext('Pop 2', side=1, at=4.5, line=3)
dev.off()
#Now to test if the population or the temperature is significant for my analysis I am doing ANOVA
#the "*" symbol is the multiplication symbol and here it is used to evaluate an interaction
m1 <- aov(df.t$growthRate~df.t$temp*df.t$pop)
m1.summary <- summary(m1)
m1.summary
saveRDS(m1.summary, 'results/m1.summary.rds')
