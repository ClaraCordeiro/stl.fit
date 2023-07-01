stl.fit <- function(y,rob,k){
  nextodd <- function(x){
    x <- round(x)
    if (x%%2 == 0) 
      x <- x + 1
    as.integer(x)
  }
  aux <- c()
  fit <- stl(y, s.window = "periodic", robust = rob)
  fit2 <- fit$time.series[,"seasonal"] + fit$time.series[,"trend"]
  m1 <- accuracy(fit2,y)[k] 
  aux$measure <- m1
  aux$stl <- fit
  len <- min(5*frequency(y), length(y))
  i_range <- seq(7,len,2)
  for (i in i_range){
    t.win <- nextodd(ceiling(1.5*frequency(y)/(1-1.5/i)))
    kk_range <- seq(t.win,len,2)
    for (kk in kk_range){
      for (t in 0:1){
        for (w in 0:1){
          fit <- stl(y,
                     s.window = i,
                     t.window = kk,
                     s.degree = t,
                     t.degree = w,
                     robust=rob)
          fit2 <- fit$time.series[,"seasonal"] + fit$time.series[,"trend"]
          m2 <- accuracy(fit2,y)[k] 
          if (m2 < m1){
            m1 <- m2
            aux$measure <- m1
            aux$stl <- fit
          }
        }
      }
    }
  }
  aux
}

