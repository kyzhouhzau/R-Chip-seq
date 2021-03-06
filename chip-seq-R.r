source("https://bioconductor.org/biocLite.R")
biocLite("ChIPseeker")
biocLite("org.At.tair.db")
biocLite("TxDb.Athaliana.BioMart.plantsmart28")
library("ChIPseeker")
library("org.At.tair.db")
library("TxDb.Athaliana.BioMart.plantsmart28")
library("ggplot2")
txdb <- TxDb.Athaliana.BioMart.plantsmart28
peak <- readPeakFile("C:\\Users\\zhouk\\Desktop\\GSM2476321_ARR1.2ypet_S89S99_LD_p6BA_3D.peak.bed")
#显示peak在基因上的位置
covplot(peak)

#promoter <- getPromoters(TxDb=txdb,upstream=300, downstream=300)
#tagMatrix <- getTagMatrix(peak, windows=promoter)
#tagMatrixList <- lapply(peak, getTagMatrix,windows=promoter)
#plotAvgProf(tagMatrix, xlim=c(-300, 300),conf=0.95,resample=500, facet="row")
#注释
peakAnno <- annotatePeak(peak, tssRegion=c(-3000, 3000),TxDb=txdb, annoDb="org.At.tair.db")
#注释结果可视化分析
plotAnnoPie(peakAnno)#pie图
plotAnnoBar(peakAnno)#bar图
vennpie(peakAnno)#VN图
upsetplot(peakAnno)#复合图
#peak附近基因可视化
peakAnnoList <- lapply(peak, annotatePeak, TxDb=txdb,tssRegion=c(-3000, 3000), verbose=FALSE)
plotAnnoBar(peakAnnoList)#bar图

