# ROS开发学习文档
## 1 环境安装

### 1.1 vscode
#### 下载和安装
下载地址: https://code.visualstudio.com/Download

版本一般选择✖64

安装:
>sudo dpkg -i 文件名.deb

#### 插件
python

c/c++

cmake

ros

git graph

markdown all in one
### git 

## ROS安装
执行installROS1.sh即可

测试是否安装成功：


## Git配置
### 安装git
### 配置公钥
首先要在本地生成公钥

生成方法：https://gitee.com/help/articles/4181#article-header0

然后要把公钥加到远程仓库里面


## Tips
### 1 关闭sudo命令下每次需要输入密码
terminal执行
>sudo visudo

最后一行改成
>%sudo  ALL=(ALL:ALL) NOPASSWD:ALL

然后保存退出