### remove reads type
# 1. PCR duplicate
# 2. low quality reads (mapping quality >=30)
# 3. pair reads not alignment on the same chromosome
# 4. reads mapping on ChrM

### use sambamba/samtools remove duplicate 
sambamba markdup -r -t 64 test.bam test.rmdup.bam

### use IGV virsulizatipn reads 
samtools index test_sorted.bam
### get test_sorted.bam.bai index  ues bam and bai for IGV plot

### samtools rm unproper pair mapping, low quality reads and chrM reads
samtools view -f 2 -q 30 test.rmdup.bam|grep -v chrM
