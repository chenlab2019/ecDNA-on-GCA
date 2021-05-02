#################################################
#  File Name:novobreak.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Tue 09 Jun 2020 02:09:41 PM UTC
#################################################

tumor=tumor_replace
control=normal_replace
bash /disk1/pengweixing/software/novoBreak_distribution_v1.1.3rc/run_novoBreak.sh /disk1/pengweixing/software/novoBreak_distribution_v1.1.3rc /disk1/pengweixing/software/sc-atac/refdata-cellranger-atac-hg19-1.2.0/fasta/genome2.fa $tumor $control 1
