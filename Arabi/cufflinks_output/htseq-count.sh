htseq-count -f bam -r pos -s no -t gene -i gene_id At-L0h_sorted.bam ../../reference/Arab/Arabidopsis_thaliana.TAIR10.59.gff3 > At-L0h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i gene_id At-L2h_sorted.bam ../../reference/Arab/Arabidopsis_thaliana.TAIR10.59.gff3 > At-L2h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i gene_id At-L24h_sorted.bam ../../reference/Arab/Arabidopsis_thaliana.TAIR10.59.gff3 > At-L24h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i gene_id At-L168h_sorted.bam ../../reference/Arab/Arabidopsis_thaliana.TAIR10.59.gff3 > At-L168h_counts.txt &
wait
echo "FINISHED!!!"

