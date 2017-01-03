OR95=function(x){
  return(exp(cbind(OR=coef(x), confint(x))))
  }
 
