import os
import subprocess

SRR_and_name = {
    'SRR4301592'	:	'b1-FoxtailMillet-cold-05h'	,
    'SRR4301593'	:	'b1-FoxtailMillet-cold-16h'	,
    'SRR4301613'	:	'b1-FoxtailMillet-cold-1h'	,
    'SRR4301624'	:	'b1-FoxtailMillet-cold-24h'	,
    'SRR4301635'	:	'b1-FoxtailMillet-cold-3h'	,
    'SRR4301646'	:	'b1-FoxtailMillet-cold-6h'	,
    'SRR4301657'	:	'b1-FoxtailMillet-control-05h'	,
    'SRR4301668'	:	'b1-FoxtailMillet-control-16h'	,
    'SRR4301679'	:	'b1-FoxtailMillet-control-1h'	,
    'SRR4301690'	:	'b1-FoxtailMillet-control-24h'	,
    'SRR4301594'	:	'b1-FoxtailMillet-control-3h'	,
    'SRR4301604'	:	'b1-FoxtailMillet-control-6h'	,
    'SRR4301605'	:	'b1-Maize-cold-05h'	,
    'SRR4301606'	:	'b1-Maize-cold-16h'	,
    'SRR4301607'	:	'b1-Maize-cold-1h'	,
    'SRR4301608'	:	'b1-Maize-cold-24h'	,
    'SRR4301609'	:	'b1-Maize-cold-3h'	,
    'SRR4301610'	:	'b1-Maize-cold-6h'	,
    'SRR4301611'	:	'b1-Maize-control-05h'	,
    'SRR4301612'	:	'b1-Maize-control-16h'	,
    'SRR4301614'	:	'b1-Maize-control-1h'	,
    'SRR4301615'	:	'b1-Maize-control-24h'	,
    'SRR4301616'	:	'b1-Maize-control-3h'	,
    'SRR4301617'	:	'b1-Maize-control-6h'	,
    'SRR4301618'	:	'b1-Sorghum-cold-05h'	,
    'SRR4301619'	:	'b1-Sorghum-cold-16h'	,
    'SRR4301620'	:	'b1-Sorghum-cold-1h'	,
    'SRR4301621'	:	'b1-Sorghum-cold-24h'	,
    'SRR4301622'	:	'b1-Sorghum-cold-3h'	,
    'SRR4301623'	:	'b1-Sorghum-cold-6h'	,
    'SRR4301625'	:	'b1-Sorghum-control-05h'	,
    'SRR4301626'	:	'b1-Sorghum-control-16h'	,
    'SRR4301627'	:	'b1-Sorghum-control-1h'	,
    'SRR4301628'	:	'b1-Sorghum-control-24h'	,
    'SRR4301629'	:	'b1-Sorghum-control-3h'	,
    'SRR4301630'	:	'b1-Sorghum-control-6h'	,
    'SRR4301631'	:	'b2-FoxtailMillet-cold-05h'	,
    'SRR4301632'	:	'b2-FoxtailMillet-cold-16h'	,
    'SRR4301633'	:	'b2-FoxtailMillet-cold-1h'	,
    'SRR4301634'	:	'b2-FoxtailMillet-cold-24h'	,
    'SRR4301636'	:	'b2-FoxtailMillet-cold-3h'	,
    'SRR4301637'	:	'b2-FoxtailMillet-cold-6h'	,
    'SRR4301638'	:	'b2-FoxtailMillet-control-05h'	,
    'SRR4301639'	:	'b2-FoxtailMillet-control-16h'	,
    'SRR4301640'	:	'b2-FoxtailMillet-control-1h'	,
    'SRR4301641'	:	'b2-FoxtailMillet-control-24h'	,
    'SRR4301642'	:	'b2-FoxtailMillet-control-3h'	,
    'SRR4301643'	:	'b2-FoxtailMillet-control-6h'	,
    'SRR4301644'	:	'b2-Maize-cold-05h'	,
    'SRR4301645'	:	'b2-Maize-cold-16h'	,
    'SRR4301647'	:	'b2-Maize-cold-1h'	,
    'SRR4301648'	:	'b2-Maize-cold-24h'	,
    'SRR4301649'	:	'b2-Maize-cold-3h'	,
    'SRR4301650'	:	'b2-Maize-cold-6h'	,
    'SRR4301651'	:	'b2-Maize-control-05h'	,
    'SRR4301652'	:	'b2-Maize-control-16h'	,
    'SRR4301653'	:	'b2-Maize-control-1h'	,
    'SRR4301654'	:	'b2-Maize-control-24h'	,
    'SRR4301655'	:	'b2-Maize-control-3h'	,
    'SRR4301656'	:	'b2-Maize-control-6h'	,
    'SRR4301658'	:	'b2-Sorghum-cold-05h'	,
    'SRR4301659'	:	'b2-Sorghum-cold-16h'	,
    'SRR4301660'	:	'b2-Sorghum-cold-1h'	,
    'SRR4301661'	:	'b2-Sorghum-cold-24h'	,
    'SRR4301662'	:	'b2-Sorghum-cold-3h'	,
    'SRR4301663'	:	'b2-Sorghum-cold-6h'	,
    'SRR4301664'	:	'b2-Sorghum-control-05h'	,
    'SRR4301665'	:	'b2-Sorghum-control-16h'	,
    'SRR4301666'	:	'b2-Sorghum-control-1h'	,
    'SRR4301667'	:	'b2-Sorghum-control-24h'	,
    'SRR4301669'	:	'b2-Sorghum-control-3h'	,
    'SRR4301670'	:	'b2-Sorghum-control-6h'	,
    'SRR4301671'	:	'b3-FoxtailMillet-cold-05h'	,
    'SRR4301672'	:	'b3-FoxtailMillet-cold-16h'	,
    'SRR4301673'	:	'b3-FoxtailMillet-cold-1h'	,
    'SRR4301674'	:	'b3-FoxtailMillet-cold-24h'	,
    'SRR4301675'	:	'b3-FoxtailMillet-cold-3h'	,
    'SRR4301676'	:	'b3-FoxtailMillet-cold-6h'	,
    'SRR4301677'	:	'b3-FoxtailMillet-control-05h'	,
    'SRR4301678'	:	'b3-FoxtailMillet-control-16h'	,
    'SRR4301680'	:	'b3-FoxtailMillet-control-1h'	,
    'SRR4301681'	:	'b3-FoxtailMillet-control-24h'	,
    'SRR4301682'	:	'b3-FoxtailMillet-control-3h'	,
    'SRR4301683'	:	'b3-FoxtailMillet-control-6h'	,
    'SRR4301684'	:	'b3-Maize-cold-05h'	,
    'SRR4301685'	:	'b3-Maize-cold-16h'	,
    'SRR4301686'	:	'b3-Maize-cold-1h'	,
    'SRR4301687'	:	'b3-Maize-cold-24h'	,
    'SRR4301688'	:	'b3-Maize-cold-3h'	,
    'SRR4301689'	:	'b3-Maize-cold-6h'	,
    'SRR4301691'	:	'b3-Maize-control-05h'	,
    'SRR4301718'	:	'b3-Maize-control-16h'	,
    'SRR4301719'	:	'b3-Maize-control-1h'	,
    'SRR4301720'	:	'b3-Maize-control-24h'	,
    'SRR4301721'	:	'b3-Maize-control-3h'	,
    'SRR4301748'	:	'b3-Maize-control-6h'	,
    'SRR4301749'	:	'b3-Sorghum-cold-05h'	,
    'SRR4301750'	:	'b3-Sorghum-cold-16h'	,
    'SRR4301751'	:	'b3-Sorghum-cold-1h'	,
    'SRR4301752'	:	'b3-Sorghum-cold-24h'	,
    'SRR4301595'	:	'b3-Sorghum-cold-3h'	,
    'SRR4301596'	:	'b3-Sorghum-cold-6h'	,
    'SRR4301597'	:	'b3-Sorghum-control-05h'	,
    'SRR4301598'	:	'b3-Sorghum-control-16h'	,
    'SRR4301599'	:	'b3-Sorghum-control-1h'	,
    'SRR4301600'	:	'b3-Sorghum-control-24h'	,
    'SRR4301601'	:	'b3-Sorghum-control-3h'	,
    'SRR4301602'	:	'b3-Sorghum-control-6h'	,
}

