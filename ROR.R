#FUNCTION#
library(dplyr)
library(ggplot2)
### OR calculation with CI 95%
OR95=function(x){
  return(exp(cbind(OR=coef(x), confint(x))))
  }

### Plot ROR with CI 95%
plotROR=function(df){
  localenv = environment()#If fun is a function or a formula then environment(fun) returns the environment associated with that function or formula.
  # If fun is NULL then the current evaluation environment is returned.
  ggplot(df,aes(x=Cepha), environment = localenv ) + 
  geom_errorbar(aes(ymin=lower, ymax=upper), colour="black", width=.2) +
  geom_point( aes(y=OR),size=3, shape=21, fill="white") + # 21 is filled circle
  xlab(NULL) +
  ylab("Odd Ratios Adjusted") +
  geom_hline(yintercept=1, color="red", alpha=0.4,lwd=1.5) +
  coord_flip()+
  theme_bw() + ylim(0,8) 
}
