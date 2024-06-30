htseq-count -f bam -r pos -s no -t gene -i gene_id Os-L0h_sorted.bam ../../reference/Rice/Oryza_sativa.IRGSP-1.0.59.chr.gff3 > Os-L0h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i gene_id Os-L2h_sorted.bam ../../reference/Rice/Oryza_sativa.IRGSP-1.0.59.chr.gff3 > Os-L2h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i gene_id Os-L24h_sorted.bam ../../reference/Rice/Oryza_sativa.IRGSP-1.0.59.chr.gff3 > Os-L24h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i gene_id Os-L168h_sorted.bam ../../reference/Rice/Oryza_sativa.IRGSP-1.0.59.chr.gff3 > Os-L168h_counts.txt &
wait
echo "FINISHED!!!"

