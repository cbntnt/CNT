# Let's define some sample data generating program
endog_OLS_data = function(nobs) {
  # Let's imagine that we are wondering if OLS is unbiased when we have a causal relationship between an unobserved variable z and the observed variables x2 and x3 and the unobserved error e.
  # x4 is an observed variable that has no relationship with any of the other variables.
  z = rnorm(nobs)
  x1 = rnorm(nobs)
  x2 = rnorm(nobs) + z
  x3 = rnorm(nobs) - z
  x4 = rnorm(nobs)
  
  e = rnorm(nobs)*2 + z
  
  y = 3 + x1 + x2 + x3 + 0*x4 + e
  data.frame(y, x1, x2, x3, x4)
}

sample_data = endog_OLS_data(10)
sample_data
# Everything appears to be working well

# Now let's define a sample estimation
OLS_est = function(temp_data) {
  # Summary grabs important values from the lm command and coef grabs the coefficients from the summary command.
  lm_coef = coef(summary(lm(y~x1+x2+x3+x4, data=temp_data)))
  
  # I want to reduce lm_coef to a single vector with values for each b, each se, and each t
  lm_b = c(lm_coef[,1])
  names(lm_b) = paste("b",0:(length(lm_b)-1),sep="")
  lm_se = c(lm_coef[,2])
  names(lm_se) = paste("se",0:(length(lm_se)-1),sep="")
  lm_se2 = c(lm_coef[,2])^2
  names(lm_se2) = paste("se2_",0:(length(lm_se2)-1),sep="")
  
  lm_rej = c(lm_coef[,4])<.1
  names(lm_rej) = paste("rej",0:(length(lm_rej)-1),sep="")
  c(lm_b,lm_se, lm_se2,lm_rej)
} 
OLS_est(sample_data)

# From this is it not obvious which estimates if any are biased.
# Of course our sample size is only 10 so this is no surprise.
# However, even at such a small sample size we can identify bias if we repeat the estimation many times.

# Let's try our MC_easy command.

MC_est = MC_easy(dgp="endog_OLS_data", estimator="OLS_est", obs=10, reps=500, save_data_index=1:5)
# We can see that our mean estimate on the coefficient is close to 3 which is correct.
# While b1 is close to 1 (unbiased hopefully) while b2 is too large and b3 too small and b4 is close to zero which is the true value.
# What is not possible to observe with 500 repetitions but capable of being observed with 5000 is that the standard error is a downward biased estimate of the standard deviation.
# This is a well known fact.  I think even there is a proof that there is no unbaised estimator for the standard error for the OLS estimator.
# However, se^2 is an unbiased estimator of the variance of the coefficients.
# Though the variance of se^2 is large, making it neccessary to have a large number of repetitions before this becomes apparent.
# The final term of interest is the rejection rates.  We should expect that for the coefficients b0-b3 that the rejections rates should be above random chance 10% (since there trully exists an effect) which is what they all ended up being though with b1 and b3 the rejection rate is only slightly above 20% which indicates that our power given our sample size given the effect size of x1 and x3 is pretty small.
# The final note is that though we do not have much power we are at least not overpowered when it comes to overrejecting the null when in fact the null is true.  For b4 the mean rejection rate is close to 10% which is the correct power.

# We can recreate the results table by accessing elements of the MC_est list returned from the function.
rbind(mean=mean(MC_est[[1]]),sd=sd(MC_est[[1]]),var=sd(MC_est[[1]])^2)

# We may also be curious about the medians and maxes.
summary(MC_est[[1]])

# Or we may like to check if our data was generated correctly
MC_est[[2]]