#prefetch SRR17151213 &
#prefetch SRR17151214 &
#prefetch SRR17151207 &
#prefetch SRR17151210 &
#wait
#echo "compelete!!!"


#fastq-dump --split-3 SRR17151213/SRR17151213.sra &
#fastq-dump --split-3 SRR17151214/SRR17151214.sra &
#fastq-dump --split-3 SRR17151207/SRR17151207.sra &
#fastq-dump --split-3 SRR17151210/SRR17151210.sra &

#wait
#echo "compelete!!!"


/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore --cores 4 -q 20 --illumina --fastqc -o . --paired SRR17151207/SRR17151207_1.fastq SRR17151207/SRR17151207_2.fastq &
/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore --cores 4 -q 20 --illumina --fastqc -o . --paired SRR17151210/SRR17151210_1.fastq SRR17151210/SRR17151210_2.fastq &
/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore --cores 4 -q 20 --illumina --fastqc -o . --paired SRR17151213/SRR17151213_1.fastq SRR17151213/SRR17151213_2.fastq &
/Data4/gly_wkdir/bin/TrimGalore-0.6.10/trim_galore --cores 4 -q 20 --illumina --fastqc -o . --paired SRR17151213/SRR17151214_1.fastq SRR17151213/SRR17151214_2.fastq &

wait
echo "compelete"
