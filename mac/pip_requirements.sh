# 引数の有無確認
if [ $# -lt 1 ]; then
    echo "There is an error in the argument."
    echo "Example : create_venv.bat <ENV_NAME>"
    exit 1
fi

# 引数を取得
ENV_NAME=$1

# パッケージのバージョン記載テキスト名の取得
REQ_NAME="requirements.txt"
if [ $# -ge 2 ]; then
    REQ_NAME=$2
fi

# 仮想環境 および requirementsファイル が存在する場合のみ実施する
if [ -d $ENV_NAME ]; then
    if [ -f $REQ_NAME ]; then
        # パッケージのインストール
        source $ENV_NAME/bin/activate
        pip install -r $REQ_NAME
    fi
fi
