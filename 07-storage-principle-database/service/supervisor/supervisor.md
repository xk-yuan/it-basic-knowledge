
# supervisor

## 资源

> [官网](http://supervisord.org/)


## 简介

Python开发 ，客户端/服务器系统，Linux/Unix系统下的一个进程管理工具，不支持Windows系统，允许其用户监视和控制类似UNIX的操作系统上的多个进程，用于控制与项目或客户相关的过程，并且旨在在启动时像任何其他程序一样启动。用于监听、启动、停止、重启一个或多个进程。

## 安装


> cd /lib/systemd/system && vim supervisor.service  # 配置systemctl服务

```ini supervisor.service
; [Unit]
; Description=supervisor
; After=network.target

; [Service]
; Type=forking
; ExecStart=/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
; ExecStop=/usr/bin/supervisorctl $OPTIONS shutdown
; ExecReload=/usr/bin/supervisorctl $OPTIONS reload
; KillMode=process
; Restart=on-failure
; RestartSec=42s

; [Install]
; WantedBy=multi-user.target
```

> chmod 766 supervisor.service && systemctl enable supervisor.service & systemctl daemon-reload 开机启动

> supervisortd   # 守护进程服务 (用于接收进程管理命令)

> supervisorctl  # 客户端 (用于和守护进程通信, 发送管理进程的指令)

> echo_supervisord_conf # 生成初始配置文件程序 | echo_supervisord_conf > /etc/supervisor/supervisord.conf 生成配置文件

