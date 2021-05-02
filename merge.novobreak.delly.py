#################################################
#  File Name:merge.novobreak.delly.py
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Sun 21 Jun 2020 05:05:06 PM UTC
#################################################
import sys
import numpy as np

f1 = open(sys.argv[1],'r')#delly
f2 = open(sys.argv[2],'r')#novobreak

delly_line = [line.strip() for line in f1.readlines()]
novo_line = [line.strip() for line in f2.readlines()]
novo_line = novo_line[1:]
novo_line_np = np.array(novo_line)
new_line = []
print(delly_line[0])
del_index = []
diff=3
for line_delly in delly_line[1:]:
    chr1_delly = line_delly.split('\t')[0]
    chr2_delly = line_delly.split('\t')[3]
    start1_delly = int(line_delly.split('\t')[1])
    end1_delly = int(line_delly.split('\t')[2])
    start2_delly = int(line_delly.split('\t')[4])
    end2_delly = int(line_delly.split('\t')[5])
    sv_type1 = line_delly.split('\t')[10]
    i = 0
    for line_novo in novo_line:
        chr1_novo = line_novo.split('\t')[0]
        chr2_novo = line_novo.split('\t')[3]
        start1_novo = int(line_novo.split('\t')[1])
        end1_novo = int(line_novo.split('\t')[2])
        start2_novo = int(line_novo.split('\t')[4])
        end2_novo = int(line_novo.split('\t')[5])
        sv_type2 = line_novo.split('\t')[10]
        if chr1_delly==chr1_novo and chr2_delly==chr2_novo and sv_type1==sv_type2:
            if start1_delly>=start1_novo-diff and start1_delly<=start1_novo+diff:
                if end1_delly>=end1_novo-diff and end1_delly<=end1_novo+diff:
                    if start2_delly>=start2_novo-diff and start2_delly<=start2_novo+diff:
                        if end2_delly>=end2_novo-diff and end2_delly<=end2_novo+diff:
                            del_index.append(i)
        i += 1
keep_index = set(range(0,len(novo_line)))-set(del_index)
keep_index2 = np.array(list(keep_index))
novo_line2 = novo_line_np[keep_index2,]
[print(each_line) for each_line in delly_line[1:]]
[print(each_line) for each_line in novo_line2]
f1.close()
f2.close()
