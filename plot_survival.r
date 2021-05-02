#################################################
#  File Name:plot2.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Fri 12 Mar 2021 12:02:53 PM UTC
#################################################
library(ggplot2)
library(ggrepel)
library(ggpubr)
library(reshape2)


data = read.table("gene.cp.ecDNA.all.pheno",header = T)
CCNE1 = data[data$gene=="CCNE1",]
ERBB2 = data[data$gene=="ERBB2",]
EGFR = data[data$gene=="EGFR",]
row.names(CCNE1)=CCNE1$sample
row.names(ERBB2)=ERBB2$sample
row.names(EGFR)=EGFR$sample

#table_egfr = data.frame(CNV=c(0,0),ecDNA=c(0,0))
#row.names(table_egfr)=c("male","female")
#table_egfr[1,]=c(length(which(EGFR$type=="CNV"&EGFR$Sex=="male")),length(which(EGFR$type=="ecDNA"&EGFR$Sex=="male"))) 
#table_egfr[2,]=c(length(which(EGFR$type=="CNV"&EGFR$Sex=="female")),length(which(EGFR$type=="ecDNA"&EGFR$Sex=="female"))) 
#chis_egfr = chisq.test(table_egfr)
#corr1 <- paste("Chi-square test. = ", round(chis_egfr$p.value,2), sep="")
#p1 = ggplot(data = EGFR)+geom_point(aes(x = log(copy_number),y=Sex,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Sex,label=rownames(EGFR)),max.overlaps = 30)+geom_text(aes(3,"male",label=corr1))
#table_egfr$sex=c("male","female")
#table_egfr_bar = melt(table_egfr,id.vars = "sex")
#table_egfr_bar$variable=factor(table_egfr_bar$variable,levels=c("ecDNA","CNV"))
#p1_bar = ggplot(data=table_egfr_bar)+geom_bar(aes(x=sex,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))
#
#table_erbb2 = data.frame(CNV=c(0,0),ecDNA=c(0,0))
#row.names(table_erbb2)=c("male","female")
#table_erbb2[1,]=c(length(which(ERBB2$type=="CNV"&ERBB2$Sex=="male")),length(which(ERBB2$type=="ecDNA"&ERBB2$Sex=="male"))) 
#table_erbb2[2,]=c(length(which(ERBB2$type=="CNV"&ERBB2$Sex=="female")),length(which(ERBB2$type=="ecDNA"&ERBB2$Sex=="female"))) 
#chis_erbb2 = chisq.test(table_erbb2)
#corr2 <- paste("Chi-square test. = ", round(chis_erbb2$p.value,2), sep="")
#p2 = ggplot(data = ERBB2)+geom_point(aes(x = log(copy_number),y=Sex,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Sex,label=rownames(ERBB2)),max.overlaps = 30)+geom_text(aes(2,"male",label=corr2))
#table_erbb2$sex=c("male","female")
#table_erbb2_bar = melt(table_erbb2,id.vars = "sex")
#table_erbb2_bar$variable=factor(table_erbb2_bar$variable,levels=c("ecDNA","CNV"))
#p2_bar = ggplot(data=table_erbb2_bar)+geom_bar(aes(x=sex,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))
#
#table_ccne1 = data.frame(CNV=c(0,0),ecDNA=c(0,0))
#row.names(table_ccne1)=c("male","female")
#table_ccne1[1,]=c(length(which(CCNE1$type=="CNV"&CCNE1$Sex=="male")),length(which(CCNE1$type=="ecDNA"&CCNE1$Sex=="male"))) 
#table_ccne1[2,]=c(length(which(CCNE1$type=="CNV"&CCNE1$Sex=="female")),length(which(CCNE1$type=="ecDNA"&CCNE1$Sex=="female"))) 
#chis_erbb2 = chisq.test(table_ccne1)
#corr3 <- paste("Chi-square test. = ", round(chis_erbb2$p.value,2), sep="")
#p3 = ggplot(data = CCNE1)+geom_point(aes(x = log(copy_number),y=Sex,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Sex,label=rownames(CCNE1)),max.overlaps = 30)+geom_text(aes(3,"male",label=corr3))
#table_ccne1$sex=c("male","female")
#table_ccne1_bar = melt(table_ccne1,id.vars = "sex")
#table_ccne1_bar$variable=factor(table_ccne1_bar$variable,levels=c("ecDNA","CNV"))
#p3_bar = ggplot(data=table_ccne1_bar)+geom_bar(aes(x=sex,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))
#
#ggsave('EGFR.sex.copynumber.pdf',plot=p1,width=6,height=4)
#ggsave('ERBB2.sex.copynumber.pdf',plot=p2,width=6,height=4)
#ggsave('CCNE1.sex.copynumber.pdf',plot=p3,width=6,height=4)
#ggsave('EGFR.sex.copynumber.bar.pdf',plot=p1_bar,width=6,height=4)
#ggsave('ERBB2.sex.copynumber.bar.pdf',plot=p2_bar,width=6,height=4)
#ggsave('CCNE1.sex.copynumber.bar.pdf',plot=p3_bar,width=6,height=4)
#
#compaired2=list(c("CNV","ecDNA"))
#p1 = ggplot(data = EGFR)+geom_point(aes(x = log(copy_number),y=Age_at_diagnosis,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Age_at_diagnosis,label=rownames(EGFR)),max.overlaps = 30)
#p1_box=ggboxplot(EGFR,x="type",y="Age_at_diagnosis",add="jitter",add.params=list(shape=21, fill="orange", size=3))+geom_signif(comparisons = compaired2,step_increase = 0.1,map_signif_level = F,test = t.test)
#p2 = ggplot(data = ERBB2)+geom_point(aes(x = log(copy_number),y=Age_at_diagnosis,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Age_at_diagnosis,label=rownames(ERBB2)),max.overlaps = 30)
#p2_box=ggboxplot(ERBB2,x="type",y="Age_at_diagnosis",add="jitter",add.params=list(shape=21, fill="orange", size=3))+geom_signif(comparisons = compaired2,step_increase = 0.1,map_signif_level = F,test = t.test)
#p3 = ggplot(data = CCNE1)+geom_point(aes(x = log(copy_number),y=Age_at_diagnosis,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Age_at_diagnosis,label=rownames(CCNE1)),max.overlaps = 30)
#p3_box=ggboxplot(CCNE1,x="type",y="Age_at_diagnosis",add="jitter",add.params=list(shape=21, fill="orange", size=3))+geom_signif(comparisons = compaired2,step_increase = 0.1,map_signif_level = F,test = t.test)
#ggsave('EGFR.Age.copynumber.pdf',plot=p1,width=6,height=4)
#ggsave('ERBB2.Age.copynumber.pdf',plot=p2,width=6,height=4)
#ggsave('CCNE1.Age.copynumber.pdf',plot=p3,width=6,height=4)
#ggsave('EGFR.Age.box.copynumber.pdf',plot=p1_box,width=6,height=4)
#ggsave('ERBB2.Age.box.copynumber.pdf',plot=p2_box,width=6,height=4)
#ggsave('CCNE1.Age.box.copynumber.pdf',plot=p3_box,width=6,height=4)

