#################################################
#  File Name:plotchr8.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Fri 29 May 2020 09:00:39 AM UTC
#################################################
args = commandArgs(T)
library(karyoploteR)
library(Cairo)
data = read.table(args[1],header=F)
x = data$V2
y = data$V4

#pdf(paste(args[2],'chr7.pdf',sep='.'), width=10, height=6)
#kp <- plotKaryotype(chromosomes="chr7")
#kpAddBaseNumbers(kp,tick.dist = 5000000,tick.col="red", cex=1)
#kpPoints(kp, chr="chr7", x=x, y=y,ymax=500,col="red")
#dev.off()

library(biomaRt)
library(regioneR)
gene.symbols <- c("EGFR","CDK6")
ensembl <- useEnsembl(biomart="ensembl", dataset="hsapiens_gene_ensembl",GRCh = "37")
genes <- toGRanges(getBM(attributes=c('chromosome_name', 'start_position', 'end_position', 'hgnc_symbol'),filters = 'hgnc_symbol', values =gene.symbols, mart = ensembl))
seqlevelsStyle(genes) <- "UCSC"

markers <- data.frame(chr=rep("chr7",10), pos=c(54699465,55286757,55289060,55366803,55369881,56217749,56220248,56384306,92182309,92763055), labels=c("chr7_seg1_start","chr7_seg1_end","chr7_seg2_start","chr7_seg2_end","chr7_seg3_start","chr7_seg3_end","chr7_seg4_start","chr7_seg4_end","chr7_seg5_start","chr7_seg5_end"))

zoom.region <- toGRanges(data.frame("chr7", 54e6, 57e6))
pdf(paste(args[2],'DHG00025_chr7.zoom.pdf',sep='.'), width=6, height=4)
kp <- plotKaryotype(chromosomes="chr7",zoom=zoom.region,plot.type=4)
kpAddBaseNumbers(kp,tick.dist = 1000000, minor.tick.dist = 500000,tick.col="#006064", cex=0.8)
kpPoints(kp, chr="chr7", x=x, y=y,ymax=1600,col="#006064")
kpAxis(kp,numticks = 5,ymin=0, ymax=16)
#kpPlotMarkers(kp, data=genes, labels=genes$hgnc_symbol,line.color = "red")
kpPlotMarkers(kp,chr=markers$chr, x=markers$pos, labels=markers$labels,line.color = "red")
dev.off()
zoom.region <- toGRanges(data.frame("chr7", 92e6, 93.5e6))
pdf(paste(args[2],'DHG00025_chr7.zoom2.pdf',sep='.'), width=6, height=4)
kp <- plotKaryotype(chromosomes="chr7",zoom=zoom.region,plot.type=4)
kpAddBaseNumbers(kp,tick.dist = 1000000, minor.tick.dist = 500000,tick.col="#006064", cex=0.8)
kpPoints(kp, chr="chr7", x=x, y=y,ymax=1600,col="#006064")
kpAxis(kp,numticks = 5,ymin=0, ymax=16)
#kpPlotMarkers(kp, data=genes, labels=genes$hgnc_symbol,line.color = "red")
kpPlotMarkers(kp,chr=markers$chr, x=markers$pos, labels=markers$labels,line.color = "red")
dev.off()
