#! /bin/bash


if [ "$1" = "" ] ; then
    echo "オプションを指定してください(help,install,uninstall)"
    exit 1
fi

if [ $1 = "help" ] ; then
    echo "使い方"
    echo "インストールの場合は"install"オプションを使ってください"
    echo "アンインストールの場合は"uninstall"オプションを使ってください"
    exit 1
fi

if [ $1 = "install" ] ; then
    echo "インストールを開始します"
    # 依存パッケージのインストール
    apt install -y autoconf automake libpcsclite-dev pcscd pcsc-tools
    # recpt1をインストール
    git clone https://github.com/stz2012/recpt1.git
    cd recpt1/recpt1/
    ./autogen.sh
    ./configure --enable-b25
    make
    make install
    cd ../../
    echo "インストールが完了しました"
    exit 1
fi

if [ $1 = "uninstall" ] ; then
    echo "アンインストールを開始します"
    # recpt1をアンインストール
    cd recpt1/recpt1/
    make uninstall
    cd ../../
    echo "アンインストールが完了しました"
    exit 1
fi