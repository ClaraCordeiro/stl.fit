# STL.fit
 y -> time series
 rob=TRUE/FALSE    # perform an outliers inspection and set the "rob" argument accordingly to the analysis
 k is an integer; example, k=2 for RMSE, k=1 for ME, k=3 for MAE ...use accuracy() function from package forecast

library(forecast)

 output  example
 fit<-stl.fit(time series, TRUE, 1)  ## in this case the rob=TRUE and k=1-> ME
 fit$measure to access the value of RMSE
fit$stlfit to access the components
 fit$stlfit$time.series[,"seasonal"] to access the seasonal component, for example
