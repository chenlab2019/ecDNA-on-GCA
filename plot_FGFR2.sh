#################################################
#  File Name:plot.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Sat 22 Aug 2020 02:17:41 PM UTC
#################################################

library(karyoploteR)
library(TxDb.Hsapiens.UCSC.hg19.knownGene)
library(org.Hs.eg.db)

circle.T.bigwig.file <- "/disk1/pengweixing/gastric_wgs/10.Circle_seq/01.mapping/NR140912-35-T.sort.rmdup.bam.bigWig"
circle.N.bigwig.file <- "/disk1/pengweixing/gastric_wgs/10.Circle_seq/01.mapping/NR140912-35-N.sort.rmdup.bam.bigWig"
wgs.T.bigwig.file <- "/disk1/pengweixing/gastric_wgs/01.mapping/NR140912-35/NR140912-35-N.wgs.bigWig"
wgs.N.bigwig.file <- "/disk1/pengweixing/gastric_wgs/01.mapping/NR140912-36/NR140912-36-N.wgs.bigWig"
myregion <- toGRanges("chr10:122,000,000-124,400,000")
pdf('FGFR2.zoom.pdf', width=11, height=7)
#png('FGFR2.zoom.png', width=1000, height=800)
kp <- plotKaryotype(zoom = myregion,plot.type=4)
kpAddBaseNumbers(kp, tick.dist = 500000, tick.len = 10, tick.col="red", cex=0.8,minor.tick.dist =100000, minor.tick.len = 5, minor.tick.col = "gray")
genes.data <- makeGenesDataFromTxDb(TxDb.Hsapiens.UCSC.hg19.knownGene,
                                    karyoplot=kp,
                                    plot.transcripts = TRUE,
                                    plot.transcripts.structure = TRUE)
genes.data <- addGeneNames(genes.data)
genes.data <- mergeTranscripts(genes.data)
kpPlotGenes(kp, data=genes.data, r0=0, r1=0.10, gene.name.cex = 0.7)
kpPlotBigWig(kp, data=circle.T.bigwig.file,ymin=0,ymax=800, r0=0.2, r1=0.35,col = "#FF7800",border="#FF7800")
kpAxis(kp, ymin=0, ymax=800, r0=0.2, r1=0.35)
kpAddLabels(kp, labels = "Circle-seq-T", r0=0.2, r1=0.35, cex=1.6, label.margin = 0.035)

kpPlotBigWig(kp, data=circle.N.bigwig.file,ymin=0,ymax=800, r0=0.4, r1=0.55,col = "#FF7800",border="#FF7800")
kpAxis(kp, ymin=0, ymax=800, r0=0.4, r1=0.55)
kpAddLabels(kp, labels = "Circle-seq-T", r0=0.4, r1=0.55, cex=1.6, label.margin = 0.035)

kpPlotBigWig(kp, data=wgs.T.bigwig.file,ymax=6000, r0=0.6, r1=0.75,col = "#028E98",border="#028E98")
kpAxis(kp, ymin=0, ymax=6000, r0=0.6, r1=0.75)
kpAddLabels(kp, labels = "Circle-seq-T", r0=0.6, r1=0.75, cex=1.6, label.margin = 0.035)

kpPlotBigWig(kp, data=wgs.N.bigwig.file,ymax=6000, r0=0.8, r1=0.95,col = "#028E98",border="#028E98")
kpAxis(kp, ymin=0, ymax=6000, r0=0.8, r1=0.95)
kpAddLabels(kp, labels = "Circle-seq-T", r0=0.8, r1=0.95, cex=1.6, label.margin = 0.035)
dev.off()
