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
    pm2 start ~/chinachu/processes.json
    pm2 save
    exit 1
fi

if [ $1 = "uninstall" ] ; then
    #echo "アンインストールを開始します"
    echo "この機能は未実装です"
    #echo "アンインストールが完了しました"
    exit 1
fi