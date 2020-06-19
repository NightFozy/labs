#!/bin/bash

sudo apt-get update #получение списка новых пактов
sudo apt-get upgrade #непосредственное выполнение обновления пакетов
sudo apt install git #установка Git
sudo apt install build-essential manpages-dev git automake autoconf #компилятор GCC
gcc —version #проверка правильности установки и версия компилятора #если нет Питона
sudo apt install python-pip #если нет pip
sudo apt-get install python-dev libxml2 libxml2-dev libxslt-dev #устанавливаем заголовочные модули
pip3 install lxml #устанавливаем lxml
sudo pip2 install -U future lxml #устанавливаем lxml как сказано в README
sudo apt install xmlto #устанавливаем дополнительную утилиту

sudo apt-get install python-matplotlib

pip install pymavlink #устанавливаем pymavlink
cd mavlink/pymavlink
python setup.py install

rm -rf mavlink # Рекурсивно удаляем без подтверждения и кода ошибочного заверщения каталок mavlink
sudo apt-get install python3-pip # Загружаем Python 2.7+ or 3.3+
pip install —user future # Загружаем the future module
sudo apt-get install python-tk # Загружаем TkInter
git clone https://github.com/mavlink/mavlink.git —recursive # Клонируем the mavlink repo в доступный для записи каталог
PYTHONPATH=$PWD/mavlink
cd mavlink
python -m mavgenerate
