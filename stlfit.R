stl.fit<-function(y,rob,k){
  
  ## nextodd from stl() 
  nextodd <- function(x) {
    x <- round(x)
    if (x%%2 == 0) 
      x <- x + 1
    as.integer(x)
  }
  aux<-c()
  fit<- stl(y, s.window ="periodic",robust=rob)
  d1<-fit$time.series[,"seasonal"]
  d2<-fit$time.series[,"trend"]
  fit1<-d1+d2
  m1<-accuracy(y,fit1)[k] 
  aux$measure<-m1
  aux$stlfit<-fit
  for (i in 7:length(y)){
    t.win<-nextodd(ceiling(1.5*frequency(y)/(1-1.5/i)))
    for (kk in t.win:length(y)){
      for (t in 0:1){
        for (w in 0:1){
          fit3<- stl(y,s.window =i,t.window=kk,s.degree=t,t.degree=w,robust=rob)
          d11<-fit3$time.series[,"seasonal"]
          d22<-fit3$time.series[,"trend"]
          fit2<-d11+d22
          m2<-accuracy(y,fit2)[k] 
          if(m2<m1){
            m1<-m2
            aux$measure<-m1
            aux$stlfit<-fit3
          }}}}}
  aux}
