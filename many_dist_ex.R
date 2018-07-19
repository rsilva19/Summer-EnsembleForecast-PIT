ndist <- 5000
mu <- 1:ndist             #5,000 different means
s <- rchisq(ndist, 3)     #5,000 different standard deviations.


dat1 <- rnorm(ndist, mean=mu, sd=s)   #ndist samples from varied normal dists. based on mu and s
# The true distributions consists of 10,000 normal distributions with their respective mean and standard deviation from chi-square, 10,000 exponential distributions with mu as their respective rates, and lastly, 10,000 chi-square distributiotns with mu as their respective degrees of freedom. 
qtiles1 <- pnorm(dat1, mean=mu, sd=s) #PIT values obtained by the true CDF of each respective normal dist. 

dat2 <- rexp(ndist, rate=mu)      #ndist samples from varied exponential distributions with mu as their resp. rates
qtiles2 <- pexp(dat2, rate=mu)    ##PIT values obtained by the true CDF of each respective exponential dist.

all_PIT_values<- c(qtiles1,qtiles2)   #combining all PIT values from different dist 

hist(all, freq=F, main='PIT Histogram')    
lines(s,dunif(s,0,1), col=2) 