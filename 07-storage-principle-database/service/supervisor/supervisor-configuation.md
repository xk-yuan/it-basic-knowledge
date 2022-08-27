# supervisor configuation

## 配置service类型服务

> vim /etc/rc.d/init.d/supervisor

> chmod 755 /etc/rc.d/init.d/supervisor & chkconfig supervisor on

```bash supervisord
#!/bin/bash
#
# supervisord   This scripts turns supervisord on
#
# Author:       Mike McGrath <mmcgrath@redhat.com> (based off yumupdatesd)
#
# chkconfig:    - 95 04
#
# description:  supervisor is a process control utility.  It has a web based
#               xmlrpc interface as well as a few other nifty features.
# processname:  supervisord
# config: /etc/supervisor/supervisord.conf
# pidfile: /var/run/supervisord.pid
#

# source function library
. /etc/rc.d/init.d/functions

RETVAL=0

start() {
    echo -n $"Starting supervisord: "
    daemon "supervisord -c /etc/supervisor/supervisord.conf "
    RETVAL=$?
    echo
    [ $RETVAL -eq 0 ] && touch /var/lock/subsys/supervisord
}

stop() {
    echo -n $"Stopping supervisord: "
    killproc supervisord
    echo
    [ $RETVAL -eq 0 ] && rm -f /var/lock/subsys/supervisord
}

restart() {
    stop
    start
}

case "$1" in
  start)
    start
    ;;
  stop) 
    stop
    ;;
  restart|force-reload|reload)
    restart
    ;;
  condrestart)
    [ -f /var/lock/subsys/supervisord ] && restart
    ;;
  status)
    status supervisord
    RETVAL=$?
    ;;
  *)
    echo $"Usage: $0 {start|stop|status|restart|reload|force-reload|condrestart}"
    exit 1
esac

exit $RETVAL
```

## supervisord 配置

### 1. supervisord.conf

[程序查找配置文件路径]

$CWD/supervisord.conf       # // $CWD表示运行supervisord程序的目录
$CWD/etc/supervisord.conf
/etc/supervisord.conf
/etc/supervisor/supervisord.conf (since Supervisor 3.3.0)
../etc/supervisord.conf (Relative to the executable)
../supervisord.conf (Relative to the executable)

```ini
[supervisord.conf]

[unix_http_server]
file=/opt/sinoxx/data/supervisor/supervisor.sock

[supervisord]
logfile=/opt/sinoxx/data/supervisor/supervisord.log
logfile_maxbytes=50MB
logfile_backups=10
loglevel=info
pidfile=/opt/sinoxx/data/supervisor/supervisord.pid
nodaemon=false
minfds=1024
minprocs=200
user=root

[rpcinterface:supervisor]
supervisor.rpcinterface_factory = supervisor.rpcinterface:make_main_rpcinterface

[supervisorctl]
serverurl=unix:///opt/sinoxx/data/supervisor/supervisor.sock

[program:sinoxx-rtdps]
command=/opt/bin/jdk/bin/java -jar sinoxx-rtdps.jar
directory=/opt/sinoxx/rtdps
user=root
autorestart=true
startretries=10
redirect_stderr=true
stdout_logfile=/opt/sinoxx/rtdps/run-su.log

[program:sinoxx-sserver-alarm]
command=/opt/bin/jdk/bin/java -jar sinoxx-sserver-alarm.jar
directory=/opt/sinoxx/alarm-service
user=root
autorestart=true
startretries=10
redirect_stderr=true
stdout_logfile=/opt/sinoxx/alarm-service/run-su.log
```


```ini
[unix_http_server]
file=/tmp/supervisor.sock   ; UNIX socket 文件, supervisorctl 会使用
;chmod=0700                 ; socket文件的mode, 默认是0700
;chown=nobody:nogroup       ; socket文件的owner, 格式: uid:gid

;[inet_http_server]         ; HTTP服务器, 提供web管理界面
;port=127.0.0.1:9001        ; Web管理后台运行的IP和端口, 如果开放到公网, 需要注意安全性
;username=user              ; 登录管理后台的用户名
;password=123               ; 登录管理后台的密码

[supervisord]
logfile=/tmp/supervisord.log ; 日志文件, 默认是 $CWD/supervisord.log
logfile_maxbytes=50MB        ; 日志文件大小, 超出会rotate, 默认 50MB, 如果设成0, 表示不限制大小
logfile_backups=10           ; 日志文件保留备份数量默认10, 设为0表示不备份
loglevel=info                ; 日志级别, 默认info, 其它: debug, warn, trace
pidfile=/tmp/supervisord.pid ; pid 文件
nodaemon=false               ; 是否在前台启动, 默认是false, 即以 daemon 的方式启动
minfds=1024                  ; 可以打开的文件描述符的最小值, 默认 1024
minprocs=200                 ; 可以打开的进程数的最小值, 默认 200

[supervisorctl]
serverurl=unix:///tmp/supervisor.sock ; 通过UNIX socket连接supervisord, 路径与unix_http_server部分的file一致
;serverurl=http://127.0.0.1:9001 ; 通过HTTP的方式连接supervisord

; [program:xx]是被管理的进程配置参数, xx是进程的名称
[program:xx]
command=/opt/apache-tomcat-8.0.35/bin/catalina.sh run  ; 程序启动命令
autostart=true       ; 在supervisord启动的时候也自动启动
startsecs=10         ; 启动10秒后没有异常退出, 就表示进程正常启动了, 默认为1秒
autorestart=true     ; 程序退出后自动重启, 可选值：[unexpected,true,false], 默认为unexpected, 表示进程意外杀死后才重启
startretries=3       ; 启动失败自动重试次数, 默认是3
user=tomcat          ; 用哪个用户启动进程, 默认是root
priority=999         ; 进程启动优先级, 默认999, 值小的优先启动
redirect_stderr=true ; 把stderr重定向到stdout, 默认false
stdout_logfile_maxbytes=20MB  ; stdout 日志文件大小, 默认50MB
stdout_logfile_backups = 20   ; stdout 日志文件备份数, 默认是10
; stdout 日志文件, 需要注意当指定目录不存在时无法正常启动, 所以需要手动创建目录(supervisord 会自动创建日志文件)
stdout_logfile=/opt/apache-tomcat-8.0.35/logs/catalina.out
stopasgroup=false     ; 默认为false, 进程被杀死时, 是否向这个进程组发送stop信号, 包括子进程
killasgroup=false     ; 默认为false, 向进程组发送kill信号, 包括子进程

;包含其它配置文件
[include]
files = relative/directory/*.ini    ; 可以指定一个或多个以.ini结束的配置文件



// include示例
[include]
files = /opt/absolute/filename.ini /opt/absolute/*.ini foo.conf config??.ini
```

### 2. 配置管理进程

进程管理配置参数, 不建议全都写在supervisord.conf文件中, 应该每个进程写一个配置文件放在include指定的目录下包含进supervisord.conf文件中

创建/etc/supervisor/config.d目录, 用于存放进程管理的配置文件, 修改supervisord.conf中的include参数, 将/etc/supervisor/conf.d目录添加到include中

```ini 配置Tomcat进程案例
[program:tomcat]
command=/opt/apache-tomcat-8.0.35/bin/catalina.sh run
stdout_logfile=/opt/apache-tomcat-8.0.35/logs/catalina.out
autostart=true
autorestart=true
startsecs=5
priority=1
stopasgroup=true
killasgroup=true
```
