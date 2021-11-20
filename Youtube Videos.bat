@echo off
cd %userprofile%\Downloads
if not exist "Youtube videos" mkdir "Youtube videos" 
cd "Youtube videos" 
set /p link="Youtube video link : "
yt-dlp "%link%" --extractor-args youtube:player_client=android --throttled-rate 100K
explorer "..\Youtube videos"
exit /b