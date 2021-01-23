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
    echo "パスワードを入力してください"
    sudo echo "パスワードを確認しました" || exit 0
    sudo sh tuners/px-w3u4/px-w3u4.sh
    sudo sh recpt1/recpt1.sh
    sudo sh mirakurun/mirakurun.sh
    sh chinachu/chinachu.sh
    sudo sh chinachu/chinachu-root.sh
    echo "インストールが完了しました"
    exit 1
fi

if [ $1 = "uninstall" ] ; then
    #echo "アンインストールを開始します"
    echo "この機能は未実装です"
    #echo "アンインストールが完了しました"
    exit 1
fi