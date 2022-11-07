@echo off

IF NOT EXIST spotdl.exe echo Downloading spotdl... && curl -sL "https://github.com/spotDL/spotify-downloader/releases/download/v4.0.2/spotdl-4.0.2-win32.exe" --output spotdl.exe
IF NOT EXIST yt-dlp.exe echo Downloading yt-dlp... && curl -sL "https://github.com/yt-dlp/yt-dlp/releases/download/2022.10.04/yt-dlp.exe" --output yt-dlp.exe
IF NOT EXIST %userprofile%\.spotdl\ffmpeg.exe echo Downloading ffmpeg... && spotdl --download-ffmpeg > NUL
IF NOT EXIST "Spotify musics" mkdir "Spotify musics"
IF NOT EXIST "Youtube videos" mkdir "Youtube videos"
IF NOT EXIST "Youtube musics" mkdir "Youtube musics"

set /p query="Youtube/Spotify link or song title : "
echo %query%|findstr /r "^youtu.be/ ^https://youtu.be/ ^youtube.com/ ^https://youtube.com/ ^www.youtube.com/ ^https://www.youtube.com/" > NUL
IF ERRORLEVEL 1 GOTO spotify
:prompt
echo [1] - Download the video
echo [2] - Download the audio
set /p option="Option : "
IF "%option%" == "1" (GOTO youtubeVideo)
IF "%option%" == "2" (GOTO youtubeMusic)
GOTO prompt

:spotify
cd "Spotify musics"
.\..\spotdl.exe download "%query%"
explorer .
exit /b

:youtubeVideo
cd "Youtube videos"
.\..\yt-dlp "%query%" --output "%%(title)s.%%(ext)s"
explorer .
exit /b

:youtubeMusic
cd "Youtube musics"
.\..\yt-dlp "%query%" --output "%%(title)s.%%(ext)s" -x --audio-format mp3 --audio-quality 0 --embed-thumbnail --xattrs --ffmpeg-location %userprofile%\.spotdl\ffmpeg.exe
explorer .
exit /b