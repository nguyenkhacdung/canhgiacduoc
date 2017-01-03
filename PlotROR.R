
PlotROR=function(x,y,ymin,ymax){
  ggplot(aes(x,y)) + 
  geom_errorbar(aes(ymin, ymax), colour="black", width=.2) +
  geom_point( size=3, shape=21, fill="white") + # 21 is filled circle
  xlab(NULL) +
  ylab("Odd Ratios Adjusted") +
  geom_hline(yintercept=1, color="red", alpha=0.4,lwd=1.5) +
  coord_flip()+
  theme_bw() + ylim(0,8) 
}
