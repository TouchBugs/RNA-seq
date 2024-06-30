# 加载需要的包
library(DESeq2)
library(dplyr)

# 读取 HTSeq 计数数据
counts_files <- list.files(path="last/Gm/cufflinks_output/", pattern="*_counts.txt", full.names=TRUE)
counts_data <- lapply(counts_files, read.table, header=FALSE, row.names=1)
all_counts <- do.call(cbind, counts_data)
colnames(all_counts) <- gsub(".*_(.*)_counts.txt", "\\1", counts_files)

# 创建样本信息表
timepoints <- c(rep("L0h", 3), rep("L2h", 3), rep("L24h", 3), rep("L168h", 3))
sampleTable <- data.frame(condition = factor(timepoints))

# 创建 DESeq2 数据集
dds <- DESeqDataSetFromMatrix(countData = all_counts, colData = sampleTable, design = ~ condition)

# 进行差异表达分析
dds <- DESeq(dds)

# 提取差异表达分析结果
resultsL2h_vs_L0h <- results(dds, contrast=c("condition", "L2h", "L0h"))
resultsL24h_vs_L0h <- results(dds, contrast=c("condition", "L24h", "L0h"))
resultsL168h_vs_L0h <- results(dds, contrast=c("condition", "L168h", "L0h"))

# 筛选冷响应基因
cold_responsive_genes <- union(
  rownames(subset(resultsL2h_vs_L0h, padj < 0.05 & abs(log2FoldChange) >= 2)),
  union(
    rownames(subset(resultsL24h_vs_L0h, padj < 0.05 & abs(log2FoldChange) >= 2)),
    rownames(subset(resultsL168h_vs_L0h, padj < 0.05 & abs(log2FoldChange) >= 2))
  )
)

# 筛选不响应基因
nonresponsive_genes <- intersect(
  rownames(subset(resultsL2h_vs_L0h, abs(log2FoldChange) <= 0.5)),
  intersect(
    rownames(subset(resultsL24h_vs_L0h, abs(log2FoldChange) <= 0.5)),
    rownames(subset(resultsL168h_vs_L0h, abs(log2FoldChange) <= 0.5))
  )
)

# 读取表达基因文件
expressed_genes <- read.csv("last/Gm/cufflinks_output/expressed_genes.csv", header=TRUE, row.names=NULL)
expressed_genes$GeneID <- sub("gene:", "", expressed_genes$GeneID)
expressed_genes <- expressed_genes %>%
  filter(AverageFPKM > 0) %>%
  select(GeneID)

# 将基因ID转换为符合标准的基因ID
cold_responsive_genes <- intersect(cold_responsive_genes, expressed_genes$GeneID)
nonresponsive_genes <- intersect(nonresponsive_genes, expressed_genes$GeneID)

# 输出冷响应基因和不响应基因的ID
write.csv(cold_responsive_genes, "last/Gm/cold_responsive_genes.csv", row.names = FALSE, quote = FALSE)
write.csv(nonresponsive_genes, "last/Gm/nonresponsive_genes.csv", row.names = FALSE, quote = FALSE)

# 打印结果
print("冷响应基因:")
print(cold_responsive_genes)
print("不响应基因:")
print(nonresponsive_genes)
