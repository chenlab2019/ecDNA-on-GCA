#################################################
#  File Name:maftool.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Sun 03 May 2020 08:12:24 PM UTC
#################################################

library(maftools)
gas = read.maf(maf="merge.maf",clinicalData='clin3.txt',vc_nonSyn=c("Frame_Shift_Del", "Frame_Shift_Ins", "Splice_Site", "Translation_Start_Site","Nonsense_Mutation", "Nonstop_Mutation", "In_Frame_Del","In_Frame_Ins", "Missense_Mutation","Intron","IGR","3'UTR","5'Flank","5'UTR"))
save.image('maftools.all.Rdata')

pdf('01.mafSummary.pdf',height = 6,width = 8)
plotmafSummary(maf=gas, rmOutlier=FALSE, addStat="median", dashboard=TRUE, titvRaw = FALSE)
dev.off()

pdf('02.oncoplot.pdf',height = 6,width = 8)
oncoplot(maf=gas, top=20, borderCol=NULL,writeMatrix=TRUE,showTumorSampleBarcodes=FALSE)
dev.off()

mygenes = c("TP53", "CDH1", "PIK3CA")
pdf('02.threegeneoncoplot.pdf',height = 6,width = 8)
oncoplot(maf=gas,  genes = mygenes, borderCol=NULL,writeMatrix=TRUE,showTumorSampleBarcodes=FALSE)
dev.off()

laml.titv = titv(maf = gas, plot = FALSE, useSyn = TRUE)
pdf('03.TiTvplot.pdf',height = 6,width = 8)
plotTiTv(res = laml.titv)
dev.off()
#
#pdf('04.rainfallplot.pdf',height = 6,width = 8)
#rainfallPlot(maf = gas, detectChangePoints = TRUE, pointSize = 0.6)
#dev.off()
pdf('05.TP53.survival_analysis.pdf',height = 6,width = 8)
mafSurvival(maf=gas,genes='TP53',time='days_to_last_followup',Status='Overall_Survival_Status',isTCGA=TRUE)
dev.off()
pdf('05.EGFR.survival_analysis.pdf',height = 6,width = 8)
mafSurvival(maf=gas,genes='EGFR',time='days_to_last_followup',Status='Overall_Survival_Status',isTCGA=TRUE)
dev.off()
pdf('06.interation.pdf',height = 6,width = 8)
somaticInteractions(maf = gas, top = 25, pvalue = c(0.05, 0.1))
dev.off()