table_uicc = data.frame(CNV=c(0,0),ecDNA=c(0,0))
row.names(table_uicc)=c("III","II")
table_uicc[1,]=c(length(which(EGFR$type=="CNV"&EGFR$UICC_stage_6th=="III")),length(which(EGFR$type=="ecDNA"&EGFR$UICC_stage_6th=="III"))) 
table_uicc[2,]=c(length(which(EGFR$type=="CNV"&EGFR$UICC_stage_6th=="II")),length(which(EGFR$type=="ecDNA"&EGFR$UICC_stage_6th=="II"))) 
chis_uicc1 = chisq.test(table_uicc)
uicc1 <- paste("Chi-square test. = ", round(chis_uicc1$p.value,2), sep="")
p1 = ggplot(data = EGFR)+geom_point(aes(x = log(copy_number),y = UICC_stage_6th, size=year, color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),UICC_stage_6th,label=rownames(EGFR)),max.overlaps = 30)+geom_text(aes(3,"III",label=uicc1))

table_uicc$UICC_stage_6th=c("III","II")
table_uicc_bar = melt(table_uicc,id.vars = "UICC_stage_6th")
table_uicc_bar$variable=factor(table_uicc_bar$variable,levels=c("ecDNA","CNV"))
p1_bar = ggplot(data=table_uicc_bar)+geom_bar(aes(x=UICC_stage_6th,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))

