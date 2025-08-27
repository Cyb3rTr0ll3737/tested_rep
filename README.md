# Первый запуск
```sh
docker compose up -d
ansible-playbook playbook-useradd.yml
```
Возможно понадобится утилита sshpass
```sh
sudo apt update && sudo apt install sshpass -y
```
Некоторый функционал ансибла может возвращать ошибку из-за устаревшей версии ansible / Jinja / Community.general коллекции

Обновить их можно с помощью следующих команд
```sh
pip install --upgrade ansible
pip install --upgrade jinja2
ansible-galaxy collection install community.general --upgrade
```
