#!/bin/bash

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

if [ $1 = "install" ]; then
    echo "インストールを開始します"
    # 依存パッケージのインストール
    apt install -y git build-essential dkms wget unzip linux-headers-$(uname -r)
    # ファームウェアの抽出とインストール
    git clone https://github.com/nns779/px4_drv.git
    cd px4_drv
    cd fwtool
    make
    wget http://plex-net.co.jp/plex/pxw3u4/pxw3u4_BDA_ver1x64.zip -O pxw3u4_BDA_ver1x64.zip
    unzip -oj pxw3u4_BDA_ver1x64.zip pxw3u4_BDA_ver1x64/PXW3U4.sys
    ./fwtool PXW3U4.sys it930x-firmware.bin
    mkdir -p /lib/firmware
    cp it930x-firmware.bin /lib/firmware/
    cd ..
    # ドライバのインストール
    cp -a ./ /usr/src/px4_drv-0.2.1
    dkms add px4_drv/0.2.1
    dkms install px4_drv/0.2.1
    echo "インストールが完了しました"
    exit 1
fi

if [ $1 = "uninstall" ]; then
    echo "アンインストールを開始します"
    # ドライバのアンインストール
    dkms remove px4_drv/0.2.1 --all
    rm -rf /usr/src/px4_drv-0.2.1
    # ファームウェアのアンインストール
    rm /lib/firmware/it930x-firmware.bin
    echo "アンインストールが完了しました"
    exit 1
fi

