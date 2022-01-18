# **venv_bash**

## **概要**

Pythonの仮想環境を実行した時、毎回[pip upgrade]をしたり、
chromeとchromedriverのバージョンを合わせるのがだるかったので、
bashファイルを作成した。

## **前提**
OS：Windows or MacOS (Linuxでも使えるとは思うが試していない)
Python：Python3
その他：Git

## **環境用意&使用方法**

### **Windowsの場合**

#### 1. 環境用意

環境用意は、一度実施すれば以降行う必要はない。環境が既にある場合は、[2.使用方法]からの実施となる。

1. Gitからソースをクローンする。

   ```
   git clone https://github.com/sakagami0615/venv_bash.git
   ```

2. [コントロールパネル > システムとセキュリティ > システム > システムの詳細設定 > 環境変数]にアクセスし、ユーザ環境変数のPathに下記を追加する。

   ```
   <cloneしたフォルダ>\win
   ```

   ※上手くパスが通らない場合は、PCを再起動してみると良いかも？

#### 2. 使用方法

1. 任意のフォルダでコマンドプロンプトを開く。

2. 自身が行いことに応じて以下のbatファイルを実行する。
   ※env は任意の名前で問題ない

   + 仮想環境の作成(pip install --upgread pip含む)

     ```
     create_venv.bat env
     ```

     

   + 仮想環境の作成(chromeによるwebスクレイピングを行う場合)

     ```
     create_venv_scrape.bat env
     ```

     

   + 仮想環境の作成(数値計算 [numpyやpandasなど] を行う場合)

     ```
     create_venv_science.bat env
     ```

     

   + 既に存在する仮想環境にchromedriver_binaryをpipする

     ```
     pip_chromedriver_binary.bat env
     ```

     

   + 既に存在する仮想環境にrequirements.txtの内容をpipする

     ```Python
     pip_chromedriver_binary.bat env
     
     # もし、requirements.txtという名前でない場合は下記のようにも使える
     pip_chromedriver_binary.bat env <任意の名前>
     ```

     

### **MacOSの場合**

#### 1. 環境用意

環境用意は、一度実施すれば以降行う必要はない。環境が既にある場合は、[2.使用方法]からの実施となる。

1. Gitからソースをクローンする。

   ```
   git clone https://github.com/sakagami0615/venv_bash.git
   ```

2. パスを追加していく。今回はzshターミナルを使うことを想定して、[.zshrc]にパス追加の処理を記載する。
   ※ほかのターミナルを使用する場合は、zsh以外のrcファイルも追記が必要になるはず

   + ターミナルを開き、下記コマンドで.zshrcファイルを開く

     ```
     open ~/.zshrc
     ```

   + 開いた.zshrcファイルの最下部に下記を追記する

     ```
     export PATH=<cloneしたフォルダ>/mac:$PATH
     ```

   + 下記コマンドでパスを反映させる

     ```
     source ~/.zshrc
     ```

     

#### 2. 使用方法

1. 任意のフォルダでターミナルを開く。

2. 自身が行いことに応じて以下のbatファイルを実行する。
   ※env は任意の名前で問題ない

   + 仮想環境の作成(pip install --upgread pip含む)

     ```
     create_venv.sh env
     ```

     

   + 仮想環境の作成(chromeによるwebスクレイピングを行う場合)

     ```
     create_venv_scrape.sh env
     ```

     

   + 仮想環境の作成(数値計算 [numpyやpandasなど] を行う場合)

     ```
     create_venv_science.sh env
     ```

     

   + 既に存在する仮想環境にchromedriver_binaryをpipする

     ```
     pip_chromedriver_binary.sh env
     ```

     

   + 既に存在する仮想環境にrequirement.txtの内容をpipする

     ```Python
     pip_chromedriver_binary.sh env
     
     # もし、requirement.txtという名前でない場合は下記のようにも使える
     pip_chromedriver_binary.sh env <任意の名前>
     ```

     

## **参考にした資料**

+ **zshでshファイルを実行できるようにする方法**
https://support.apple.com/ja-jp/guide/terminal/apdd100908f-06b3-4e63-8a87-32e71241bab4/mac
