# docker 记录

##docker 


### 1.下载image
- 搜索可用的镜像:`docker search ubuntu `
- 下载对应的镜像:`docker pull ubuntu  `  

### 2.创建和使用容器  
- 启动停止一个容器  

> docker start duan  
> docker stop duan  

- 创建一个容器:  

>  `docker create --name [my docker name] [docker image name]`  
	`example:docker create --name myubuntu ubuntu`
- 运行一个容器，`-d`指定后台运行:  
> `docker run -it --name [NAMES] [IMAGE]`  
> `example:docker run -it --name ubuntu_name ubuntu`  
> `example:docker run -dit --name duan --network=host ubuntu /bin/bash`   

- 如果在build时未指定镜像名，也可以通过image id来启动。  

>	`docker run -dit --name duan --network=host 1ab2feb77569 /bin/bash`  

- 查看当前运行的容器 `docker ps -a`

```
	CONTAINER ID        IMAGE               COMMAND             	CREATED             STATUS                     PORTS               	NAMES
	bfe2cfee7b33        ubuntu              "/bin/bash"         35 minutes ago      Exited (0) 6 minutes ago                       ubuntu_duan
```
- 进入运行的容器中  
> ``docker exec -e COLUMNS="`tput cols`" -e LINES="`tput lines`" -ti mytest bash  ``
> `example:docker exec -ti opencv bash`
> `docker run -it --name file006 --network=host c5db9b0b75ad`  
> ``docker run -it --name test01 --network=host mtu007 /bin/bash -c "bash /home/duan/backserver/install_crontask.sh 192.168.200.213"``  
> ``docker run -dit --name file008 --network=host 022ca3187da1 /bin/bash -c "bash /home/duan/backserver/install_crontask.sh 192.168.1.123"``  
> ``docker run -dit --name park_other --network=host mypark:v0.5 /bin/bash -c "bash /home/duan/backserver/install_crontask.sh 192.168.200.213"``



- 将修改后的镜象保存起来  

 ``docker commit -a "By BigFish" -m "ParkImageRecognPythonProject" 3a7c73e03212（镜像的id） mypython``
 
> -a :提交的镜像作者  
> -c :使用Dockerfile指令来创建镜像  
> -m :提交时的说明文字  
> -p :在commit时，将容器暂停  

- 将镜像导出  

> `docker save mypython > mypython.docker.tar`


## 不用每次执行docker命令都输入sudo
```
groups
duan adm cdrom sudo dip plugdev lpadmin sambashare
#将当前用户加入docker组中
sudo usermod -aG docker duan
#重新登陆当前用户
su - duan
```

## `docker中出现怎么也找不到DISPLAY环境变量的错误 ('couldn\'t connect to display ":0"',) `
```
我的解决办法是在run的时候加上--network=host。
docker run -dit --name test --network=host mypython 
sudo apt-get install --reinstall python-pkg-resources
```

# rsync同步数据到服务器
`rsync -rvazpt --progress /home/duan/backserver/image_rsync/ --remove-source-files duanshuai@192.168.200.239:/var/services/homes/duanshuai/192.168.200.199`

