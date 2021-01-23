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
    sudo -u $USER git clone git://github.com/Chinachu/Chinachu.git ~/chinachu
    sudo -u $USER cd ~/chinachu/
    sudo -u $USER echo 1 | ./chinachu installer
    sudo -u $USER cp config.sample.json config.json
    sudo -u $USER sed -i -e 's/"uid": null,/"uid": 1000,/g' config.json
    sudo -u $USER echo [] > rules.json
    pm2 start processes.json
    pm2 save   
    echo "インストールが完了しました"
    exit 1
fi

if [ $1 = "uninstall" ] ; then
    #echo "アンインストールを開始します"
    echo "この機能は未実装です"
    #echo "アンインストールが完了しました"
    exit 1
fi