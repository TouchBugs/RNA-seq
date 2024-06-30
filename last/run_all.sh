#!/bin/bash

# 设置日志文件名
log_pfchAT="logs/pfchAT.log"
log_pfchGM="logs/pfchGM.log"
log_pfchOS="logs/pfchOS.log"

# 运行第一个脚本并保存日志
echo "Running pfchAT.sh..."
./pfchAT.sh > "$log_pfchAT" 2>&1 & 
if [ $? -eq 0 ]; then
    echo "pfchAT.sh completed successfully."
else
    echo "pfchAT.sh encountered an error."
fi

# 运行第二个脚本并保存日志
echo "Running pfchGM.sh..."
./pfchGM.sh > "$log_pfchGM" 2>&1 & 
if [ $? -eq 0 ]; then
    echo "pfchGM.sh completed successfully."
else
    echo "pfchGM.sh encountered an error."
fi

# 运行第三个脚本并保存日志
echo "Running pfchOS.sh..."
./pfchOS.sh > "$log_pfchOS" 2>&1 & 
if [ $? -eq 0 ]; then
    echo "pfchOS.sh completed successfully."
else
    echo "pfchOS.sh encountered an error."
fi

echo "All scripts completed."

