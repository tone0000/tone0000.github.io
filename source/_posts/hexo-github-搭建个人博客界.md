---
title: hexo+github 搭建个人博客
date: 2019-08-06 19:15:25
tags: hexo
img: https://tc-1258808238.cos.ap-chengdu.myqcloud.com/004.jpg
cover: true
coverImg: https://tc-1258808238.cos.ap-chengdu.myqcloud.com/004.jpg
---

## 

## 准备工作

先放个 [官方文档](https://hexo.io/zh-cn/docs/) 

然后你得下载 [nodejs](http://nodejs.cn/download/)  windows mac linux 甚至Android(需要下载termux)都可以安装

接着在你的GitHub里创建个仓库借个图![](https://img-blog.csdn.net/20170827113226349?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvQWluVXNlcg==/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/Center)

然后window的下载[git bash](https://gitforwindows.org/) 安装的时候一路next就行（ps：不要装带c盘，上面那个nodejs也是，不然每次都要开管理员模式 π__π ）。Linux 、mac-os 、Android 、请apt install、yum install、pacman -S 、brew 、pkg install git

## 嗯。。。敲代码？？

假设你的软件都下好了，且都添加了那就开始吧

先设置下你的git bash

```html
ssh-keygen -t rsa -C "你自己注册GitHub的邮箱"  <!--生成你的ssh密钥-->
```

记得添加到你的GitHub设置里的ssh里贴个图给你看看![](https://tc-1258808238.cos.ap-chengdu.myqcloud.com/01.png)

继续敲代码 

``` html
ssh -T git@github.com <--!用来测试你的ssh配置是否正确-->
```

如果显示你的GitHub用户名并提示successfully authenticated 那就:ok_hand: 

``` html
git config --global user.name "你的GitHub登陆名"
git config --global user.email "你的GitHub注册邮箱" <!-- 等会上传到仓库的验证消息 -->
```

在敲npm代码前友情提示，国内直接连接npm服务器的速度可以自行体验下，当然如果有代理的话那就继续。:sweat_smile: ps：国内有[淘宝镜像](http://npm.taobao.org/) 加个 **c**  

继续下一步

``` ba
npm install hexo-cli -g
hexo init blog
cd blog
npm install
npm install hexo-deployer-git --save
```

嗯。没错和官方文档一样的 :smile:

文件弄好之后就按照官方文档修改_config.yml  这个文件尤其最后这个仓库地址![](https://tc-1258808238.cos.ap-chengdu.myqcloud.com/02.png)

然后就可以

``` bash
hexo g -d
```

## 多终端使用

先在github上创建一个分支类似于hexo。现在加上你原来的分支一共有俩 master和hexo

hexo用来存放网站配置node模块 

master用来存hexo渲染过的文章

本地有的话直接复制本地的把ssh密钥改下就成

本地丢失的话就按照之前的步骤本地初始化一个文件夹

再git clone hexo分支

再用hexo 分支 覆盖本地的文件夹就 :white_check_mark:

```bash
git add .
git commit -m "..." #双引号里填你对这个网站做了啥
git push origin hexo
hexo g -d
```

用这个步骤上传。

> ps：可以用自己的模板建立文章直接在 **scaffolds** 建立md文件就好 然后 
>
> ```
> hexo new post2 ""
> ```
>
> 

![](https://tc-1258808238.cos.ap-chengdu.myqcloud.com/068.jpg)