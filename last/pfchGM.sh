#!/bin/bash

# 定义 SRR 编号数组
SRR_IDS=(
	SRR17234920
	SRR17234921
	SRR17200396
	SRR17200397
	SRR17200399
	SRR17200400
	SRR17200402
	SRR17200342
)


# Hisat2 索引路径
hisat2_index="/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/reference/Wm82/Gmax_508_v4_index"

# 下载数据
#for SRR in "${SRR_IDS[@]}"; do
#    prefetch $SRR &
#done

# wait
# echo "Download complete!!!"

# 转换 SRA 文件到 FASTQ 文件
# for SRR in "${SRR_IDS[@]}"; do
#     fastq-dump --split-3 ${SRR}/${SRR}.sra &
# done

# wait
# echo "Conversion to FASTQ complete!!!"

# # 修剪 FASTQ 文件
# for SRR in "${SRR_IDS[@]}"; do
#     /Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore --cores 4 -q 20 --illumina --fastqc -o . --paired ${SRR}_1.fastq ${SRR}_2.fastq &
# done

# wait
# echo "Trimming complete"

# Hisat2 比对并生成 BAM 文件
for SRR in "${SRR_IDS[@]}"; do
    # 定义修剪后的 FASTQ 文件路径
    fastq1="${SRR}_1_val_1.fq"
    fastq2="${SRR}_2_val_2.fq"
    dir="${SRR}_hisat2"

    # 创建输出目录
    mkdir -p $dir

    # 运行 Hisat2 和 Samtools
    hisat2 -x "$hisat2_index" -1 "$fastq1" -2 "$fastq2" | samtools view -Sb - > "$dir/${dir}.bam" &
done

wait
echo "Hisat2 alignment complete"

