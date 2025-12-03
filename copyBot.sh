!/bin/bash
#Установка Python и необходимых библиотек
sudo apt-get update
sudo apt install python3-pip
cd ~/DevBotizJenkins/

#Загрузка вашего приложения на сервер
git clone https://github.com/Serge-Tar/DevopsBot.git

#Установка виртуального окружения
cd ~/DevBotizJenkins/DevopsBot/
sudo apt install python3-venv
#python3 -m venv venv && source venv/bin/activate && pip install pipreqs
python3 -m venv venv && . venv/bin/activate && pip3 install pipreqs
#Установка зависимостей
#pip install pipreqs
pip3 install -r ~/DevBotizJenkins/DevopsBot/requirements.txt
#python3 bot.py
./startBotTmux.sh
