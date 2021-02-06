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
    git clone git://github.com/Chinachu/Chinachu.git ~/chinachu
    cd ~/chinachu/
    echo 1 | ./chinachu installer
    cp config.sample.json config.json
    sed -i -e 's/"uid": null,/"uid": 1000,/g' config.json
    echo [] > rules.json 
    ./chinachu service wui execute
    echo "インストールが完了しました"
    exit 1
fi

if [ $1 = "uninstall" ] ; then
    #echo "アンインストールを開始します"
    echo "この機能は未実装です"
    #echo "アンインストールが完了しました"
    exit 1
fi
