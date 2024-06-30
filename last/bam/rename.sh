# 创建一个映射表
declare -A srr_to_libname=(
[SRR22250991]="At-L0h_rep3"
[SRR22250994]="At-L0h_rep2"
[SRR22250995]="At-L0h_rep1"
[SRR22250992]="At-L168h_rep3"
[SRR22250993]="At-L168h_rep2"
[SRR22250984]="At-L168h_rep1"
[SRR22250985]="At-L24h_rep3"
[SRR22250986]="At-L24h_rep2"
[SRR22250987]="At-L24h_rep1"
[SRR22250988]="At-L2h_rep3"
[SRR22250989]="At-L2h_rep2"
[SRR22250990]="At-L2h_rep1"
[SRR17234919]="Gm-L0h_rep3"
[SRR17234920]="Gm-L0h_rep2"
[SRR17234921]="Gm-L0h_rep1"
[SRR17200395]="Gm-L168h_rep3"
[SRR17200396]="Gm-L168h_rep2"
[SRR17200397]="Gm-L168h_rep1"
[SRR17200398]="Gm-L24h_rep3"
[SRR17200399]="Gm-L24h_rep2"
[SRR17200400]="Gm-L24h_rep1"
[SRR17200401]="Gm-L2h_rep3"
[SRR17200402]="Gm-L2h_rep2"
[SRR17200342]="Gm-L2h_rep1"
[SRR17151213]="Os-L0h_rep3"
[SRR17151216]="Os-L0h_rep2"
[SRR17151217]="Os-L0h_rep1"
[SRR17151214]="Os-L168h_rep3"
[SRR17151215]="Os-L168h_rep2"
[SRR17151206]="Os-L168h_rep1"
[SRR17151207]="Os-L24h_rep3"
[SRR17151208]="Os-L24h_rep2"
[SRR17151209]="Os-L24h_rep1"
[SRR17151210]="Os-L2h_rep3"
[SRR17151211]="Os-L2h_rep2"
[SRR17151212]="Os-L2h_rep1"
)

# 遍历当前目录下所有符合条件的文件
for file in SRR*hisat2.bam; do
    # 提取SRR编号
    srr_id="${file%%_*}"
    # 根据SRR编号找到对应的LibraryName
    lib_name="${srr_to_libname[$srr_id]}"
    # 如果找到了对应的LibraryName，则重命名文件
    if [ ! -z "$lib_name" ]; then
        mv "$file" "${lib_name}.bam"
    fi
done
