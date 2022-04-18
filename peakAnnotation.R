### ATAC-seq peaks annotation  mm10
rm(list = ls())
setwd("F:/study/bioinformatic/bioinformatic/ATAC-seq/callpeaks")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ChIPseeker")
BiocManager::install("TxDb.Mmusculus.UCSC.mm10.knownGene")
BiocManager::install("org.Mm.eg.db")

library("ChIPseeker")
library("TxDb.Mmusculus.UCSC.mm10.knownGene")
txdb <- TxDb.Mmusculus.UCSC.mm10.knownGene
library("org.Mm.eg.db")

### peak file load
bedPeaksfile = "2-cell-1_peaks.narrowPeak"

peak <- readPeakFile(bedPeaksfile)

keepChr = !grepl('_',seqlevels(peak)) ###去除有_的染色体编号

seqlevels(peak, pruning.mode="coarse") <- seqlevels(peak)[keepChr]

### peak annotate
peakAnno <- annotatePeak(peak, tssRegion = c(-3000, 3000),
                         TxDb = txdb, annoDb = "org.Mm.eg.db")

peakAnno_df <- as.data.frame(peakAnno)

### visulization
plotAnnoPie(peakAnno)
vennpie(peakAnno)

####  peaks 在所有基因启动子附近的分布情况
promoter <- getPromoters(TxDb=txdb, upstream=3000, downstream=3000)

tagMatrixList <-getTagMatrix(peak,windows=promoter)

data("tagMatrixList")

####  peaks 在基因启动子附近信号强度曲线图
plotAvgProf(tagMatrixList, xlim=c(-3000, 3000),
            xlab = "Genomic region (5' -> 3')", ylab = "Read count frequency")

####  peaks 在基因启动子附近信号强度热图
tagHeatmap(tagMatrixList,xlim = c(-3000,3000),color = "red")







