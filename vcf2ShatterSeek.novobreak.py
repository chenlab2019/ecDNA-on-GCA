#################################################
#  File Name:vcf2ShatterSeek.py
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Fri 05 Jun 2020 03:38:20 PM UTC
#################################################

import sys

f1 = open(sys.argv[1],'r')
f2 = open(sys.argv[2],'w')
header=["chrom1","start1","end1","chrom2","start2","end2","sv_id","pe_support","strand1","strand2","svclass","svmethod"]
print(*header,sep="\t",file=f2)
name_id = 1000000
for line in f1:
    line = line.strip()
    if not line.startswith("#"):
        line1 = line.split("\t")
        if 'TRA' in line1[4]:
            mychr_1 = line1[0]
            start_1 = int(line1[1])
            info = line1[7]
            start_2 = int(info.split(';')[8].split('=')[1])
            mychr_2 = info.split(';')[7].split('=')[1]
            end_1 = start_1+1
            end_2 = start_2+1
            pe = int(line1[13])
            strand = info.split(';')[1].split('=')[1]
            sv_name = 'TRA'+str(name_id)
            if strand=="3to3":
                strand1 = '-'
                strand2 = '-'
            if strand=="5to5":
                strand1 = '+'
                strand2 = '+'
            if strand=="5to3":
                strand1 ='+'
                strand2 = '-'
            if strand=="3to5":
                strand1 = '-'
                strand2 = '+'
            print(mychr_1,start_1,end_1,mychr_2,start_2,end_2,sv_name,pe,strand1,strand2,"TRA","novobreak",sep="\t",file=f2)
        elif 'INV' in line1[4]:
            mychr_1 = line1[0]
            start_1 = int(line1[1])
            info = line1[7]
            end_1 = int(info.split(';')[8].split('=')[1])
            pe = int(line1[13])
            strand = info.split(';')[1].split('=')[1]
            sv_name = 'INV'+str(name_id)
            mychr_2 = mychr_1
            start_2 = end_1
            end_1  = start_1 + 1
            end_2 = start_2 + 1
            if strand=="3to3":
                strand1 = '-'
                strand2 = '-'
                print(mychr_1,start_1,end_1,mychr_2,start_2,end_2,sv_name,pe,strand1,strand2,"t2tINV","novobreak",sep="\t",file=f2)
            if strand=="5to5":
                strand1 = '+'
                strand2 = '+'
                print(mychr_1,start_1,end_1,mychr_2,start_2,end_2,sv_name,pe,strand1,strand2,"h2hINV","novobreak",sep="\t",file=f2)
        elif 'DUP' in line1[4]:
            mychr_1 = line1[0]
            start_1 = int(line1[1])
            info = line1[7]
            end_1 = int(info.split(';')[8].split('=')[1])
            pe = int(line1[13])
            sv_name = 'DUP'+str(name_id)
            mychr_2 = mychr_1
            start_2 = end_1
            end_1  = start_1 + 1
            end_2 = start_2 + 1
            strand1 = '-'
            strand2 = '+'
            print(mychr_1,start_1,end_1,mychr_2,start_2,end_2,sv_name,pe,strand1,strand2,"DUP","novobreak",sep="\t",file=f2)
        else:
            mychr_1 = line1[0]
            start_1 = int(line1[1])
            info = line1[7]
            end_1 = int(info.split(';')[8].split('=')[1])
            pe = int(line1[13])
            sv_name = 'DUP'+str(name_id)
            mychr_2 = mychr_1
            start_2 = end_1
            end_1  = start_1 + 1
            end_2 = start_2 + 1
            strand1 = '-'
            strand2 = '+'
            print(mychr_1,start_1,end_1,mychr_2,start_2,end_2,sv_name,pe,strand1,strand2,"DEL","novobreak",sep="\t",file=f2)
        name_id = name_id + 1