table_uicc2 = data.frame(CNV=c(0,0),ecDNA=c(0,0))
row.names(table_uicc2)=c("III","II")
table_uicc2[1,]=c(length(which(ERBB2$type=="CNV"&ERBB2$UICC_stage_6th=="III")),length(which(ERBB2$type=="ecDNA"&ERBB2$UICC_stage_6th=="III"))) 
table_uicc2[2,]=c(length(which(ERBB2$type=="CNV"&ERBB2$UICC_stage_6th=="II")),length(which(ERBB2$type=="ecDNA"&ERBB2$UICC_stage_6th=="II"))) 
chis_uicc2 = chisq.test(table_uicc2)
uicc2 <- paste("Chi-square test. = ", round(chis_uicc2$p.value,2), sep="")
p2 = ggplot(data = ERBB2)+geom_point(aes(x = log(copy_number),y = UICC_stage_6th, size=year, color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),UICC_stage_6th,label=rownames(ERBB2)),max.overlaps = 30)+geom_text(aes(3,"III",label=uicc2))

table_uicc2$UICC_stage_6th=c("III","II")
table_uicc2_bar = melt(table_uicc2,id.vars = "UICC_stage_6th")
table_uicc2_bar$variable=factor(table_uicc2_bar$variable,levels=c("ecDNA","CNV"))
p2_bar = ggplot(data=table_uicc2_bar)+geom_bar(aes(x=UICC_stage_6th,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))

table_uicc3 = data.frame(CNV=c(0,0),ecDNA=c(0,0))
row.names(table_uicc3)=c("III","II")
table_uicc3[1,]=c(length(which(CCNE1$type=="CNV"&CCNE1$UICC_stage_6th=="III")),length(which(CCNE1$type=="ecDNA"&CCNE1$UICC_stage_6th=="III"))) 
table_uicc3[2,]=c(length(which(CCNE1$type=="CNV"&CCNE1$UICC_stage_6th=="II")),length(which(CCNE1$type=="ecDNA"&CCNE1$UICC_stage_6th=="II"))) 
chis_uicc3 = chisq.test(table_uicc3)
uicc3 <- paste("Chi-square test. = ", round(chis_uicc3$p.value,2), sep="")
p3 = ggplot(data = CCNE1)+geom_point(aes(x = log(copy_number),y = UICC_stage_6th, size=year, color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),UICC_stage_6th,label=rownames(CCNE1)),max.overlaps = 30)+geom_text(aes(3,"III",label=uicc3))

table_uicc3$UICC_stage_6th=c("III","II")
table_uicc3_bar = melt(table_uicc3,id.vars = "UICC_stage_6th")
table_uicc3_bar$variable=factor(table_uicc3_bar$variable,levels=c("ecDNA","CNV"))
p3_bar = ggplot(data=table_uicc3_bar)+geom_bar(aes(x = UICC_stage_6th,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))

ggsave('EGFR.uicc.copynumber.pdf',plot=p1,width=6,height=4)
ggsave('ERBB2.uicc.copynumber.pdf',plot=p2,width=6,height=4)
ggsave('CCNE1.uicc.copynumber.pdf',plot=p3,width=6,height=4)
ggsave('EGFR.uicc.copynumber.bar.pdf',plot=p1_bar,width=6,height=4)
ggsave('ERBB2.uicc.copynumber.bar.pdf',plot=p2_bar,width=6,height=4)
ggsave('CCNE1.uicc.copynumber.bar.pdf',plot=p3_bar,width=6,height=4)
