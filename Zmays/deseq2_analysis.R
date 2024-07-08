# 加载需要的包
library(DESeq2)
library(dplyr)

# 读取/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/gene_counts.txt,作为all_counts
# gene_counts.txt的第一行是列名
# gene_counts.txt的第一列是行名
# 读取/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/count_matrix.txt,作为sampleTable
all_counts <- read.table("/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/gene_counts.txt", header=TRUE, row.names=1, sep=",")
sampleTable <- read.table("/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/count_matrix.txt", header=TRUE, row.names=1, sep=",")
# 创建 DESeq2 数据集
sampleTable$Condition <- factor(sampleTable$Condition, levels=c("control", "cold"))
sampleTable$Time <- factor(sampleTable$Time, levels=c("05h", "1h", "3h", "6h", "16h", "24h"))
sampleTable$Batch <- factor(sampleTable$Batch)
sampleTable$Group <- factor(sampleTable$Group, levels=c("control-05h", "control-1h", "control-3h", "control-6h", "control-16h", "control-24h", "cold-05h", "cold-1h", "cold-3h", "cold-6h", "cold-16h", "cold-24h"))
dds <- DESeqDataSetFromMatrix(countData = all_counts, colData = sampleTable, design = ~ Group + Batch)

# 进行差异表达分析
dds <- DESeq(dds)

# 提取差异表达分析结果
results_1h <- results(dds, contrast=c("Group", "cold-1h", "control-1h"))
results_3h <- results(dds, contrast=c("Group", "cold-3h", "control-3h"))
results_05h <- results(dds, contrast=c("Group", "cold-05h", "control-05h"))
results_6h <- results(dds, contrast=c("Group", "cold-6h", "control-6h"))
results_16h <- results(dds, contrast=c("Group", "cold-16h", "control-16h"))
results_24h <- results(dds, contrast=c("Group", "cold-24h", "control-24h"))


# 筛选冷响应基因
time_points <- list(
  rownames(subset(results_05h, padj < 0.05 & abs(log2FoldChange) >= 2)),
  rownames(subset(results_1h, padj < 0.05 & abs(log2FoldChange) >= 2)),
  rownames(subset(results_3h, padj < 0.05 & abs(log2FoldChange) >= 2)),
  rownames(subset(results_6h, padj < 0.05 & abs(log2FoldChange) >= 2)),
  rownames(subset(results_16h, padj < 0.05 & abs(log2FoldChange) >= 2)),
  rownames(subset(results_24h, padj < 0.05 & abs(log2FoldChange) >= 2))
)
# 使用 Reduce 函数递归应用 union 操作，找到所有时间点响应基因的并集
cold_responsive_genes <- Reduce(union, time_points)
# 筛选不响应基因
time_points <- list(
  rownames(subset(results_05h, abs(log2FoldChange) <= 0.5)),
  rownames(subset(results_1h, abs(log2FoldChange) <= 0.5)),
  rownames(subset(results_3h, abs(log2FoldChange) <= 0.5)),
  rownames(subset(results_6h, abs(log2FoldChange) <= 0.5)),
  rownames(subset(results_16h, abs(log2FoldChange) <= 0.5)),
  rownames(subset(results_24h, abs(log2FoldChange) <= 0.5))
)
nonresponsive_genes <- Reduce(intersect, time_points)
# 读取表达基因文件,处理成只含GeneID
expressed_genes <- read.csv("/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/expressed_genes.txt", header=FALSE, row.names=NULL)
expressed_genes$GeneID <- sub("gene:", "", expressed_genes$V1)
expressed_genes <- expressed_genes %>%
  filter(V2 > 0) %>%
  select(GeneID)

# 将基因ID转换为符合标准的基因ID
cold_responsive_genes <- intersect(cold_responsive_genes, expressed_genes$GeneID)
nonresponsive_genes <- intersect(nonresponsive_genes, expressed_genes$GeneID)
cold_responsive_genes <- as.data.frame(cold_responsive_genes)
nonresponsive_genes <- as.data.frame(nonresponsive_genes)
# # 输出冷响应基因和不响应基因的ID
write.csv(cold_responsive_genes, "/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/cold_responsive_genes.csv", row.names = FALSE, quote = FALSE)
write.csv(nonresponsive_genes, "/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/nonresponsive_genes.csv", row.names = FALSE, quote = FALSE)

# # 打印结果
# print("冷响应基因:")
# print(cold_responsive_genes)
# print("不响应基因:")
# print(nonresponsive_genes)
