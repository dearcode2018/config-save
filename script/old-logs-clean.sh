# ----- 信息 -----
# @filename old-logs-clean.sh
# @version 1.0
# @author qianye.zheng
# @description 清理日志文件

#!/bin/bash

# 日志目录
declare -r LOG_DIR=/data/logs
# 多少天前的文件
declare -r BEFORE_DAY=3
# 文件匹配模式
declare -r FILE_PATTERN=*log*

################################################################################################
# 删除 3天之前修改过的log日志文件，注意要指定目录，避免删错文件
find  $LOG_DIR  -mtime +${BEFORE_DAY} -type f -name $FILE_PATTERN -exec rm -f {} \;
#

#

#

################################################################################################



#

#

#



################################################################################################


#

#

#


################################################################################################















