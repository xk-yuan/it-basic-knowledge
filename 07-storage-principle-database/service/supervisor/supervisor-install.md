# supervisor install

## 

[centos7]

  : yum install epel-release -y && yum install -y supervisor

  : systemctl enable supervisord
  
  : systemctl start supervisord
  
  : systemctl status supervisord

[pip]

  : pip install supervisor

## 离线安装 (https://www.cnblogs.com/xiejava/p/12911491.html)


## 

> 通过supervisorctl客户端控制进程, 启动、停止、重启
supervisorctl status
supervisorctl reread
supervisorctl update custmgrsvc
supervisorctl stop custmgrsvc
supervisorctl start custmgrsvc
supervisorctl restart custmgrsvc

> /etc/supervisord.conf

> /etc/supervisord.d

> supervisord -c /etc/supervisor/supervisord.conf # 启动服务