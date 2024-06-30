wait
for bam_file in *_sorted.bam; do
  # 从BAM文件名生成计数文件名
  count_file="${bam_file%_sorted.bam}_counts.txt"
  # 执行htseq-count命令
  htseq-count -f bam -r pos -s no -t gene -i gene_id "$bam_file" ../../../reference/Rice/Oryza_sativa.IRGSP-1.0.59.chr.gff3 > "$count_file" &
  echo $bam_file
  echo $count_file
done

wait
echo "finished"
