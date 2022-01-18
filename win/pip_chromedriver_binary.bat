@echo off

REM 引数の有無確認
if "%1"=="" (
    echo "There is an error in the argument."
    echo "Example : create_venv.bat <ENV_NAME>"
    exit /b
)

REM 引数を取得
set ENV_NAME=%1

REM 必要なパッケージのインストール
call %ENV_NAME%\Scripts\activate & pip install webdriver_manager
call %ENV_NAME%\Scripts\activate & pip install beautifulsoup4
call %ENV_NAME%\Scripts\activate & pip install numpy

REM chromedriver-binaryのバージョン取得
set PREV_DIR=%CD%
cd /d %~dp0
cd /d ../common
call %ENV_NAME%\Scripts\activate & python get_version_chromedriver_binary.py
for /f %%a in (chromedriver_binary_version.txt) do (
    set VAR=%%a
)
del chromedriver_binary_version.txt
cd /d %PREV_DIR%

REM chromedriver-binaryのインストール
call %ENV_NAME%\Scripts\activate & pip install chromedriver-binary==%VAR%

REM seleniumのインストール
call %ENV_NAME%\Scripts\activate & pip install selenium
