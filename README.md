# 

Function ``stl.fit()`` from *Cristina, S.; Cordeiro, C.; Lavender, S.; Costa Goela, P.; Icely, J.; Newton, A. MERIS Phytoplankton Time Series Products from the SW Iberian Peninsula (Sagres) Using Seasonal-Trend Decomposition Based on Loess. Remote Sens. 2016, 8, 449*. 

The procedure starts by setting a benchmark model ``stl()`` with ``s.window="periodic"``; then, varying the length of the seasonal and trend window for the loess regression; finally, the best fitting model is retained. To evaluate
the best fit using RMSE, the argument k = 2 was provided; alternatively, accuracy me

`stl.fit()` is a good tool for any remote sensing study of time series, particularly those addressing inter-annual variations.

```R
> install.packages('forecast')
```

fit<-stl.fit(y, k, rob)

**Arguments:** 

y: time series

k: is an integer; example, k=2 for RMSE, k=1 for ME, k=3 for MAE ...use accuracy() function from package forecast
 
rob: TRUE/FALSE    # perform an outliers inspection and set the "rob" argument accordingly to the analysis
 


**output:**
 
fit$measure to access the value of RMSE (or other)
 
fit$stlfit in common with the R function stl() 

example: use fit$stlfit$time.series[,"seasonal"] to access the seasonal component, for example
