### use sambamba remove duplicate 
sambamba markdup -r -t 64 test.bam test.rmdup.bam

### use IGV virsulizatipn reads 
samtools index test_sorted.bam
### get test_sorted.bam.bai index

### ues bam and bai for IGV plot
