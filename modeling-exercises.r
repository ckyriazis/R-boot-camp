### Chris Kyriazis Bootcamp modeling excersizes

##a
ricker <- function(iterations=50, r=1.05, k=1000, N0=100, PLOTFLAG=1){
  n <- numeric(iterations+1)
  n[1] <- N0
  for (i in 1:iterations){
    n[i+1] <- n[i]*exp(r*(1-n[i]/k))
  }
  if(PLOTFLAG==1){ # if want to plot
    plot(1:(iterations+1), n, xlab="time", ylab="N", col="blue", type="l")
  }
  return(n)
}

##b

#using default values specified above and varying r:
#1: n goes to 0 when r is negative
#2: n goes to k when 0<r<1
#3: n decays/oscillates to k when 1<r<2
#4: n oscillates around k when 2<r<~2.5
#:5 n is chaotic when r>~2.5

##c: plot fucntion for 6 values of r

par(mfrow=c(2,3), mar=c(4, 4, 3, 2)) #set for six plots

for(i in c(-1,0,1,2,2.5,3)){ #six values for r
  ricker(r=i)
}

##d

k=1000
N0=20
nVec <- ricker(k=k,N0=N0,PLOTFLAG=0)
for(i in 1:length(nVec)){
  if (nVec[i]>=(k/2)){ 
    print(i) #print index for first element greater than k/2
    break
  }
}

##e

#make function halfk from code above
halfk <- function(k,N0,r=1.05){
  nVec <- ricker(k=k,N0=N0,r=r,PLOTFLAG=0)
  for(i in 1:length(nVec)){
    if (nVec[i]>=(k/2)){
     return(i)
      break
    }
  }
}

#loop across desired values of r using halfk
halfT <- numeric() #vector to store indicies at which value is greater than k/2

rValues <- seq(0.1,0.9, by=0.1)

for(i in 1:length(rValues)){ 
  halfT[i] <- halfk(1000,20,r=i) #loop over r values and record index where value greater than k/2
}
par(mfrow=c(1,1))
plot(rValues,halfT, xlab="Value of r", ylab="T_k/2", pch=19)

##f: pseudo code

#set r values
#set k values
#initialize output matrix with dimensions rxk

#loop over r values
  #loop over k values
    #call ricker function
    #add result to output vector
    
##g: r script

rValues <- seq(-1, 3, by=0.5) #values of r to try
kValues <- seq(100,1000, by=100) #values of k to try
output <- matrix(nrow=length(rValues), ncol=length(kValues)) 

for(i in 1:length(rValues)){
  for(j in 1:length(kValues)){
    output[i,j] <- ricker(r=rValues[i], k=kValues[j])[5] #output value at t=5
  }
}

#load package plotly
library(plotly)

plot_ly(x=kValues,y=rValues,z=output, type = "contour")

  