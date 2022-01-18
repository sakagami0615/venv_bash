# 引数の有無確認
if [ $# -ne 1 ]; then
    echo "There is an error in the argument."
    echo "Example : create_venv.bat <ENV_NAME>"
    exit 1
fi

# 引数を取得
ENV_NAME=$1

# 仮想環境が存在しない場合のみ作成する
if [ ! -d $ENV_NAME ]; then
    echo "Create ["$ENV_NAME"] environment"
    
    # 仮想環境作成
    python -m venv $ENV_NAME
    
    # pipの更新
    source $ENV_NAME/bin/activate
    python -m pip install --upgrade pip
else
    echo "["$ENV_NAME"] is already exist"
fi

# chromedriver_binaryのインストール
source $ENV_NAME/bin/activate
msg=`pip_chromedriver_binary.sh $ENV_NAME`
