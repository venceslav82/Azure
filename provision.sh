#!/bin/bash
username="<h1>venceslav_dimitrov</h1>"
disk="/dev/sdc /storage/data   ext4  defaults  0  0"
sudo apt update
sudo apt install apache2 -y
sudo sed -i.bak 's/80/8080/' /etc/apache2/ports.conf
sudo sed -i.bak 's/80/8080/' /etc/apache2/sites-enabled/000-default.conf
sudo rm -rf /var/www/html/index.html
echo $username | sudo tee -a /var/www/html/index.html
sudo systemctl enable --now apache2
sudo systemctl restart apache2
sudo fdisk -l /dev/sdc
sudo mkfs.ext4 /dev/sdc
sudo mkdir -p /storage/data
sudo mount /dev/sdc /storage/data
echo $disk | sudo tee -a /etc/fstab
