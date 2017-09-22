##exercise 1

for (i in 1:9){
  if (i<9){
    cat("\n")
  }
  else{
    cat("*")
  }
}

##exercise 2

for (i in 1:9){
  if (i<9){
    cat("*&")
  }
  else{
    cat("*")
  }
}

##exercise 3

#dogs: 10->11,11->12,12->13,13->14,14->15

#meatloaf: 0->-4, -4->-9, -9->-15,-15->-22,-22->-30

#bubbles: 12->-1,-1->-2,-2->-3,-3->-4

#exercise 4
years <- c( 2015, 2016, 2018, 2020, 2021)
for(ii in 1:length(years)){
  if(years[ii] %% 2 == 0){
    cat(years[ii], 'Hooray, congressional elections!', sep = '\t', fill = TRUE)
  }
  if(years[ii] %% 4 == 0){
    cat(years[ii], 'Hooray, presidential elections!', sep = '\t', fill = TRUE)
  }
}

#exercise 5

bankAccounts <- c(10, 9.2, 5.6, 3.7, 8.8, 0.5);
interestRate <- 0.0125;
compounded <- numeric(length(bankAccounts))
for (i in 1:length(bankAccounts)) {
  compounded[i] <- interestRate*bankAccounts[i] + bankAccounts[i]; 
}

#exercise 6

bankAccounts <- c(10, 9.2, 5.6); #define bank accounts here
interestRate <- 0.0525;   
house <- c(4.8, 3.8, 5.7); #deduct
food<- c(3.5, 4.3, 5.0);    #deduct
fun <- c(7.8, 2.1, 10.5);  #deduct
#and incomes (through TAships) of 
income <- c(21, 21, 21); #add this

for (j in 1:5) {
  for (i in 1:length(bankAccounts)) {
    bankAccounts[i] <- (1+interestRate)*(bankAccounts[i]-house[i]-food[i]-fun[i]+income[i]) 
  }
}
bankAccounts

#exercise 7

interestRate <- 0.0525;   
bankAccounts <- c(10, 9.2, 5.6)
house <- c(4.8, 3.8, 5.7); 
food<- c(3.5, 4.3, 5.0); 
fun <- c(7.8, 2.1, 10.5); 
income <- c(21, 21, 21);

for (j in 2015:2020) {
  for (i in 1:length(bankAccounts)) {
    bankAccounts[i] <- (1+interestRate)*(bankAccounts[i]-house[i]-food[i]-fun[i]+income[i]) 
  }
  if(j%%2==1){
    bankAccounts[-2] <- bankAccounts[-2] + 5000 #add $5000 to bank accounts 1 and 3 during odd years
  }
}
bankAccounts

##exercise 8

i <- 1
sum <-0
while(i<18){
  sum <- sum+i
  i <- i+1
}
sum


##exercise 9

measure <- function(x){
  if(x<=-1){
    print("small")
  }
  if(-1<x & x<1){
    print("medium")
  }
  if(x>=1){
    print("large")
  }
}
