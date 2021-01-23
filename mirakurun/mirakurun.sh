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
    curl -sL https://deb.nodesource.com/setup_14.x | bash -
    apt-get install -y nodejs
    npm install pm2 -g
    npm install mirakurun -g --unsafe-perm --production
    sh config.sh
    mirakurun restart
    echo "インストールが完了しました"
    exit 1
fi

if [ $1 = "uninstall" ] ; then
    echo "アンインストールを開始します"
    npm uninstall mirakurun -g --unsafe-perm
    echo "アンインストールが完了しました"
    exit 1
fi