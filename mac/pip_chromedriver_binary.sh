# 引数の有無確認
if [ $# -ne 1 ]; then
    echo "There is an error in the argument."
    echo "Example : create_venv.bat <ENV_NAME>"
    exit 1
fi

# 引数を取得
ENV_NAME=$1

# 必要なパッケージのインストール
source $ENV_NAME/bin/activate
pip install webdriver_manager
pip install beautifulsoup4
pip install numpy

# chromedriver-binaryのバージョン取得
PREV_DIR=`pwd`
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
cd ../common
python get_version_chromedriver_binary.py
VAR=`cat chromedriver_binary_version.txt`
rm chromedriver_binary_version.txt
cd $PREV_DIR

# chromedriver-binaryのインストール
pip install chromedriver-binary==$VAR

# seleniumのインストール
pip install selenium
