#!/bin/bash

CHECK='\xe2\x9c\x85'
UNCHECK='\xe2\x9d\x8c'
SUCCESS=0
ERROR=0

# Reqruitments

echo "===[ INSTALL RECRUITMENT ]==="

pkgInstallation(){
    if ! dpkg -s $PKG &> /dev/null
    then
        sudo apt install -y $PKG &> /dev/null
        if [ $? -eq 0 ]
        then
            echo -e "▶ $PKG [$CHECK]"
            ((SUCCESS++))
        else
            echo -e "▶ $PKG [$UNCHECK]"
            ((ERROR++))
        fi
    else    
        echo -e "▶ $PKG [$CHECK]"
        ((SUCCESS++))
    fi
}

PKG=golang-go
if ! dpkg -s $PKG &> /dev/null
then
    sudo apt install golang-go -y &> /dev/null
    if [ $? -eq 0 ]
    then
        echo GOROOT=/usr/lib/go >> ~/.bashrc
        echo GOPATH=$HOME/go >> ~/.bashrc
        echo PATH=$PATH:$GOROOT/bin:$GOPATH/bin >> ~/.bashrc
        . ~/.bashrc
        echo -e "▶ $PKG [$CHECK]"
        ((SUCCESS++))
    else
        echo -e "▶ $PKG [$UNCHECK]"
        ((ERROR++))
    fi
else
    echo -e "▶ $PKG [$CHECK]"
    ((SUCCESS++))
fi

PKG=libpcap-dev
pkgInstallation

PKG=rubygems
pkgInstallation

# ================================================================== #
echo
echo =============================
echo "SUCCESS = $SUCCESS"
echo "ERROR = $ERROR"
echo =============================
echo
SUCCESS=0
ERROR=0
# ================================================================== #

# Install Tools
echo "===[ INSTALL TOOLS ]==="


goToolsInstallation(){
    if ! command -v $TOOLS &> /dev/null
    then
        go install -v $REPO &> /dev/null
        if [ $? -eq 0 ]
        then
            echo -e "▶ $TOOLS [$CHECK]"
            ((SUCCESS++))
        else
            echo -e "▶ $TOOLS [$UNCHECK]"
            ((ERROR++))
        fi    
    else
        echo -e "▶ $TOOLS [$CHECK]"
        ((SUCCESS++))
    fi
}


## Nuclei - https://github.com/projectdiscovery/nuclei

TOOLS=nuclei
REPO=github.com/projectdiscovery/nuclei/v2/cmd/nuclei@latest
goToolsInstallation

## Subfinder - https://github.com/projectdiscovery/subfinder

TOOLS=subfinder
REPO=github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest
goToolsInstallation

## Naabu - https://github.com/projectdiscovery/naabu

TOOLS=naabu
REPO=github.com/projectdiscovery/naabu/v2/cmd/naabu@latest
goToolsInstallation

## Katana - https://github.com/projectdiscovery/katana

TOOLS=katana
REPO=github.com/projectdiscovery/katana/cmd/katana@latest
goToolsInstallation

## Httpx - https://github.com/projectdiscovery/httpx

TOOLS=httpx
REPO=github.com/projectdiscovery/httpx/cmd/httpx@latest
goToolsInstallation

## Uncover - https://github.com/projectdiscovery/uncover

TOOLS=uncover
REPO=github.com/projectdiscovery/uncover/cmd/uncover@latest
goToolsInstallation

## ShuffleDNS - https://github.com/projectdiscovery/shuffledns

TOOLS=shuffledns
REPO=github.com/projectdiscovery/shuffledns/cmd/shuffledns@latest
goToolsInstallation

## Notify - https://github.com/projectdiscovery/notify

TOOLS=notify
REPO=github.com/projectdiscovery/notify/cmd/notify@latest
goToolsInstallation

## Dnsx - https://github.com/projectdiscovery/dnsx

TOOLS=dnsx
REPO=github.com/projectdiscovery/dnsx/cmd/dnsx@latest
goToolsInstallation

## DNSProbe - https://github.com/projectdiscovery/dnsprobe

TOOLS=dnsprobe
REPO=github.com/projectdiscovery/dnsprobe@latest 
goToolsInstallation

## Subjs - https://github.com/lc/dnsprobe

TOOLS=subjs
REPO=github.com/lc/subjs@latest
goToolsInstallation

## Hakrawler - https://github.com/hakluke/hakrawler

TOOLS=hakrawler
REPO=github.com/hakluke/hakrawler@latest
goToolsInstallation

## Gotator - https://github.com/Josue87/gotator

TOOLS=gotator
REPO=github.com/Josue87/gotator@latest
goToolsInstallation

## Cent - https://github.com/xm1k3/cent

TOOLS=cent
REPO=github.com/xm1k3/cent@latest
goToolsInstallation

## Waybackurls - https://github.com/tomnomnom/waybackurls

TOOLS=waybackurls
REPO=github.com/tomnomnom/waybackurls@latest
goToolsInstallation

## Gf - https://github.com/tomnomnom/gf

