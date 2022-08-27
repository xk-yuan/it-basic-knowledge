# FTP

>

## 资源

## 简介

## FTP 常用命令

> 1. 登录

ftp ${IP}

open ${IP}

close  # 结束与服务器的FTP会话
quit   # 结束与服务器的FTP会话并退出FTP环境

pwd    # 查看FTP服务器上的当前工作目录
rename filename newfilename  # 重命名FTP服务器上的文件
deletefilename               # 删除FTP服务器上的文件
help[cmd]                    # 显示FTP命令的帮助信息，cmd是命令名，如果不带参数，则显示所有FTP命令


> 2. 查看文件

dir   # 显示服务器目录和文件列表

ls    # 显示服务器简易的文件列表

cd    # 进入服务器指定的目录

> 3. 本地工作目录

lcd  # 修改本地计算机的工作目录


> 3. 下载文件


type    # 查看当前的传输方式
ascii   # 设定传输方式为ASCII码方式
binary  # 设定传输方式为二进制方式

get     # 下载指定文件

get filename [newname] # ilename为下载的FTP服务器上的文件名，newname为保存在本都计算机上时使用的名字，如果不指定newname，文件将以原名保存

get命令下载的文件将保存在本地计算机的工作目录下。该目录是启动FTP时在盘符C:后显示的目录。


mget    # 下载多个文件

mget filename [filename ....]  # mget命令支持通配符 “” 和 “?”，比如：mget .mp3 表示下载FTP服务器当前目录下的所有扩展名为mp3的文件。


> 4. 上传文件

put    # 上传指定文件

put filename [newname]

send   # 上传指定文件

send filename [newname] # filename为上传的本地文件名，newname为上传至FTP服务器上时使用的名字，如果不指定newname，文件将以原名上传。

上传文件前，应该根据文件的类型设置传输方式，本机的工作目录也应该设置为上传文件所在的目录。

这里的send和put方法用法都基本相同，但是上传速度send却要比put快很多，有兴趣的人可以去研究下。

open
bye
quit
close

type
ascii
binary

cd
ls
lcd
mls


get
mget
put
mput
delete
mdelete
dir
mdir
mkdir
rmdir
rename

user
literal
prompt
send
debug
hash
quote
status
append
verbose
pwd
trace
glob
disconnect
remotehelp
recv
bell
help
!
?


