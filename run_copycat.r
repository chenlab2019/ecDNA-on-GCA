#################################################
#  File Name:cnv.r
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Fri 05 Jun 2020 11:38:23 AM UTC
#################################################
library(copyCat)
runPairedSampleAnalysis(annotationDirectory="/disk1/pengweixing/database/copycat", outputDirectory="NR140912-31", 
		    normal="/disk1/pengweixing/gastric_wgs/06.sv/cnv/bam/C_NR140912-32.bam.window",
		    tumor="/disk1/pengweixing/gastric_wgs/06.sv/cnv/bam/M_NR140912-31.bam.window",
	            inputType="bins",
		    fdr=0.05,
		    maxCores=12,
                    binSize=0, #infer automatically from bam-window output
                    perLibrary=1, #correct each library independently
                    perReadLength=1, #correct each read-length independently
                    verbose=TRUE,
                    minWidth=3, #minimum number of consecutive winds need to call CN
                    minMapability=0.6, #a good default
                    dumpBins=TRUE,
                    doGcCorrection=TRUE,
                    samtoolsFileFormat="unknown", #will infer automatically - mpileup 10col or VCF
                    purity=1,
                    normalSamtoolsFile=NULL,
                    tumorSamtoolsFile=NULL)  #uses the VAFs of mpileup SNPs to infer copy-neutral regions
