wait
for bam_file in *_sorted.bam; do
  # 从BAM文件名生成计数文件名
  count_file="${bam_file%_sorted.bam}_counts.txt"
  # 执行htseq-count命令
  htseq-count -f bam -r pos -s no -t gene -i ID "$bam_file" ../../../reference/Wm82/Gmax_508_Wm82.a4.v1.gene.gff3  > "$count_file" &
  echo $bam_file
  echo $count_file
done

wait
echo "finished"
