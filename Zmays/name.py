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
    'SRR4301644'	:	'b2-Maize-cold-05'	,
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
trim_galore="/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore"
for key in SRR_and_name:
    if 'Maize' in SRR_and_name[key]:
        cmd = f'conda run -n cutadapt {trim_galore} --cores 8 -q 20 --illumina --fastqc --output_dir {dowmload_path}{SRR_and_name[key]}/ {dowmload_path}{SRR_and_name[key]}/{SRR_and_name[key]}.fastq'
        print(cmd)
        with open(dowmload_path+'TrimGalorelog.txt', 'a') as log_file:
            subprocess.run(cmd, shell=True, stdout=log_file, stderr=log_file)


