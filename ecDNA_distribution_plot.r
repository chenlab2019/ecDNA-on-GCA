#################################################
#  File Name:plot.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Fri 28 Aug 2020 02:01:13 PM UTC
#################################################
library(ggplot2)
library(pheatmap)
data1 = read.table("hg19.10M.ecDNA.dist.map.matrix",header = T,row.names = 1)
pdf("hg19.10M.ecDNA.dist.map.matrix.pdf",width=6,height=6)
pheatmap(data1,cluster_rows = 0,cluster_cols = 0,color =  c("white","#285943"),show_rownames = F)
dev.off()
data_10M_sum=as.data.frame(apply(data1,1,sum))
colnames(data_10M_sum)="Freq."
data_10M_sum=data_10M_sum/36
data_10M_sum$ID=seq(1,322,1)
pdf("hg19.10M.ecDNA.dist.map.bar.pdf",width=6,height=6)
ggplot(data=data_10M_sum)+geom_bar(aes(y=Freq.,x=ID),stat="identity",color="#285943")+theme(panel.grid.major = element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())
dev.off()

data_10M_col=as.data.frame(apply(data1,2,sum))
colnames(data_10M_col)="Freq."
data_10M_coll=data_10M_col/322
data_10M_sum$ID=seq(1,322,1)
