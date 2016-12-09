---
科大讯飞语音识别Demo
---

###坑一：
看官方文档的集成要加上太多的库，所以想用 Cocoapods 来集成，很幸（狗屎）运，还真在github上找到了，并且还支持Cocoapods安装，[这个](https://github.com/1617176084/iflyMSC)看着好像官方的，所以安装……然后……一直报10407错误……

###坑二：
不知道从哪弄到一个sdk，拖入工程，注册appid……报10407……

总结：
科大的sdk这个有点扯，appid和sdk.framework 是绑定的，也就是说，在下载sdk的时候它会让你选择你创建的应用--appid已绑定，然后你用这个framework的时候就只能用这个appid来初始化了，不然--10407……


sdk集成成功之后用着还是蛮方便的，写了一个[demo](https://github.com/jiutianhuanpei/IFlyDemo)，是无UI的语音识别，其中的解析方法是从它们Demo里拿的。
