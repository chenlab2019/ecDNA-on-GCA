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

table_egfr = data.frame(CNV=c(0,0),ecDNA=c(0,0))
row.names(table_egfr)=c("negative","positive")
table_egfr[1,]=c(length(which(EGFR$type=="CNV"&EGFR$Cigarette_smoking=="negative")),length(which(EGFR$type=="ecDNA"&EGFR$Cigarette_smoking=="negative"))) 
table_egfr[2,]=c(length(which(EGFR$type=="CNV"&EGFR$Cigarette_smoking=="positive")),length(which(EGFR$type=="ecDNA"&EGFR$Cigarette_smoking=="positive"))) 
chis_egfr = chisq.test(table_egfr)
corr1 <- paste("Chi-square test. = ", round(chis_egfr$p.value,2), sep="")
p1 = ggplot(data = EGFR)+geom_point(aes(x = log(copy_number),y=Cigarette_smoking,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Cigarette_smoking,label=rownames(EGFR)),max.overlaps = 30)+geom_text(aes(3,"negative",label=corr1))
table_egfr$Cigarette=c("negative","positive")
table_egfr_bar = melt(table_egfr,id.vars = "Cigarette")
table_egfr_bar$variable=factor(table_egfr_bar$variable,levels=c("ecDNA","CNV"))
p1_bar = ggplot(data=table_egfr_bar)+geom_bar(aes(x=Cigarette,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))

table_erbb2 = data.frame(CNV=c(0,0),ecDNA=c(0,0))
row.names(table_erbb2)=c("negative","positive")
table_erbb2[1,]=c(length(which(ERBB2$type=="CNV"&ERBB2$Cigarette_smoking=="negative")),length(which(ERBB2$type=="ecDNA"&ERBB2$Cigarette_smoking=="negative"))) 
table_erbb2[2,]=c(length(which(ERBB2$type=="CNV"&ERBB2$Cigarette_smoking=="positive")),length(which(ERBB2$type=="ecDNA"&ERBB2$Cigarette_smoking=="positive"))) 
chis_erbb2 = chisq.test(table_erbb2)
corr2 <- paste("Chi-square test. = ", round(chis_erbb2$p.value,2), sep="")
p2 = ggplot(data = ERBB2)+geom_point(aes(x = log(copy_number),y=Cigarette_smoking,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Cigarette_smoking,label=rownames(ERBB2)),max.overlaps = 30)+geom_text(aes(2,"negative",label=corr2))
table_erbb2$Cigarette=c("negative","positive")
table_erbb2_bar = melt(table_erbb2,id.vars = "Cigarette")
table_erbb2_bar$variable=factor(table_erbb2_bar$variable,levels=c("ecDNA","CNV"))
p2_bar = ggplot(data=table_erbb2_bar)+geom_bar(aes(x=Cigarette,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))

table_ccne1 = data.frame(CNV=c(0,0),ecDNA=c(0,0))
row.names(table_ccne1)=c("negative","positive")
table_ccne1[1,]=c(length(which(CCNE1$type=="CNV"&CCNE1$Cigarette_smoking=="negative")),length(which(CCNE1$type=="ecDNA"&CCNE1$Cigarette_smoking=="negative"))) 
table_ccne1[2,]=c(length(which(CCNE1$type=="CNV"&CCNE1$Cigarette_smoking=="positive")),length(which(CCNE1$type=="ecDNA"&CCNE1$Cigarette_smoking=="positive"))) 
chis_erbb2 = chisq.test(table_ccne1)
corr3 <- paste("Chi-square test. = ", round(chis_erbb2$p.value,2), sep="")
p3 = ggplot(data = CCNE1)+geom_point(aes(x = log(copy_number),y=Cigarette_smoking,size=year,color=type))+scale_color_manual(values=c("#666666","#FF0016"))+theme_bw()+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())+theme(axis.text  = element_text(color = "black"))+geom_text_repel(aes(log(copy_number),Cigarette_smoking,label=rownames(CCNE1)),max.overlaps = 30)+geom_text(aes(3,"negative",label=corr3))
table_ccne1$Cigarette=c("negative","positive")
table_ccne1_bar = melt(table_ccne1,id.vars = "Cigarette")
table_ccne1_bar$variable=factor(table_ccne1_bar$variable,levels=c("ecDNA","CNV"))
p3_bar = ggplot(data=table_ccne1_bar)+geom_bar(aes(x=Cigarette,y=value,fill=variable),stat="identity")+theme_bw()+scale_y_continuous(expand = c(0,0))+scale_fill_manual(values=c("#ED2026","#676767"))

ggsave('EGFR.Cigarette.copynumber.pdf',plot=p1,width=6,height=4)
ggsave('ERBB2.Cigarette.copynumber.pdf',plot=p2,width=6,height=4)
ggsave('CCNE1.Cigarette.copynumber.pdf',plot=p3,width=6,height=4)
ggsave('EGFR.Cigarette.copynumber.bar.pdf',plot=p1_bar,width=6,height=4)
ggsave('ERBB2.Cigarette.copynumber.bar.pdf',plot=p2_bar,width=6,height=4)
ggsave('CCNE1.Cigarette.copynumber.bar.pdf',plot=p3_bar,width=6,height=4)
