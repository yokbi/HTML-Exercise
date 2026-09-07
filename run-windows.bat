@echo off
REM run-windows.bat - Little Lemon alistirma sayfalarini yerel sunucuda acar.
REM Kullanim: run-windows.bat  (veya: run-windows.bat 9000)
REM
REM Not: index.html ve location.html BOS dosyalardir (0 bayt) - betik dogrudan
REM blog.html'i acar. Ayrinti: DURUM-RAPORU.md

setlocal
cd /d "%~dp0"

set PORT=%1
if "%PORT%"=="" set PORT=8080

where python >nul 2>&1
if errorlevel 1 (
  echo HATA: python bulunamadi.
  echo   https://www.python.org/downloads/windows/ adresinden Python 3 kurun.
  echo.
  echo   Alternatif: sunucu olmadan da acabilirsiniz -^> blog.html dosyasina cift tiklayin.
  pause
  exit /b 1
)

echo ==^> Sunucu baslatiliyor: http://localhost:%PORT%/blog.html
echo     ^(Durdurmak icin Ctrl+C^)
echo.
echo     Sayfalar:
echo       blog.html      -^> dolu, alistirmanin ana ciktisi
echo       booking.html   -^> dolu, rezervasyon formu
echo       index.html     -^> BOS ^(0 bayt^), beyaz sayfa acar
echo       location.html  -^> BOS ^(0 bayt^), beyaz sayfa acar
echo.

start "" "http://localhost:%PORT%/blog.html"
python -m http.server %PORT%