dowmload_path = '/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/'
# 下载
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = f'prefetch {key} -O {dowmload_path}'
#         print(cmd)
#         with open(dowmload_path+'prefetchlog.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)

# 改名
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = 'mkdir '+dowmload_path+SRR_and_name[key]
#         print(cmd)
#         subprocess.run(cmd, shell=True)
#         cmd = f'mv {dowmload_path}{key}/{key}.sra {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}.sra'
#         print(cmd)
#         subprocess.run(cmd, shell=True)

# 转换
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = f'fastq-dump --split-3 {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}.sra -O {dowmload_path}{SRR_and_name[key]}/'
#         print(cmd)
#         with open(dowmload_path+'fastq-dumplog.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)

# 过滤
# TrimGalore命令的路径
# trim_galore="/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore"
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = f'conda run -n cutadapt {trim_galore} --cores 8 -q 20 --illumina --fastqc --output_dir {dowmload_path}{SRR_and_name[key]}/ {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}.fastq'
#         print(cmd)
#         with open(dowmload_path+'TrimGalorelog.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)

# hisat2建库
# 获取/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/reference/Zm下的文件列表
reference_path = '/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/reference/Zm/'
# reference_files = os.listdir(reference_path)
# for file in reference_files:
#     if file.startswith('Zm') and file.endswith('.fa'):
#         reference_fa = file
#         cmd = f'hisat2-build -p 8 {reference_path}{reference_fa} {reference_path}Zm_index'
#         print(cmd)
#         with open(reference_path+'hisat2-buildlog.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)

