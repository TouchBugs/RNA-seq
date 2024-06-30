#!/bin/bash

# 定义重命名规则
declare -A rename_map=(
    ["SRR22250991"]="At-L0h_rep3"
    ["SRR22250994"]="At-L0h_rep2"
    ["SRR22250995"]="At-L0h_rep1"
    ["SRR22250992"]="At-L168h_rep3"
    ["SRR22250993"]="At-L168h_rep2"
    ["SRR22250984"]="At-L168h_rep1"
    ["SRR22250985"]="At-L24h_rep3"
    ["SRR22250986"]="At-L24h_rep2"
    ["SRR22250987"]="At-L24h_rep1"
    ["SRR22250988"]="At-L2h_rep3"
    ["SRR22250989"]="At-L2h_rep2"
    ["SRR22250990"]="At-L2h_rep1"
    ["SRR17234919"]="Gm-L0h_rep3"
    ["SRR17234920"]="Gm-L0h_rep2"
    ["SRR17234921"]="Gm-L0h_rep1"
    ["SRR17200395"]="Gm-L168h_rep3"
    ["SRR17200396"]="Gm-L168h_rep2"
    ["SRR17200397"]="Gm-L168h_rep1"
    ["SRR17200398"]="Gm-L24h_rep3"
    ["SRR17200399"]="Gm-L24h_rep2"
    ["SRR17200400"]="Gm-L24h_rep1"
    ["SRR17200401"]="Gm-L2h_rep3"
    ["SRR17200402"]="Gm-L2h_rep2"
    ["SRR17200342"]="Gm-L2h_rep1"
    ["SRR17151213"]="Os-L0h_rep3"
    ["SRR17151216"]="Os-L0h_rep2"
    ["SRR17151217"]="Os-L0h_rep1"
    ["SRR17151214"]="Os-L168h_rep3"
    ["SRR17151215"]="Os-L168h_rep2"
    ["SRR17151206"]="Os-L168h_rep1"
    ["SRR17151207"]="Os-L24h_rep3"
    ["SRR17151208"]="Os-L24h_rep2"
    ["SRR17151209"]="Os-L24h_rep1"
    ["SRR17151210"]="Os-L2h_rep3"
    ["SRR17151211"]="Os-L2h_rep2"
    ["SRR17151212"]="Os-L2h_rep1"
)

# 遍历目录并重命名文件
for dir in */; do
    # 去掉目录末尾的斜杠
    dir="${dir%/}"
    # 提取目录中的SRR编号
    srr_id="${dir%_hisat2}"
    if [ -n "${rename_map[$srr_id]}" ]; then
        new_name="${rename_map[$srr_id]}"
        mv "${dir}/${srr_id}_hisat2.bam" "${dir}/${new_name}.bam"
        echo "Renamed ${dir}/${srr_id}_hisat2.bam to ${dir}/${new_name}.bam"
    else
        echo "No rename rule found for ${srr_id}"
    fi
done

