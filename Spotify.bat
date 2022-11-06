@echo off
cd %userprofile%\Downloads
if not exist "Spotify musics" mkdir "Spotify musics"
cd "Spotify musics"
set /p link="Spotify link or song title : "
spotdl download "%link%"
del .spotdl-cache
explorer "..\Spotify musics"
exit /b
