###
/Date/biosoft/bowtie2-2.3.4-linux-x86_64/bowtie2 -x ref_genome_index -1 fq1.gz -2 fq2.gz -p threads_num |samtools sort -@ 20 -O bam -o fq.bam -


###

