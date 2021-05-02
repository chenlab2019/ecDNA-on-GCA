#################################################
#  File Name:stat.density.py
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Thu 27 Aug 2020 05:21:54 PM UTC
#################################################
import sys
f1 = open(sys.argv[1],'r')#window
f2 = open('/disk1/pengweixing/gastric_wgs/08.somatic-ecDNA2/amplicon_oncogene_distri/ecDNA.number.format.list','r')
f3 = open(sys.argv[2],'w')
all_list = [line.strip() for line in f2.readlines()]
sample_name = [line.split('/')[5] for line in all_list]
f3.write('ID\t')
[f3.write('%s\t' % (each)) for each in sample_name]
f3.write('\n')
for line in f1:
    line = line.strip()
    line1 = line.split('\t')
    label = line1[0]+"_"+line1[1]+"_"+line1[2]
    mychr = line1[0]
    start = int(line1[1])
    end = int(line1[2])
    f3.write("%s\t" % label)
    for each_sample in all_list:
        with open(each_sample,'r') as f:
            for line2 in f:
                line2  = line2.strip()
                mychr2 = line2.split('\t')[1]
                start2 = int(line2.split('\t')[2])
                end2 = int(line2.split('\t')[3])
                if mychr==mychr2:
                    if start2 > start and start2<end:
                        f3.write('1\t')
                        break
                    elif end2 > start and end2 < end:
                        f3.write('1\t')
                        break
                    elif start2<start and end2>end:
                        f3.write('1\t')
                        break
            else:
                f3.write('0\t')
    f3.write('\n')

