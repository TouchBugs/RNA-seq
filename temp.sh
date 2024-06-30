#!/bin/bash

# 设置文件大小限制为90MB
SIZE_LIMIT=94371840

# 查找当前目录及子目录下所有超过90MB的文件
# 并将它们的路径追加到.gitignore文件中
find . -type f -size +${SIZE_LIMIT}c | while read -r file; do
    # 检查.gitignore文件是否已经存在该条目
    if ! grep -q "^$(printf "%q" "$file")$" .gitignore; then
        # 如果不存在，则追加到.gitignore
        echo "$file" >> .gitignore
        echo "Added $file to .gitignore"
    else
        echo "$file is already in .gitignore"
    fi
done