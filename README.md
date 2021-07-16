# OCFTPUploadDemo
针对 Objective-C FTP 功能的预研及 demo 的实现
## 方法一：CFNetwork.framework
官方 framework，从 iOS 10 开始已废弃 FTP 相关 API，但仍可以使用
https://developer.apple.com/documentation/CFNetwork

## 方法二：NSUrlSession
官方推荐的处理方法，只支持 FTP 下载，不支持上传，由于安全性原因，推荐使用 HTTPS 代替 FTP
https://developer.apple.com/forums/thread/90930

## 使用手机安装 APP 搭建 FTP 服务器，用虚拟机通过 FTP 进行上传
### XMFTPServer-master(搭建真机 FTP 服务器)
使用其搭建FTP服务器，在 FileZilla 中更改文件夹访问权限，然后用 SimpleFTPClient 上传文件到 FTP

### SimpleFTPClient(另一个手机通过安装此 APP 实现通过 FTP 通道对文件的上传)
使用 CFNetwork.framework 将文件上传到 FTP