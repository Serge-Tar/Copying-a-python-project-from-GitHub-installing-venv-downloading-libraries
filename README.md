Создаем в Jenkins и загружаем на сервер с ботом скрипт copyBot.sh :
- копируем проект из гитхаб,
- создаем виртуальное окружение,
- загружаем нужные библиотеки
- запускаем бота через tmux (в конце запускаем скрипт с запуском через тмукс, это скрипт делаю сразу в проекте с ботом)


1) Сначала создаем файл в сборке Jenkins (выполнить команду shell):

echo "#!/bin/bash
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
python3 -m venv venv && . venv/bin/activate && pip install pipreqs
#Установка зависимостей
#pip install pipreqs
pip install -r ~/DevBotizJenkins/DevopsBot/requirements.txt
#Запуск бота
python3 bot.py
" > copyBot.sh
echo "#----------------------------------------"
echo "файл copyBot.sh создан"
cat copyBot.sh
echo "#----------------------------------------"

2) затем после сборки копируем файл copyBot.sh в нужную дирректорию на сервер
3) и запускаем в сборке команду (Exec command):
#!/bin/bash
echo "-----------START запускаем скрипт--------------"
chmod u+x ~/DevBotizJenkins/copyBot.sh
~/DevBotizJenkins/copyBot.sh
echo "-----------FINISH запускаем скрипт--------------" 
