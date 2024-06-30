htseq-count -f bam -r pos -s no -t gene -i ID Gm-L0h_sorted.bam ../../reference/Wm82/Gmax_508_Wm82.a4.v1.gene.gff3 > Gm-L0h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i ID Gm-L2h_sorted.bam ../../reference/Wm82/Gmax_508_Wm82.a4.v1.gene.gff3 > Gm-L2h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i ID Gm-L24h_sorted.bam ../../reference/Wm82/Gmax_508_Wm82.a4.v1.gene.gff3 > Gm-L24h_counts.txt &
htseq-count -f bam -r pos -s no -t gene -i ID Gm-L168h_sorted.bam ../../reference/Wm82/Gmax_508_Wm82.a4.v1.gene.gff3 > Gm-L168h_counts.txt &
wait
echo "FINISHED!!!"

