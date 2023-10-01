# 

Function ``stl.fit()`` from [Cristina, S.; Cordeiro, C.; Lavender, S.; Costa Goela, P.; Icely, J.; Newton, A. MERIS Phytoplankton Time Series Products from the SW Iberian Peninsula (Sagres) Using Seasonal-Trend Decomposition Based on Loess. Remote Sens. 2016, 8, 449](https://doi.org/10.3390/rs8060449).

The procedure starts by setting a benchmark model ``stl(time series, s.window = ”periodic”)``. It then selects the best STL (Seasonal-Trend decomposition based on Loess) by varying the values of the smoothing parameters based on minimizing the error measure. Note that it can be a time-consuming algorithm for long time series.

`stl.fit()` is a useful tool for any remote sensing study of time series, particularly those addressing inter-annual variations. The year-to-year variation of the seasonal component can be seen more clearly over time, and thus, any marked changes in the seasonal pattern can be easily identified.


```R
> install.packages('forecast')
```

`fit<-stl.fit(y, k, rob)`

**input:** 

`y`: time series

`k`: is an integer; example, k=2 for RMSE, k=1 for ME, k=3 for MAE ...use accuracy() function from package forecast
 
`rob`: TRUE/FALSE  # Perform an outliers inspection and set the "rob" argument accordingly to the analysis
 

**output:**
 
`fit$measure` to access the value of the error measure used
 
`fit$stl` in common with the R function stl() 

example: use `fit$stl$time.series[,"seasonal"]` to access the seasonal component

Remark: The `stl.fit()` function was updated in June 2023 and now executes more quickly. The computational work was performed by Sara V. Domingos (CEAUL Grant UIDP/00006/2020 funded by Fundação para a Ciência e a Tecnologia), Clara Cordeiro (DM-FCT, UAlg and CEAUL) and Celestino Coelho (DM-FCT,UAlg).
