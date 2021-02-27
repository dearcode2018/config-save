# ----- 信息 -----
# @filename soft-start.sh
# @version 1.0
# @author qianye.zheng
# @description  自身脚本启动

# 解决远程ssh执行脚本失败问题
source /etc/profile

# 进入脚本所在目录
cd `dirname $0`

# 变量定义
# 应用名称，名称只是作为显示而存在，与进程查找并无关系
declare -r APP_NAME="mysql"
# 启动命令
declare -r STARTUP_CMD="service mysql.server"
# 进程ID文件，启动多个进程则用不同的pid文件
PID_FILE="process.pid"
# 检查次数
CHECK_COUNT=3

# 创建目录
#mkdir -p ${HOME_PATH}
#mkdir -p ${LOG_PATH}

# 进入应用所在目录（虽然都是绝对路径，但有些应用需要进入应用目录才能启动成功）
#cd ${HOME_PATH}

# 进程状态标识变量，0-不存在, 1-存在
PID_FLAG=0

# 使用说明，用来提示输入参数
usage() {
    echo "usage: sh $0 [start | stop | restart | status]"
    exit 1
}

# 检查进程状态
check_pid() {
  if [[ -f "$PID_FILE" ]]; then
    PID=`cat "$PID_FILE" | awk '{print $1}'`
	# 根据进程ID检查该进程是否确实存在
    PID=`ps -aef | grep "$PID" | awk '{print $2}' | grep "$PID"`
    if [[ -z "$PID" ]]; then # -z 字符串长度为0，说明该进程不存在
      PID_FLAG=0
    else
      PID_FLAG=1
    fi
  else
    PID=''
    PID_FLAG=0
  fi
}

# 启动
start() {
  check_pid
  if [[ ${PID_FLAG} -ne 0 ]]; then
    echo "WARN: ${APP_NAME} is already running, PID is ${PID}."
  else
    echo "starting ${APP_NAME} ..."
    rm -f ${PID_FILE}
	# 调用其他脚本
     nohup ${STARTUP_CMD} start > /dev/null 2>&1 &
	 # 将当前原生命令的执行的进程ID写入文件，调用其他脚本则无需写，一般目标脚本都会生成进程ID文件
     echo $! > ${PID_FILE}
	 # 读取目标进程ID文件
	 PID=`cat "${PID_FILE}" | awk '{print $1}'`
    echo "${APP_NAME} has started, PID is ${PID}."
  fi
}

# 停止
stop() {
   ${STARTUP_CMD} stop # 或者执行该软件的停止脚本，若没有则通过kill方式关闭
}

# 输出运行状态
status() {
    ${STARTUP_CMD} status
}

# 重启
restart(){
  stop
  start
}

# 根据输入参数，选择执行对应方法，不输入则执行使用说明
case "$1" in
  "start")
    start
    ;;
  "stop")
    stop
    ;;
  "status")
    status
    ;;
  "restart")
    restart
    ;;
  *)
   # 默认用 restart
    #usage
	restart
    ;;
esac

exit 0
