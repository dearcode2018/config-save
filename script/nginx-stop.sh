# ----- 信息 -----
# @filename nginx-stop.sh
# @version 1.0
# @author qianye.zheng
# @description  nginx 启动器 (启动/停止，无参-执行重启)

# 解决远程ssh执行脚本失败问题
source /etc/profile

# 停止
nginx -s stop

exit 0