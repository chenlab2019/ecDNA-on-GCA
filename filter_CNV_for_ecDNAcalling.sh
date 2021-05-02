#################################################
#  File Name:filter_for_ecDNA.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Mon 08 Jun 2020 02:12:17 PM UTC
#################################################

cat alts_bam.list |while read line;
do
bam_path=`echo $line |awk '{print$2}'`
alts_path=`echo $line |awk '{print$1}'`
out=`dirname $alts_path`
#echo $alts_path
echo "/home/huazhang/miniconda2/bin/python /disk1/huazhang/software/AmpliconArchitect/src/amplified_intervals.py --gain 4 --cnsize_min 10000 --bed $alts_path --out $out/cnv_for_ecDNA_4_10k.bed --bam $bam_path &"
done
