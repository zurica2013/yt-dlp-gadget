@echo off

set /p URL=[45m请输入下载地址：[0m
echo [44m查看可用的下载格式. . .[0m
cd C:\%HOMEPATH%\Downloads\youtube-dl
yt-dlp -F %URL%

set /p OPTION=[45m请设定下载格式（ID数值，可使用+组合）：[0m
echo [44m开始下载. . .[0m

:download
yt-dlp -o C:\%HOMEPATH%\Downloads\%%(title)s.%%(ext)s -f %OPTION% --downloader aria2c --downloader-args aria2c:"-x 16 -k 1M" %URL%
if errorlevel 1 (
   echo [41m下载中断，重新尝试. . .[0m
   goto download
) else (
   echo [42m下载完成，按键退出！[0m
   pause>nul
)
