#!/bin/sh

# rsync auto sync script with inotify
# 2021-10-11 jiyuan
# variables
#
# RSYNC_EXCLUDE="--exclude-from=/home/ykdl/conf/rsyncd/exclude.lst"
# /usr/bin/rsync -auvrtzopgP $RSYNC_EXCLUDE --progress --bwlimit=200 --password-file=/home/ykdl/conf/rsyncd/client.password /home/ftpadmin/ftp_files root@192.168.10.246::module_home_ftp
#

current_date=$(date +%Y%m%d_%H%M%S)
log_file=/var/log/client.log

# rsync config
rsync_server_ip=10.11.0.236
rsync_user=root
rsync_pwd=/etc/rsyncd/client.password
# 同步的源目录
source_path=/home/ykdl/vsftpd/data/root/home/ftpadmin/ftp_files
# 同步到的服务器模块
rsync_module=module_home_ftp
#
INOTIFY_EXCLUDE='(.*/*\.log|.*/*\.swp)$|^/tmp/src/mail/(2014|20.*/.*che.*)'
RSYNC_EXCLUDE='/etc/rsyncd/exclude.lst'

#
inotifywait=/usr/local/bin/inotifywait
rsync=/usr/bin/rsync

# rsync client pwd check
if [ ! -e ${rsync_pwd} ];then
    echo -e "rsync client passwod file ${rsync_pwd} does not exist!"
    exit 0
fi

# inotify_function
inotify_fun(){
    $inotifywait -mrq --timefmt '%Y/%m/%d-%H:%M:%S' --format '%T %w %f' \
          --exclude ${INOTIFY_EXCLUDE}  -e modify,create,delete,attrib,close_write,move ${source_path} \
          | while read file
      do
        echo "run rsync is ... $rsync -auvrtzopgP --port 873 --delete --exclude-from=${RSYNC_EXCLUDE} --progress --bwlimit=200 --password-file=${rsync_pwd} ${source_path} ${rsync_user}@${rsync_server_ip}::${rsync_module} "
        
       $rsync -auvrtzopgP --port 873 --delete --exclude-from=${RSYNC_EXCLUDE} --progress --bwlimit=200 --password-file=${rsync_pwd} ${source_path} ${rsync_user}@${rsync_server_ip}::${rsync_module}

       echo "run rsync done ." 
     done
}

# inotify log
inotify_fun

#inotify_fun >> ${log_file} 2>&1 &


# #!/bin/sh

# #
# RSYNC_EXCLUDE="--exclude-from=/home/ykdl/conf/rsyncd/exclude.lst"

# #
# inotifywait -mrq --format '%Xe %w%f' -e modify,create,delete,attrib,close_write,move /var/ftp/pub/|while read line
# do
#   echo "rsync running ..."
   
#   /usr/bin/rsync -auvrtzopgP $RSYNC_EXCLUDE --progress --bwlimit=200 --password-file=/home/ykdl/conf/rsyncd/client.password /home/ftpadmin/ftp_files root@192.168.10.246::module_home_ftp
#   /usr/bin/rsync -auvrtzopgP $RSYNC_EXCLUDE --progress --bwlimit=200 --password-file=/home/ykdl/conf/rsyncd/client.password /home/ftpadmin/ftp_files root@192.168.10.247::module_home_ftp
#   /usr/bin/rsync -auvrtzopgP $RSYNC_EXCLUDE --progress --bwlimit=200 --password-file=/home/ykdl/conf/rsyncd/client.password /home/ftpadmin/ftp_files root@192.168.10.248::module_home_ftp

#   echo "srync done."

# done
