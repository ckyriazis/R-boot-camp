
#define function get_heights
get_heights <- function(x){
  heights <- rnorm(x, mean = 69, sd = 10)
  average <- mean(heights)
  return(average)
}

heights <- get_heights(1000)


#sample size of 100
mean_heights_100 <- numeric(1000)
for(i in 1:1000){
  mean_heights_100[i] <- get_heights(100)
}
mean_heights_100

#sample size of 1000
mean_heights_1000 <- numeric(1000)
for(i in 1:1000){
  mean_heights_1000[i] <- get_heights(1000)
}
mean_heights_1000


#plot
bins<-seq(65,73,by=.5)
hist(mean_heights_100,breaks=bins)$breaks
hist(mean_heights_1000,breaks=bins)$breaks

counts_100 <- hist(mean_heights_100,breaks=bins)$counts
counts_1000 <- hist(mean_heights_1000,breaks=bins)$counts


pdf(file="height_barplot.pdf", width=6,height=6)

par(mfrow=c(1,1), mar=c(4, 4, 3, 2)) 

barplot(rbind(counts_100,counts_1000),col=c(2,4),beside=TRUE,names.arg=seq(65,72.5,by=0.5), xlab="Average height (inches)",ylab="Count")

legend(6,350,c("n=100","n=1000"),col=c(2,4),pch=19)
dev.off()