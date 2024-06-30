#!/bin/bash
#conda activate cutadapt
# 定义目录列表
directories=("SRR17200395" "SRR17200398" "SRR17200401" "SRR17234919" "SRR22250985" "SRR22250988" "SRR22250991" "SRR22250992")
# TrimGalore命令的路径
trim_galore_cmd="/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore"

# 遍历目录列表
for dir in "${directories[@]}"; do
    echo "Processing $dir..."

    # 构建并执行TrimGalore命令（输出为普通的.fastq格式文件）
    $trim_galore_cmd --cores 8 -q 20 --illumina --fastqc --gzip -o ./$dir/ --paired ./$dir/${dir}_1.fastq.gz ./$dir/${dir}_2.fastq.gz
    wait
done

echo "All done."

