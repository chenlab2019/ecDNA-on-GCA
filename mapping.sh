#################################################
#  File Name:map.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Tue 14 Jan 2020 09:48:59 AM UTC
#################################################

bwa mem -t 50 /disk1/pengweixing/software/sc-atac/refdata-cellranger-atac-hg19-1.2.0/fasta/genome.fa /disk1/pengweixing/gastric_wgs/00.data/NR140912-1/NR140912-1_DHG00703_H0BL1ALXX_L1_1.fq.gz /disk1/pengweixing/gastric_wgs/00.data/NR140912-1/NR140912-1_DHG00703_H0BL1ALXX_L1_2.fq.gz |samtools view -bS > NR140912-1_DHG00703_H0BL1ALXX_L1.bam
/disk1/pengweixing/Old_research/snp-calling-pipeline/pipe/sambamba markdup -r -t 10 --tmpdir=/disk1/pengweixing/gastric_wgs/01.mapping/tmp --overflow-list-size=600000 $i.merge.addRG.bam $i.merge.addRG.rmdu.bam
