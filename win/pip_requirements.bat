@echo off

REM 引数の有無確認
if "%1"=="" (
    echo "There is an error in the argument."
    echo "Example : create_venv.bat <ENV_NAME>"
    exit /b
)

REM 引数を取得
set ENV_NAME=%1

REM パッケージのバージョン記載テキスト名の取得
set REQ_NAME="requirements.txt"
if not "%2"=="" (
    set REQ_NAME=%2
)

rem 仮想環境 および requirementsファイル が存在する場合のみ実施する
if exist %ENV_NAME%\ (
    if exist %REQ_NAME% (
        REM パッケージのインストール
        call %ENV_NAME%\Scripts\activate & pip install -r %REQ_NAME%
    )
)
