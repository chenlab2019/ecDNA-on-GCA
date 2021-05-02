#################################################
#  File Name:gii.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Sat 27 Feb 2021 06:05:27 PM UTC
#################################################

#all=`cat segs.paired.dat |awk '$5>2.5 || $5<1.5' |awk '{sum+=$3-$2}END{print sum}'`
#aa=`cat segs.paired.dat |awk '{sum+=$3-$2}END{print sum}'`
all=`cat segs.paired.dat |awk '$5>2.5 || $5<1.5' |wc -l`
aa=`cat segs.paired.dat |wc -l`
python -c "print($all/$aa)"
