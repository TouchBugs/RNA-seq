#!/bin/bash

# 获取当前目录下所有以SRR开头的目录列表
directories=$(find . -maxdepth 1 -type d -name "SRR*")

# 遍历每个目录
for dir in $directories; do
    echo "Processing $dir..."
    
    # 解压缩目录中的所有匹配的文件
    for file in "$dir"/*_val_*.fq.gz; do
        echo "Decompressing $file..."
        gzip -d "$file" &
    done
done

echo "All decompression tasks completed."

