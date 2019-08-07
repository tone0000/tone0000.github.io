---
title: Termux 搭建http服务
date: 2019-08-07 10:07:50
tags: Termux
img: https://tc-1258808238.cos.ap-chengdu.myqcloud.com/050.jpg
cover: true
coverImg: https://tc-1258808238.cos.ap-chengdu.myqcloud.com/050.jpg
---

## 

![](https://tc-1258808238.cos.ap-chengdu.myqcloud.com/060.jpg)





## 一、Termux是个啥？

Termux是一个Android的linux模拟器，能在手机模拟linux环境。



## 二、准备工作

首先国内使用要换源，这里使用的是清华源，这是[官方文档](https://mirrors.tuna.tsinghua.edu.cn/help/termux/) 也可以直接复制代码

``` shell
sed -i 's@^\(deb.*stable main\)$@#\1\ndeb
https://mirrors.tuna.tsinghua.edu.cn/termux stable main@' 
$PREFIX/etc/apt/sources.list
pkg up
```

访问手机存储

```bash
termux-setup-storag
```

Termux 提供两种包管理工具apt 和 pkg 

```bash
# 安装软件包
$ pkg install [package name]

# 卸载软件包
$ pkg uninstall [package name]

# 列出所有软件包
$ pkg list-all
```

==pkg== 本身是基于==apt== 的，相当于在apt install 之前先进行了==apti update== 用来保证下载的软件都是新的。

## 三、正式开始

安装nodejs

```bash
apt install nodejs
```

记得给npm换个[国内的软件源](https://npm.taobao.org/) 

搭建http-server服务

```bash
npm install -g http-server
```

然后http-server就可以执行了

```bash
http-server #这个是在根目录
http-server storge/download #这个是指定要显示的目录
hs #这个是简写也可以运行
```

这个是该命令可以加的参数![](https://tc-1258808238.cos.ap-chengdu.myqcloud.com/A-04.png)

在一个局域网里直接提供IP地址就行，不在的话可以开机手机热点让其他设备链接热点，在浏览器访问IP地址

下面图片里的192.168.2.6:8080就是其他设备访问你的网址，将其输在浏览器里就可以访问并从中下载文件了

![](https://tc-1258808238.cos.ap-chengdu.myqcloud.com/A-05.png)

当然还有Python大法

```bash
apt install python
```

```python
python -m http.server 8080 
#这个要指定目录的话请直接在你想要打开的目录里开启此服务
```



Termux 还可以架设 [Apache 服务器](http://www.termuxtutorials.ga/2018/06/how-to-install-apache2-in-termux-termux.html)，或者通过[其他途径](https://wiki.termux.com/wiki/Remote_Access)（FTP、SSH、Rsync）访问手机



​															完结撒花  :tada: 

