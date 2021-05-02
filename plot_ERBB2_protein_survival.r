#################################################
#  File Name:plot.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Wed 18 Nov 2020 09:57:56 PM UTC
#################################################

library(survminer)
library(ggplot2)
library(survival)
all_sample = read.table('1668.samples.status.csv',header=T)
all_sample$Expression=factor(all_sample$Expression,levels = c("positive","negative"))
fit=survfit(Surv(years,status)~Expression,data=all_sample)
ggsurvplot(fit,pval = T)
ggsave(filename="all_erbb2_survival_plot.pdf",width=6,height=4)

all_sample_10=all_sample[all_sample$years<10,]
all_sample_10$Expression=factor(all_sample_10$Expression,levels = c("positive","negative"))
fit2=survfit(Surv(years,status)~Expression,data=all_sample_10)
all_erbb2_10=ggsurvplot(fit2,pval = T)
ggsave(filename="Y10_erbb2_survival_plot.pdf",width=6,height=4)

all_sample3=all_sample[all_sample$years<7,]
all_sample3$Expression=factor(all_sample3$Expression,levels = c("positive","negative"))
fit3=survfit(Surv(years,status)~Expression,data=all_sample3)
all_erbb2_7=ggsurvplot(fit3,pval = T)
ggsave(filename="Y7_erbb2_survival_plot.pdf",width=6,height=4)

all_sample4=all_sample[all_sample$years<7 & all_sample$years>2,]
all_sample4$Expression=factor(all_sample4$Expression,levels = c("positive","negative"))
fit4=survfit(Surv(years,status)~Expression,data=all_sample4)
all_erbb2_2_6=ggsurvplot(fit4,pval = T,pval.coord=c(4,0.25),xlim=c(2.2,7),break.x.by=1)
ggsave(filename="Y2_Y6_erbb2_survival_plot.pdf",width=6,height=4)
