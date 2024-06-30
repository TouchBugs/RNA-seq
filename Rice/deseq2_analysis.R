# 加载需要的包
library(DESeq2)

# 读取 HTSeq 计数数据
counts_L0h <- read.table("Rice/cufflinks_output/Os-L0h_counts.txt", header=FALSE, row.names=1)
counts_L2h <- read.table("Rice/cufflinks_output/Os-L2h_counts.txt", header=FALSE, row.names=1)
counts_L24h <- read.table("Rice/cufflinks_output/Os-L24h_counts.txt", header=FALSE, row.names=1)
counts_L168h <- read.table("Rice/cufflinks_output/Os-L168h_counts.txt", header=FALSE, row.names=1)


# 合并所有计数数据
all_counts <- cbind(counts_L0h, counts_L2h, counts_L24h, counts_L168h)
colnames(all_counts) <- c("L0h", "L2h", "L24h", "L168h")

# 创建样本信息表，指定每个样本的具体条件
condition <- factor(c("L0h", "L2h", "L24h", "L168h"))
sampleTable <- data.frame(condition = condition)

# 创建 DESeq2 数据集
dds <- DESeqDataSetFromMatrix(countData = all_counts, colData = sampleTable, design = ~ condition)

# 进行差异表达分析
dds <- DESeq(dds)

# 筛查出L2h相对于L0h的响应基因
resultsL2h_vs_L0h <- results(dds, contrast=c("condition", "L2h", "L0h"))

# 检查 resultsL2h_vs_L0h 的前几行和列名
head(resultsL2h_vs_L0h)
str(resultsL2h_vs_L0h)

# # 读取基因表达文件
# fpkm_data <- read.csv("Rice/cufflinks_output/expressed_genes_modified.csv")

# # 识别冷响应基因
# if ("log2FoldChange" %in% colnames(results)) {
#   cold_responsive_genes <- results[!is.na(results$padj) & results$padj < 0.05 & abs(results$log2FoldChange) >= 1, ]
#   print(head(cold_responsive_genes)) # 输出前几行检查
#   cold_responsive_genes <- as.data.frame(cold_responsive_genes) # 转换为数据框
#   cold_responsive_genes <- merge(cold_responsive_genes, fpkm_data, by.x="row.names", by.y="GeneID")
#   colnames(cold_responsive_genes)[1] <- "GeneID" # 重命名列
#   write.csv(cold_responsive_genes, "Rice/cufflinks_output/cold_responsive_genes.csv", row.names=TRUE)
# } else {
#   stop("log2FoldChange 列未找到，请检查 DESeq2 分析输出")
# }

# # 识别非响应基因
# if ("log2FoldChange" %in% colnames(results)) {
#   non_responsive_genes <- results[!is.na(results$padj) & abs(results$log2FoldChange) <= 0.5, ]
#   print(head(non_responsive_genes)) # 输出前几行检查
#   non_responsive_genes <- as.data.frame(non_responsive_genes) # 转换为数据框
#   non_responsive_genes <- merge(non_responsive_genes, fpkm_data, by.x="row.names", by.y="GeneID")
#   colnames(non_responsive_genes)[1] <- "GeneID" # 重命名列
#   write.csv(non_responsive_genes, "Rice/cufflinks_output/non_responsive_genes.csv", row.names=FALSE)
# } else {
#   stop("log2FoldChange 列未找到，请检查 DESeq2 分析输出")
# }
