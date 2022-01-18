@echo off

REM 引数の有無確認
if "%1"=="" (
    echo "There is an error in the argument."
    echo "Example : create_venv.bat <ENV_NAME>"
    exit /b
)

REM 引数を取得
set ENV_NAME=%1

rem 仮想環境が存在しない場合のみ作成する
if not exist %ENV_NAME%\ (
    echo "Create ["%ENV_NAME%"] environment"
    
    REM 仮想環境作成
    call python -m venv %ENV_NAME%
    
    REM pipの更新
    call %ENV_NAME%\Scripts\activate & python -m pip install --upgrade pip
    
) else (
	echo "["%ENV_NAME%"] is already exist"
)

REM 必要なパッケージのインストール
call %ENV_NAME%\Scripts\activate & pip install numpy
call %ENV_NAME%\Scripts\activate & pip install pandas
call %ENV_NAME%\Scripts\activate & pip install matplotlib
call %ENV_NAME%\Scripts\activate & pip install seaborn
