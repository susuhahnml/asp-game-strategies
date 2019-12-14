#!/bin/bash
set -e

read -rep "create pre-commit hook for updating python dependencies? (y/n): " ans
if [ $ans == "y" ]; then
    # move pre-commit hook into local .git folder for activation
    cp ../hooks/pre-commit.sample ../.git/hooks/pre-commit
fi

read -rep "download and decompress clingo binaries into  /bin/clingo? (y/n): " ans
if [ $ans == "y" ]; then
    # check os; download and decompress respective binary
    os=$(uname -s)
    if [[ $os == *"Linux"* ]]; then
        wget -O ./bin/clingo/clingo-5.4.0-linux-x86_64.tar.gz https://github.com/potassco/clingo/releases/download/v5.4.0/clingo-5.4.0-linux-x86_64.tar.gz
        tar -zxvf ./bin/clingo/clingo-5.4.0-linux-x86_64.tar.gz -C ./bin/clingo
    elif [[ $os == *"Darwin"* ]]; then
        wget -O ./bin/clingo/clingo-5.4.0-macos-x86_64.tar.gz https://github.com/potassco/clingo/releases/download/v5.4.0/clingo-5.4.0-macos-x86_64.tar.gz
        tar -zxvf ./bin/clingo/clingo-5.4.0-macos-x86_64.tar.gz -C ./bin/clingo
    else
        echo "no binary available for current OS"
    fi
fi

read -rep "download and decompress ilasp binaries into ./bin/ilasp? (y/n): " ans
if [ $ans == "y" ]; then
    # check os; download and decompress respective binary
    os=$(uname -s)
    if [[ $os == *"Linux"* ]]; then
        wget -O ./bin/ilasp/ILASP-3.4.0-ubuntu.tar.gz https://github.com/marklaw/ILASP-releases/releases/download/v3.4.0/ILASP-3.4.0-ubuntu.tar.gz
        tar -zxvf ./bin/ilasp/ILASP-3.4.0-ubuntu.tar.gz -C ./bin/ilasp
    elif [[ $os == *"Darwin"* ]]; then
        wget -O ./bin/ilasp/ILASP-3.4.0-OSX.tar.gz https://github.com/marklaw/ILASP-releases/releases/download/v3.4.0/ILASP-3.4.0-OSX.tar.gz
        tar -zxvf ./bin/ilasp/ILASP-3.4.0-OSX.tar.gz -C ./bin/ilasp
    else
        echo "no binary available for current OS"
    fi
fi
