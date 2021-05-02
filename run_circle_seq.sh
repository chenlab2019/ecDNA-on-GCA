#################################################
#  File Name:run.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Tue 18 Aug 2020 12:04:10 PM UTC
#################################################

for i in `cat dir.list`
do
cd $i
#echo "/disk1/pengweixing/software/anaconda3/envs/homer/bin/bin/makeTagDirectory tumor /disk1/pengweixing/gastric_wgs/10.Circle_seq/01.mapping/$i-T.sort.rmdup.bam  &
#/disk1/pengweixing/software/anaconda3/envs/homer/bin/bin/makeTagDirectory normal /disk1/pengweixing/gastric_wgs/10.Circle_seq/01.mapping/$i-N.sort.rmdup.bam
#/disk1/pengweixing/software/anaconda3/envs/homer/bin/bin/findPeaks  tumor -i normal -style histone -o $i.peak" > run.sh
sh run.sh
cd ..
done
