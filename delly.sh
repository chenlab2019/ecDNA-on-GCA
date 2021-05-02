#################################################
#  File Name:delly.sh
#  Author: xingpengwei
#  Mail: xingwei421@qq.com
#  Created Time: Tue 12 May 2020 08:05:55 AM UTC
#################################################
tumor=/disk1/pengweixing/gastric_wgs/01.mapping/DHG00009/DHG00009.merge.addRG.rmdu.bam
control=/disk1/pengweixing/gastric_wgs/01.mapping/DHG00010/DHG00010.merge.addRG.rmdu.bam
out=DHG00009_10
delly call -q 15 -x /disk1/pengweixing/database/hg19_kundaje_blacklist2.bed -g /disk1/pengweixing/software/sc-atac/refdata-cellranger-atac-hg19-1.2.0/fasta/genome2.fa -o $out.bcf $tumor $control
delly filter -f somatic -o $out.pre.bcf -s sample.csv $out.bcf
bcftools view -f PASS $out.pre.bcf > $out.pass.vcf
grep -E 'DUP|#' $out.pass.vcf > $out.pass.dup.vcf
grep -E 'DEL|#' $out.pass.vcf > $out.pass.del.vcf
grep -E 'INV|#' $out.pass.vcf > $out.pass.inv.vcf
/disk1/pengweixing/software/annovar/table_annovar.pl $out.pass.vcf /disk1/pengweixing/software/annovar/humandb/ -buildver hg19 -out $out -remove -protocol refGene -operation g -nastring . -vcfinput -polish
/disk1/pengweixing/software/annovar/table_annovar.pl $out.pass.dup.vcf /disk1/pengweixing/software/annovar/humandb/ -buildver hg19 -out $out.dup -remove -protocol refGene -operation g -nastring . -vcfinput -polish
/disk1/pengweixing/software/annovar/table_annovar.pl $out.pass.del.vcf /disk1/pengweixing/software/annovar/humandb/ -buildver hg19 -out $out.del -remove -protocol refGene -operation g -nastring . -vcfinput -polish
/disk1/pengweixing/software/annovar/table_annovar.pl $out.pass.inv.vcf /disk1/pengweixing/software/annovar/humandb/ -buildver hg19 -out $out.inv -remove -protocol refGene -operation g -nastring . -vcfinput -polish
