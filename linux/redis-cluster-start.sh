# ----- 信息 -----
# @filename redis-cluster-start.sh
# @version 1.0
# @author qianye.zheng
# @description  redis集群启动器 (启动/停止，无参-执行重启)

# 解决远程ssh执行脚本失败问题
source /etc/profile

# 进入脚本所在目录
cd `dirname $0`

# 变量定义
# 应用名称，名称只是作为显示而存在，与进程查找并无关系
declare -r APP_NAME="redis"

# 变量定义
if [[ -z $1 ]]; then
  # 默认重启
  command="restart"
else
  # start | status | restart | stop
  command=$1
fi

./master00/node00/start-redis.sh $command
./master00/node01/start-redis.sh $command
./master00/node02/start-redis.sh $command

./master01/node00/start-redis.sh $command
./master01/node01/start-redis.sh $command
./master01/node02/start-redis.sh $command

./master02/node00/start-redis.sh $command
./master02/node01/start-redis.sh $command
./master02/node02/start-redis.sh $command

exit 0