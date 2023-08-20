@echo off
cd C:\%HOMEPATH%\Downloads\youtube-dl
set /P url=[45m输入下载地址：[0m
echo [43m查看可用的视频格式. . .[0m
yt-dlp -F %url% --cookies www.bilibili.com_cookies.txt

:format
set /P fmt=[45m设置下载格式（ID值，组合使用+）：[0m
yt-dlp -s -f %fmt% %url% >nul 2>info.log --cookies www.bilibili.com_cookies.txt
findstr /C:"Requested format is not available" info.log
if %errorlevel%==0 (
   echo [41m下载格式不可用！[0m
   goto format
)

:subtitle
echo [43m查看可用的字幕类型（简/繁/英）. . .[0m
yt-dlp --list-subs %url% >>info.log
findstr /C:"has no subtitles" info.log
if %errorlevel%==0 (
   echo [41m无字幕可用！[0m
   goto download2
)
findstr "^en ^zh" info.log | findstr /V "from"
set /P lang=[45m设置字幕语言（第1项）：[0m
set /P sub=[45m设置字幕格式（第3项）：[0m

:download1
echo [43m下载开始. . .[0m
yt-dlp -o C:\%HOMEPATH%\Downloads\%%(title)s.%%(ext)s --downloader aria2c --downloader-args aria2c:"-x 16 -k 1M" -f %fmt% --embed-subs --sub-langs %lang% --sub-format %sub% %url% --cookies www.bilibili.com_cookies.txt
if errorlevel 1 (
   echo [41m下载失败，重新尝试. . .[0m
   goto download1
) else (
   goto end
)

:download2
echo [43m下载开始. . .[0m
yt-dlp -o C:\%HOMEPATH%\Downloads\%%(title)s.%%(ext)s --downloader aria2c --downloader-args aria2c:"-x 16 -k 1M" -f %fmt% %url% --cookies www.bilibili.com_cookies.txt
if errorlevel 1 (
   echo [41m下载失败，重新尝试. . .[0m
   goto download2
) else (
   goto end
)

:end
echo [42m下载完成，按键退出！[0m
pause>nul
