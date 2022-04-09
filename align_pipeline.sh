### set config 
ls *_1.fq.gz >1
ls *_2.fq.gz >2
ls *_2.fq.gz |cut -d "_" -f 1 >0
paste 0 1 2 >config.mapping
### config.mapping 
2-cell-1        2-cell-1_1_val_1.fq.gz  2-cell-1_2_val_2.fq.gz
2-cell-2        2-cell-2_1_val_1.fq.gz  2-cell-2_2_val_2.fq.gz





