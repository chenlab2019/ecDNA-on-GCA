#################################################
#  File Name:run.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Sat 18 Jan 2020 09:19:30 PM UTC

out=DHG00023
aabam=/disk1/pengweixing/gastric_wgs/06.sv/cnv/bam/M_DHG00023.bam
mybed=/disk1/pengweixing/gastric_wgs/06.sv/cnv/call/DHG00023/cnv_for_ecDNA_4_10k.bed.bed
/home/huazhang/miniconda2/bin/python /disk1/huazhang/software/AmpliconArchitect/src/AmpliconArchitect.py --bed $mybed --bam $aabam --out $out
mkdir SV_graph
mkdir cycles
mkdir logs
mkdir edges
mkdir graph
mkdir cnseg
mkdir out
mv *.png *.pdf SV_graph
mv *_cycles.txt cycles
mv *_logs.txt logs
mv *_edges* edges
mv *_graph.txt graph
mv *_cnseg* cnseg
mv *.out out
