#!/bin/bash
sudo bash -c "curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add -"
sudo bash -c "curl https://packages.microsoft.com/config/ubuntu/18.04/prod.list > /etc/apt/sources.list.d/mssql-release.list"
sudo apt-get update
sudo ACCEPT_EULA=Y apt-get install -y msodbcsql17 mssql-tools
sudo apt-get install -y unixodbc-dev
sudo apt-get install -y gcc g++ make autoconf libc-dev pkg-config
sudo apt-get install -y php-pear php-dev
sudo pecl install sqlsrv-5.8.1
sudo pecl install pdo_sqlsrv-5.8.1
sudo bash -c "echo extension=sqlsrv.so > /etc/php/7.2/mods-available/sqlsrv.ini"
sudo bash -c "echo extension=pdo_sqlsrv.so > /etc/php/7.2/mods-available/pdo_sqlsrv.ini"
sudo phpenmod sqlsrv pdo_sqlsrv
sudo systemctl restart php7.2-fpm.service