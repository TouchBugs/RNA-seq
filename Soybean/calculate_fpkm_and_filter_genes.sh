#!/bin/bash

# 设置文件路径
bam_files=(
    "/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Soybean/Gm-L0h.bam"
    "/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Soybean/Gm-L168h.bam"
    "/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Soybean/Gm-L24h.bam"
    "/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Soybean/Gm-L2h.bam"
)
gff_file="/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/reference/Wm82/Gmax_508_Wm82.a4.v1.gene.gff3"

# 创建输出目录
output_dir="/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Soybean/cufflinks_output"
mkdir -p $output_dir

# 排序BAM文件并计算FPKM值
for bam_file in "${bam_files[@]}"; do
    base_name=$(basename "$bam_file" .bam)
    sorted_bam="$output_dir/${base_name}_sorted.bam"
    fpkm_dir="$output_dir/$base_name"
    
    echo "Processing $bam_file..."
    
    # 排序BAM文件
    samtools sort -o "$sorted_bam" "$bam_file"
    
    # 计算FPKM值
    cufflinks -q -p 8 -G "$gff_file" -o "$fpkm_dir" "$sorted_bam"
done

# 合并所有基因的FPKM值到一个文件中
echo "Merging FPKM values..."
merged_fpkm="$output_dir/merged_fpkm.txt"
paste $output_dir/*/genes.fpkm_tracking | awk '{print $1, $10, $20, $30, $40}' > $merged_fpkm

# 计算平均FPKM值并筛选表达的基因
echo "Filtering expressed genes..."
awk '
    BEGIN { OFS=","; print "GeneID,AverageFPKM" }
    {
        fpkm1 = $2;
        fpkm2 = $3;
        fpkm3 = $4;
        fpkm4 = $5;
        avg_fpkm = (fpkm1 + fpkm2 + fpkm3 + fpkm4) / 4;
        if (avg_fpkm >= 1) {
            print $1, avg_fpkm
        }
    }
' $merged_fpkm > $output_dir/expressed_genes.csv

echo "All tasks completed. Expressed genes are saved in $output_dir/expressed_genes.csv."