TOOLS=gf
REPO=github.com/tomnomnom/gf@latest
goToolsInstallation
git clone https://github.com/1ndianl33t/Gf-Patterns /tmp/Gf-Patterns &> /dev/null
mkdir ~/.gf &> /dev/null
mv /tmp/Gf-Patterns/*.json ~/.gf &> /dev/null

## Httprobe - https://github.com/tomnomnom/httprobe

TOOLS=httprobe
REPO=github.com/tomnomnom/httprobe@latest
goToolsInstallation

## Assetfinder - https://github.com/tomnomnom/assetfinder

TOOLS=assetfinder
REPO=github.com/tomnomnom/assetfinder@latest
goToolsInstallation

## Meg - https://github.com/tomnomnom/meg

TOOLS=meg
REPO=github.com/tomnomnom/meg@latest
goToolsInstallation

## unfurl - https://github.com/tomnomnom/unfurl

TOOLS=unfurl
REPO=github.com/tomnomnom/unfurl@latest
goToolsInstallation

## Waybackurls - https://github.com/tomnomnom/waybackurls

TOOLS=waybackurls
REPO=github.com/tomnomnom/waybackurls@latest
goToolsInstallation

## Qsreplace - https://github.com/tomnomnom/qsreplace

TOOLS=qsreplace
REPO=github.com/tomnomnom/qsreplace@latest
goToolsInstallation

## Anew - https://github.com/tomnomnom/anew

TOOLS=anew
REPO=github.com/tomnomnom/anew@latest
goToolsInstallation

## Dalfox - https://github.com/hahwul/dalfox

TOOLS=dalfox
REPO=github.com/hahwul/dalfox/v2@latest
goToolsInstallation

## Gospider - https://github.com/jaeles-project/gospider

TOOLS=gospider
REPO=github.com/jaeles-project/gospider@latest
goToolsInstallation

## Subjack - https://github.com/haccer/subjack

TOOLS=subjack
REPO=github.com/haccer/subjack@latest
goToolsInstallation

## Kxss - https://github.com/Emoe/kxss

TOOLS=kxss
REPO=github.com/Emoe/kxss@latest
goToolsInstallation

## Gauplus - https://github.com/bp0lr/gauplus

TOOLS=gauplus
REPO=github.com/bp0lr/gauplus@latest
goToolsInstallation

## Cf-Check - https://github.com/dwisiswant0/cf-check

TOOLS=cf-check
REPO=github.com/dwisiswant0/cf-check@latest
goToolsInstallation

## Airixss - https://github.com/ferreiraklet/airixss

TOOLS=airixss
REPO=github.com/ferreiraklet/airixss@latest
goToolsInstallation

## Jeeves - https://github.com/ferreiraklet/Jeeves

TOOLS=Jeeves
REPO=github.com/ferreiraklet/Jeeves@latest
goToolsInstallation

## Rustscan - https://github.com/RustScan/RustScan

if ! command -v rustscan &> /dev/null
then
    wget -P /tmp https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb &> /dev/null
    if [ $? -eq 0 ]
    then
        sudo dpkg -i /tmp/rustscan_2.0.1_amd64.deb &> /dev/null
        if [ $? -eq 0 ]
        then
            echo -e "▶ rustscan [$CHECK]"
            ((SUCCESS++))
        else
            echo -e "▶ rustscan [$UNCHECK]"
            ((ERROR++))
        fi
    else
        echo -e "▶ rustscan [$UNCHECK]"
        ((ERROR++))
    fi
else
    echo -e "▶ rustscan [$CHECK]"
    ((SUCCESS++))
fi

## Evil Winrm - https://github.com/Hackplayers/evil-winrm

if ! command -v evil-winrm &> /dev/null
then
    sudo gem install evil-winrm &> /dev/null
    if [ $? -eq 0 ]
    then
        echo -e "▶ evil-winrm [$CHECK]"
        ((SUCCESS++))
    else
        echo -e "▶ evil-winrm [$UNCHECK]"
        ((ERROR++))
    fi
else
    echo -e "▶ evil-winrm [$CHECK]"
    ((SUCCESS++))
fi

## Arjun - https://github.com/s0md3v/Arjun

if ! command -v arjun &> /dev/null
then
    pip install arjun &> /dev/null
    if [ $? -eq 0 ] 
    then
        echo -e "▶ arjun [$CHECK]"
        ((SUCCESS++))
    else
        echo -e "▶ arjun [$UNCHECK]"
        ((ERROR++))
    fi
else
    echo -e "▶ arjun [$CHECK]"
    ((SUCCESS++))
fi

## Amass - https://github.com/owasp-amass/amass

if ! command -v amass &> /dev/null
then
    sudo apt-get install amass &> /dev/null
    if [ $? -eq 0 ] 
    then
        echo -e "▶ amass [$CHECK]"
        ((SUCCESS++))
    else
        echo -e "▶ amass [$UNCHECK]"
        ((ERROR++))
    fi
else
    echo -e "▶ amass [$CHECK]"
    ((SUCCESS++))
fi


echo
echo =============================
echo "SUCCESS = $SUCCESS"
echo "ERROR = $ERROR"
