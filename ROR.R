#FUNCTION#
library(dplyr)
library(ggplot2)
### OR calculation with CI 95%
OR95=function(mod){
  return(exp(cbind(OR=coef(mod), confint(mod)))%>% #khoang tin cay 95% cua ROR tinh toan tu mo hinh
           as.data.frame() %>% #chuyen thanh data frame de doi ten bien
           setNames(., c("OR", "lower","upper"))) # doi ten bien
  }

### Plot ROR with CI 95%
plotROR=function(df,Year){
  localenv = environment()#If fun is a function or a formula then environment(fun) returns the environment associated with that function or formula.
  # If fun is NULL then the current evaluation environment is returned.
  ggplot(df,aes(x=Cepha), environment = localenv ) + 
  geom_errorbar(aes(ymin=lower, ymax=upper), colour="black", width=.2) +
  geom_point( aes(y=OR),size=3, shape=21, fill="white") + # 21 is filled circle
  xlab(NULL) +
  ylab("Odd Ratios Adjusted") +
  ggtitle(paste0("ROR (Adj) of  antibiotic induced Shock Jan.2010-Dec.",Year))+
  geom_hline(yintercept=1, color="red", alpha=0.4,lwd=1.5) +
  
  theme_bw() + #ylim(0,8) 
  coord_flip(ylim=c(0,10)) 
}
