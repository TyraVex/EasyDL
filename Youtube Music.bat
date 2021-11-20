@echo off
cd %userprofile%\Downloads
if not exist "Youtube musics" mkdir "Youtube musics"
cd "Youtube musics"
set /p link="Youtube music link : "
yt-dlp "%link%" --extractor-args youtube:player_client=android --throttled-rate 100K -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --xattrs
explorer "..\Youtube musics"
exit /b