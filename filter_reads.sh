### remove reads type
# 1. PCR duplicate
# 2. low quality reads (mapping quality >=30)
# 3. pair reads not alignment on the same chromosome
# 4. reads mapping on ChrM

###
samtools index test.bam
samtools flagstat test.bam > test.raw.stat

### use sambamba/samtools remove duplicate 
sambamba markdup -r -t 64 test.bam test.rmdup.bam
### error sambamba-markdup: Cannot open file `/tmp/sambamba-pid96081-markdup-saro/PairedEndsInfoisfy1' in mode `w+' (Too many open files)
### add --overflow-list-size 600000
samtools index test.rmdup.bam
samtolls flagstat test.rmdup.bam > test.rmdup.stat

### use IGV virsulizatipn reads 

### samtools rm unproper pair mapping, low quality reads and chrM reads
samtools view -h -f 2 -q 30 test.rmdup.bam|grep -v chrM |samtools sort -O bam -@ 64 -o test.last.bam -  

samtools index test.last.bam
samtools flagstat test.last.stat





