### Chris Kyriazis Plotting and genetic variation data analysis exercises, Assignment 2

##1a
pvals=pchisq(chisqs,1,lower.tail=FALSE)

##2a
signifthres<-0.05
sum(pvals<signifthres) 
mean(pvals<signifthres) 
# 4.51% less than 0.05 

signifthres<-0.01
sum(pvals<signifthres) 
mean(pvals<signifthres) 
# 1.02% less than 0.01

signifthres<-0.001
sum(pvals<signifthres) 
mean(pvals<signifthres)
# 0.12% less than 0.001


##1c
num_pval <- length(pvals)

#4014 pvals

##1d
exp_pvals <- numeric()
for(i in 1:num_pval){
  exp_pvals[i] <- i/num_pval
}


##1e

sort_pvals <- sort(pvals)

##1f

log_sort_pvals <- -log10(sort_pvals)
log_exp_pvals <- -log10(exp_pvals)


##1g-i

plot(log_exp_pvals, log_sort_pvals, xlab="-log10(expected P-value)", ylab="-log10(observed P-value", pch=19)
abline(0,1, col="red")



##2a
zz <- read.table("pheno.sim.2014-2.txt", header=T)


##2b
quantile(zz$glucose_mmolperL)

#25% quantile = 4.768756

##2c
quantile(zz$glucose_mmolperL)

#75% quantile = 7.354975

##2d
plot(density(zz$glucose_mmolperL),col=2,lwd=4,xlab="Value", main = "Density plot of blood glucose levels")
abline(v=quantile(zz$glucose_mmolperL,0.75),lty=2,lwd=3,col=2)
abline(v=quantile(zz$glucose_mmolperL,0.25),lty=2,lwd=3,col=2)


