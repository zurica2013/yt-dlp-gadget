# yt-dlp-gadget
一个用于运行yt-dlp的简单批处理脚本工具，简化了命令行的内容输入，可以使用第三方工具下载合并指定格式的视频和字幕。

## Tips
- 如果已经将yt-dlp.exe添加了环境变量，可以删除脚本中的"cd C:\%HOMEPATH%\Downloads\youtube-dl"，或者将其替换为本机实际存储yt-dlp.exe的路径
- 需要先安装第三方视频处理工具ffmpeg
- 需要使用第三方下载工具aria2c，保存在yt-dlp.exe相同目录下
- 输入的youtube下载路径不能包含特殊字符如"&"，请将特殊字符后的内容全部删除，否则脚本运行会报错
- 脚本必须保存为ANSI编码方式否则会无法正常显示中文内容
- 显色文字部分使用了ANSI转义序列码，复制粘贴时务必留意

## Screenshot
![alt text](https://github.com/zurica2013/yt-dlp-gadget/blob/main/Screenshot.png?raw=true)
