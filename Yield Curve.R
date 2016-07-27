require(xts)
require(YieldCurve)
data(FedYieldCurve)
first(FedYieldCurve,'3 month')
last(FedYieldCurve,'1 year')
mat<-c(3/12, 0.5, 1,2,3,5,7,10)
par(mfrow=c(2,3))
for( i in c(1,2,3,370,371,372) ){
  plot(mat, FedYieldCurve[i,], type="o", xlab="Maturities structure in years", ylab="Interest rates values")
  title(main=paste("Federal Reserve yield curve obeserved at",time(FedYieldCurve[i], sep=" ") ))
  grid()
}
#-----------------
data(ECBYieldCurve)
maturity.ECB <- c(0.25,0.5,seq(1,30,by=1))
A <- Svensson(ECBYieldCurve[1:10,], maturity.ECB )
Svensson.rate <- Srates( A, maturity.ECB, "Spot" )
plot(maturity.ECB, Svensson.rate[5,],main="Fitting Svensson yield curve",
     xlab=c("Pillars in years"), type="l", col=3)
lines( maturity.ECB, ECBYieldCurve[5,],col=2)
legend("topleft",legend=c("fitted yield curve","observed yield curve"),
       col=c(3,2),lty=1)
grid()
library(Quandl)
Quandl("USTREASURY/YIELD", api_key="joNszWzKU-LCs9WWmWZp")
YC <- Quandl("USTREASURY/YIELD", api_key="joNszWzKU-LCs9WWmWZp")
