### peak virsulization
ls *last.bam|while read id;do
nohup bamCoverage --normalizeUsing CPM -b $id -p 10 -o ${id%%.*}.bw &
done

### TSS TES 
computeMatrix reference-point --referencePoint TSS -p 15 \
-b 10000 -a 10000 \
-R /Date/xyf/atac-seq/mm10_refseq/mm10_ucsc_refseq.bed \
-S /Date/xyf/atac-seq/alignment/name.bw \
--skipZeros -o name_matrix_TSS.gz \
--outFileSortedRegions regeions_name_genes.bed

