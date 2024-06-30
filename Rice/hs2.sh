#!/bin/bash

# 设置Hisat2的索引路径
hisat2_index="/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/reference/Rice/Rice-index"

# 指定要处理的目录
directories=("SRR17151214")

# 遍历每个指定的目录
for dir in "${directories[@]}"; do
    echo "Processing $dir..."

    # 检查目录是否存在
    if [[ -d "$dir" ]]; then
        # 获取压缩的FASTQ文件
        fastq1="$dir/${dir}_1_val_1.fq"
        fastq2="$dir/${dir}_2_val_2.fq"

        # 检查文件是否存在
        if [[ -f "$fastq1" && -f "$fastq2" ]]; then
            echo "Running Hisat2 and converting to BAM for $dir..."
            
            # 运行Hisat2进行比对，并将输出直接通过管道传递给samtools进行转换
            hisat2 -x "$hisat2_index" -1 "$fastq1" -2 "$fastq2" | samtools view -Sb - > "$dir/${dir}.bam" &

            # 检查Hisat2和samtools命令是否成功
            if [[ $? -eq 0 ]]; then
                echo "BAM file for $dir created successfully."
            else
                echo "Error occurred while processing $dir. Check the logs for details."
            fi
        else
            echo "FASTQ files for $dir are missing. Skipping Hisat2."
        fi
    else
        echo "Directory $dir does not exist. Skipping."
    fi
done
wait
echo "All tasks completed."

