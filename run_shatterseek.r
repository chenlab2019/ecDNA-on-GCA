#################################################
#  File Name:shatter.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Sun 07 Jun 2020 10:12:23 AM UTC
#################################################

library(ShatterSeek)
library(ggplot2)
args = commandArgs(T)
sv = read.table(args[1],header=T)# sv_matrix
sv$chrom1=sub("chr","",sv$chrom1)
sv$chrom2=sub("chr","",sv$chrom2)
a=unique(c(which(sv$chrom1=="M"),which(sv$chrom1=="Y"),which(sv$chrom2=="Y"),which(sv$chrom2=="M")))
if(length(a)>0){
sv2 = sv[-a,]
sv = sv2
}
cn = read.table(args[2],header=F)# cnv
colnames(cn)=c("chromosome","start","end","total_cn")
b=unique(c(which(cn$chromosome=="chrY"),which(cn$chromosome=="chrM")))
if(length(b)>0){
cn2 = cn[-b,]
cn = cn2
}
cn$chromosome=sub("chr","",cn$chromosome)
CN_data = CNVsegs(chrom=as.character(cn$chromosome),start=cn$start,end=cn$end,total_cn=cn$total_cn)
SV_data = SVs(chrom1=as.character(sv$chrom1),pos1=as.numeric(sv$start1),chrom2=as.character(sv$chrom2),pos2=as.numeric(sv$end2),SVtype=as.character(sv$svclass),strand1=as.character(sv$strand1),strand2=as.character(sv$strand2))
chromothripsis = shatterseek(SV.sample=SV_data,seg.sample=CN_data)
b = chromothripsis@chromSummary
#hc_index1 = which(b$clusterSize_including_TRA>6 & b$max_number_oscillating_CN_segments_2_states>7 & b$pval_fragment_joins<0.05 & (b$chr_breakpoint_enrichment<0.05 | b$pval_exp_cluster <0.05))
hc_index1 = which(b$clusterSize_including_TRA>6 & b$max_number_oscillating_CN_segments_2_states>7)
hc_index3 = which(b$clusterSize_including_TRA>6 & b$max_number_oscillating_CN_segments_3_states>5)
#hc_index2 = which((b$inter_number_DEL+b$inter_number_DUP+b$inter_number_h2hINV+b$inter_number_t2tINV)>4 & b$clusterSize_including_TRA & b$max_number_oscillating_CN_segments_2_states>7 & b$pval_fragment_joins<0.05)
hc_index2 = which((b$inter_number_DEL+b$inter_number_DUP+b$inter_number_h2hINV+b$inter_number_t2tINV)>4 & b$clusterSize_including_TRA & b$max_number_oscillating_CN_segments_2_states>7 & b$pval_fragment_joins>0.5)
hc_index = unique(c(hc_index1,hc_index2,hc_index3))
#lc_index = which(b$clusterSize_including_TRA>6 & b$max_number_oscillating_CN_segments_2_states<7 & b$max_number_oscillating_CN_segments_2_states>2 & b$pval_fragment_joins<0.05 & (b$chr_breakpoint_enrichment<0.05 | b$pval_exp_cluster <0.05))
lc_index = which(b$clusterSize_including_TRA>6 & b$max_number_oscillating_CN_segments_2_states<=7 & b$max_number_oscillating_CN_segments_2_states>2)
b_hc = b[hc_index,]
b_lc = b[lc_index,]
b_hc$inter_other_chroms_coords_all=gsub('\n',';',b_hc$inter_other_chroms_coords_all)
b_lc$inter_other_chroms_coords_all=gsub('\n',';',b_lc$inter_other_chroms_coords_all)
write.table(file="chromothripis_hc.matrix",b_hc,sep="\t",quote=FALSE,row.names=F)
write.table(file="chromothripis_lc.matrix",b_lc,sep="\t",quote=FALSE,row.names=F)
write.table(file="chromothripis_all.matrix",b,sep="\t",quote=FALSE,row.names=F)
library(gridExtra)
library(cowplot)
save.image("my.Rdata")
for(i in b_hc$chrom){
	assign(paste("plots_chr",i,sep=""),plot_chromothripsis(ShatterSeek_output = chromothripsis,chr=i))
	plot_chr = arrangeGrob(get(paste("plots_chr",i,sep=""))[[1]],get(paste("plots_chr",i,sep=""))[[2]],get(paste("plots_chr",i,sep=""))[[3]],get(paste("plots_chr",i,sep=""))[[4]],nrow=4,ncol=1,heights=c(0.2,.4,.4,.4))
#	pdf(paste(args[3],"_HC_chr",i,".pdf",sep=""),width=8,height=5)
        temp=plot_grid(plot_chr)
	ggsave(paste(args[3],"_HC_chr",i,".pdf",sep=""),plot=temp,width = 7,height = 4)
#	dev.off()
}
for(i in b_lc$chrom){
	assign(paste("plots_chr",i,sep=""),plot_chromothripsis(ShatterSeek_output = chromothripsis,chr=i))
	plot_chr = arrangeGrob(get(paste("plots_chr",i,sep=""))[[1]],get(paste("plots_chr",i,sep=""))[[2]],get(paste("plots_chr",i,sep=""))[[3]],get(paste("plots_chr",i,sep=""))[[4]],nrow=4,ncol=1,heights=c(0.2,.4,.4,.4))
#	pdf(paste(args[3],"_LC_chr",i,".pdf",sep=""),width=8,height=5)
	temp=plot_grid(plot_chr)
	ggsave(paste(args[3],"_LC_chr",i,".pdf",sep=""),plot=temp,width = 7,height = 4)
#	dev.off()
}
#plots_chr11=plot_chromothripsis(ShatterSeek_output = chromothripsis,chr=11)
#plot_chr = arrangeGrob(plots_chr11[[1]],plots_chr11[[2]],plots_chr11[[3]],plots_chr11[[4]],nrow=4,ncol=1,heights=c(0.2,.4,.4,.4))
#pdf(paste(args[3],"_chr",11,".pdf",sep=""),width=8,height=5)
#plot(plot_chr)
#dev.off()
dev.off()
