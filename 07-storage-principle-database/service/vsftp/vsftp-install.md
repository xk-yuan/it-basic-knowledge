# vsftp install

userdel ftpadmin

useradd -s /bin/bash -d /home/ftpadmin ftpadmin
passwd ftpadmin
123456

mkdir -p 755 /home/ftpadmin/ftp_files

useradd -s /bin/bash -d /home/omcrftp omcrftp
passwd omcrftp
sh_dt_3g
mkdir -p /export/home/omcrftp/mrfile
chown omcrftp:omcrftp -R /export

useradd -s /bin/bash -d /home/wacos wacos
passwd wacos
wacos

/opt/wacos/YK/local
/opt/wacos/server/nms/WebNMS/pm/OperationControl
/opt/oracle/YK

chown wacos:wacos -R /opt/wacos
chown wacos:wacos -R /opt/oracle

--

YKDL_CONSUL_PARAM="--spring.profiles.active=dev --spring.cloud.consul.host=localhost --spring.cloud.consul.port=8500"

YKDL_FTP_PARAM="--config.ftp.host=192.168.10.248 --config.ftp.jdownloadurl=192.168.10.248 --config.ftp.hxwcallurl=192.168.10.248 --config.ftp.zteurl=192.168.10.248 --config.ftp.terminalurl=192.168.10.248"

YKDL_PARAM="--config.ykdl.id=4 --config.ykdl.ip=192.168.10.248 --config.ykdl.port=11001 --config.ykdl.state=STANDBY_STANDBY --config.ykdl.type-station=GZ --config.ykdl.remark-station=广州站,备运控代理"

nohup /home/ykdl/jdk1.8.0_181/bin/java -jar sys-operation-control-1.0.jar $YKDL_CONSUL_PARAM $YKDL_FTP_PARAM $YKDL_PARAM > logs/nohup.out 2> logs/error.log &

