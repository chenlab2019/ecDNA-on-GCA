#################################################
#  File Name:cancer_diff_matrix_heatmap.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Tue 03 Mar 2020 09:00:09 AM UTC
#################################################
library(ggplot2)
args = commandArgs(T)
data = read.table(args[1],header = T,row.names = 1)
info = read.table('information3',header=T,row.names=1)
library(pheatmap)
pdf(paste(args[1],".pdf",sep=""),height = 7,width = 9)
pheatmap(data[1:30,],cluster_rows = 0,cluster_cols = 0,color =  c("white","#285943"),annotation_col = info)
dev.off()
ecDNA_dist2=data[1:30,]
ecDNA_each_row=as.data.frame(apply(ecDNA_dist2,1, sum))
ecDNA_each_col=as.data.frame(apply(ecDNA_dist2,2,sum))
colnames(ecDNA_each_col)="number"
colnames(ecDNA_each_row)="number"
ecDNA_each_row$id=seq(1:30)
ecDNA_each_col$id=seq(1:36)
#p_row=ggplot(data=ecDNA_each_row)+geom_bar(aes(x=id,y=number),stat="identity",fill="#F47621")+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
ecDNA_each_row$Freq = ecDNA_each_row$number/36
p_row=ggplot(data=ecDNA_each_row)+geom_bar(aes(x=id,y=Freq),stat="identity",fill="#FF8300")+theme_bw()+
save.image("gastric.heat.Rdata")
ggsave(file="ecDNA.oncogene.matrix2.row.pdf",plot=p_row,width=8,height=4)
#ggsave(file="ecDNA.oncogene.matrix2.col.pdf",plot=p_col,width=8,height=4)