# hisat2比对
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = f'hisat2 -p 8 -x {reference_path}Zm_index -U {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}_trimmed.fq | samtools view -bS - | samtools sort -@ 8 -o {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}_sorted.bam'
#         print(cmd)
#         with open(dowmload_path+'hisat2log.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)


# 使用cufflinks计算FPKM
FPKM_path = '/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/FPKM/'
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = f'mkdir -p {FPKM_path}{SRR_and_name[key]}'
#         print(cmd)
#         subprocess.run(cmd, shell=True)
#         cmd = f'cufflinks -q -p 8 -G /Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/reference/Zm/Zm-B73-REFERENCE-NAM-5.0_Zm00001eb.1.gff3 -o {FPKM_path}{SRR_and_name[key]}/ {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}_sorted.bam'
#         print(cmd)
#         with open(dowmload_path+'cufflinkslog.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)

# 合并FPKM并计算FPKM的均值
# FPKMs = {}
# n = 0
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         n += 1
#         with open(f'{FPKM_path}{SRR_and_name[key]}/genes.fpkm_tracking', 'r') as f:
#             next(f)  # 直接跳过第一行
#             for line in f:
#                 parts = line.split('\t')
#                 gene_id = parts[0]
#                 try:
#                     FPKM = float(parts[9])
#                 except ValueError:
#                     # 处理非数字的FPKM值
#                     continue
#                 # print(f'{FPKM_path}{SRR_and_name[key]}/genes.fpkm_tracking\n',gene_id, FPKM)  # 调试用
#                 FPKMs[gene_id] = FPKMs.get(gene_id, 0) + FPKM
# # 计算FPKM的均值
# for gene_id in FPKMs:
#     FPKMs[gene_id] = FPKMs[gene_id] / n
# # 将FPKM的均值≥1的基因id及其FPKM值写入文件
# with open(dowmload_path+'expressed_genes.txt', 'w') as f:
#     for gene_id in FPKMs:
#         if FPKMs[gene_id] >= 1:
#             f.write(f'{gene_id},{FPKMs[gene_id]}\n')

# htseq-count -f bam -r pos -s no -t gene -i gene_id "$bam_file" ../../../reference/Rice/Oryza_sativa.IRGSP-1.0.59.chr.gff3 > "$count_file" &
# 使用htseq-count计算基因表达量
# 注意 gene -i ID 或者是 gene_id 这取决于gff文件中的gene的id是什么
counts_dir = '/Data4/gly_wkdir/coldgenepredict/raw_sec/Arabidopsis/Zmays/counts/'
# subprocess.run(f'mkdir -p {counts_dir}', shell=True)
# for key in SRR_and_name:
#     if 'Maize' in SRR_and_name[key]:
#         cmd = f'conda run -n base htseq-count -f bam -r pos -s no -t gene -i ID {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}_sorted.bam {reference_path}Zm-B73-REFERENCE-NAM-5.0_Zm00001eb.1.gff3 > {counts_dir}{SRR_and_name[key]}_count.txt'
#         print(cmd)
#         with open(dowmload_path+'htseq-countlog.txt', 'a') as log_file:
#             subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)

# 把counts文件按照GeneID合并, 变成如下格式：GeneID,SRR_and_name[key1],SRR_and_name[key2]...
count_files = os.listdir(counts_dir)
gene_counts = {}
for count_file in count_files:
    with open(counts_dir+count_file, 'r') as f:
        for line in f:
            if line == '\n':
                continue
            parts = line.split('\t')
            gene_id = parts[0]
            count = int(parts[1])
            gene_counts[gene_id] = gene_counts.get(gene_id, {})
            gene_counts[gene_id][count_file] = count
# 把gene_counts写入文件
with open(dowmload_path+'gene_counts.txt', 'w') as f:
    f.write('GeneID')
    for count_file in count_files:
        count_file = count_file.replace('_count.txt', '').replace('-', '_')
        f.write(','+count_file)
    f.write('\n')
    for gene_id in gene_counts:
        f.write(gene_id)
        for count_file in count_files:
            f.write(','+str(gene_counts[gene_id].get(count_file, 0)))
        f.write('\n')
# 创建对应的计数矩阵（Count Matrix）:
# Sample,Condition,Time,Group,Batch
# b1-Maize-cold-05h_count.txt,Cold,05h,Cold-05h,b1
with open(dowmload_path+'count_matrix.txt', 'w') as f:
    f.write('Sample,Condition,Time,Group,Batch\n')
    for count_file in count_files:
        parts = count_file.split('-')
        batch = parts[0]
        condition = parts[2]
        time = parts[3].split('_')[0]
        group = condition+'-'+time
        count_file = count_file.replace('_count.txt', '').replace('-', '_')
        f.write(f'{count_file},{condition},{time},{group},{batch}\n')
