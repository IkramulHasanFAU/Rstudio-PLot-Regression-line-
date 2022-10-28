#installing ggplot2 package and check the library 
install.packages("ggplot2")
library("ggplot2")
ggp <- ggplot (Dummy.data_flood,aes(Year,FloodArea)) + geom_point(colour="darkmagenta",shape = 21, size = 2.5,aes(fill = "cyan4"),show.legend = FALSE) +scale_fill_manual(values=c("darkcyan"))
ggp
# calculating slope
install.packages("trend")
sens.slope(Dummy.data_flood$FloodArea)
#calculating r squared and p-value
lmod = lm (FloodArea ~ Year,Dummy.data_flood)
summary(lmod)
#pasting r^2, p-value and slope inside the grpahs 
lb1 <- paste("R^2 == 0.2103")
ggp +geom_smooth(method = "lm", col = "darkmagenta") + xlab("Year") + ylab("Area") + scale_y_continuous(limits = c(500, 2500))+scale_x_continuous(limits = c(2002, 2021),breaks = seq(2002,2021, by = 3))+ annotate("text", x=2007,y=2450, label= "p-value = 0.04197 ")+annotate("text", x=2007,y=2350, label= " slope = -22.12 ") + annotate("text", x=2007,y=2225,parse=TRUE,label= lb1)
