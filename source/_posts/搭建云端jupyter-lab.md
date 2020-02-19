---
title: 搭建云端jupyter lab
date: 2019-11-03 15:50:47
tags: 教程
img: https://i.loli.net/2020/02/19/s3pfUKhXOGyqnkA.jpg
cover: true
coverImg: https://i.loli.net/2020/02/19/s3pfUKhXOGyqnkA.jpg
---

# jupyter lab 搭建与配置

## 下载并安装Anaconda

国内镜像站清华 [安装包](https://mirrors.tuna.tsinghua.edu.cn/anaconda/archive/) 和 [源](https://mirror.tuna.tsinghua.edu.cn/help/anaconda/)  

下载完后安装 windows **点击** linux **bash**  MAC **chmod** +x name(添加执行权限然后运行) ./ name

安装一路yes最后询问是否添加到环境变脸默认为no可以选择yes

## 安装完毕后配置jupyter lab



在用户目录输入jupyter lab --generate-config

然后在用户目录 ~/.jupyter 下会生成一个 **jupyter_notebook_config.py**  文件

配置访问密码  jupyter-notebook password 

用ipython设置hash密码

```python
ipython
from notebook.auth import passwd
passwd()
# 输入你自己设置登录JupyterLab界面的密码，
# 然后就会生产下面这样的密码，将它记下来，待会儿用
'sha1:b92f3fb7d848:a5d40ab2e26aa3b296ae1faa17aa34d3df351704'
```

编辑该文件

```python
c.NotebookApp.allow_root = True
c.NotebookApp.ip = '0.0.0.0'
c.NotebookApp.notebook_dir = u'/root/JupyterLab' 
c.NotebookApp.open_browser = False
c.NotebookApp.password = u'sha1:b92f3fb7d848:a5d40ab2e26aa3b296ae1faa17aa34d3df351704'
c.NotebookApp.port = 8888

# 解释以上各项
允许以root方式运行jupyterlab
允许任意ip段访问
设置jupyterlab页面的根目录
默认运行时不启动浏览器，因为服务器默认只有终端嘛
设置之前生产的哈希密码
设置访问端口
```

安装python环境

```python
sudo apt-get install python-pip python-dev build-essential 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv 
sudo apt-get install python-setuptools python-dev build-essential 
sudo easy_install pip 
sudo pip install --upgrade virtualenv 
sudo apt-get install python3-pip
sudo apt-get install python-pip
sudo pip3 install --upgrade pip
sudo pip2 install --upgrade pip
sudo pip install --upgrade pip
```

安装python内核

```python
sudo pip2 install ipykernel
sudo pip3 install ipykernel
```

安装nodejs方便安装扩展

```
conda install nodejs 
```

安装扩展github和toc

```text
jupyter labextension install @jupyterlab/github
jupyter labextension install @jupyterlab/toc
```

github需要在**jupyter_notebook_config.py** 中添加

```
c.GitHubConfig.access_token = '< YOUR_ACCESS_TOKEN >'
```

token在用户设置的develop的token中新增，如果不知道勾什么就都勾上

## 安全组选项

如果选择的服务器有防火墙请在安全组中开放选定端口上文提到的是8888 可以自行设置端口但要在安全组中放行端口

放行端口设置一般为 0.0.0.0/0  （可访问ip段所有ip）TCP:端口（8888）

## 后台运行

```
apt install screen
screen -S jupterlab
jupyter lab
```

 `ctrl+A+D`退出这个窗口 

## 访问

在浏览器输入公网ip:8888(端口)

输入密码