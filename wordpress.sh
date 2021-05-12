#!/bin/bash

#####################################################
#Script to confiruge Server, WebServer and WordPress#
#####################################################


#Colors settings
BLUE='\033[0;34m'
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[0;33m'
NC='\033[0m' # No Color


#Welcome message
echo -e "Welcome to WordPress installation and configuration wizard!"

apt-get update

apt-get install -y locales
rm -rf /var/lib/apt/lists/*
localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
export LANG=en_US.utf8

echo -e "Installing PhpMyAdmin MySQL web client..."
sleep 5
service apache2 start
service mysql start
add-apt-repository "deb http://archive.ubuntu.com/ubuntu $(lsb_release -sc) universe"
apt-get install -y php7.3-mbstring php7.3-mysqli phpmyadmin

#Checking packages
echo -e "${YELLOW}Checking packages...${NC}"
echo -e "List of required packeges: nano, zip, unzip, mc, htop, apache2 & php, mysql, php curl, phpmyadmin, wget, curl"

read -r -p "Do you want to check packeges? [y/N] " response
case $response in
    [yY][eE][sS]|[yY])


NANO=$(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing nano${NC}"
    apt-get install nano --yes;
    elif [ $(dpkg-query -W -f='${Status}' nano 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}nano is installed!${NC}"
  fi

ZIP=$(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing zip${NC}"
    apt-get install zip --yes;
    elif [ $(dpkg-query -W -f='${Status}' zip 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}zip is installed!${NC}"
  fi

MC=$(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing mc${NC}"
    apt-get install mc --yes;
    elif [ $(dpkg-query -W -f='${Status}' mc 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}mc is installed!${NC}"
  fi

HTOP=$(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing htop${NC}"
    apt-get install htop --yes;
    elif [ $(dpkg-query -W -f='${Status}' htop 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}htop is installed!${NC}"
  fi

APACHE2=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing apache2${NC}"
    apt-get install apache2 php5 --yes;
    elif [ $(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}apache2 is installed!${NC}"
  fi

MYSQL=$(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing mysql-server${NC}"
    apt-get install mysql-server --yes;
    elif [ $(dpkg-query -W -f='${Status}' mysql-server 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}mysql-server is installed!${NC}"
  fi

PHP5CURL=$(dpkg-query -W -f='${Status}' php5-curl 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' php5-curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing php5-curl${NC}"
    apt-get install php5-curl --yes;
    elif [ $(dpkg-query -W -f='${Status}' php5-curl 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}php5-curl is installed!${NC}"
  fi

PHPMYADMIN=$(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing phpmyadmin${NC}"
    apt-get install phpmyadmin --yes;
    elif [ $(dpkg-query -W -f='${Status}' phpmyadmin 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}phpmyadmin is installed!${NC}"
  fi

WGET=$(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing wget${NC}"
    apt-get install wget --yes;
    elif [ $(dpkg-query -W -f='${Status}' wget 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}wget is installed!${NC}"
  fi

CURL=$(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed")
  if [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 0 ];
  then
    echo -e "${YELLOW}Installing curl${NC}"
    apt-get install curl --yes;
    elif [ $(dpkg-query -W -f='${Status}' curl 2>/dev/null | grep -c "ok installed") -eq 1 ];
    then
      echo -e "${GREEN}curl is installed!${NC}"
  fi

  ;;

    *)

  echo -e "${RED}
  Packeges check is ignored!
  Please be aware, that apache2, mysql, phpmyadmin and other software may not be installed!
  ${NC}"

  ;;
esac

#downloading WordPress, unpacking, adding basic pack of plugins, creating .htaccess with optimal & secure configuration
echo -e "${YELLOW}On this step we going to download latest version of WordPress in EN language...${NC}"

read -r -p "Do you want to install WordPress? [y/N] " response
case $response in
    [yY][eE][sS]|[yY])

  wget https://wordpress.org/latest.zip -O /workspace/wp_eng.zip

  echo -e "Unpacking WordPress into website home directory..."
  sleep 5
  unzip /workspace/wp_eng.zip -d /workspace/wp/
  mv /workspace/wp/wordpress/* /workspace/wp/
  rm -rf /workspace/wp/wordpress/
  rm /workspace/wp_eng.zip
  mkdir /workspace/wp/wp-content/uploads
  chmod -R 777 /workspace/wp/wp-content/uploads

        ;;
    *)

  echo -e "${RED}WordPress and plugins were not downloaded & installed. You can do this manually or re run this script.${NC}"

        ;;
esac

echo -e "${GREEN}Creating user & database for WordPress, setting wp-config.php...${NC}"
echo -e "Please, set username for Wordpress database: "
read db_user
echo -e "Please, set password for Wordpress database user: "
read db_pass

echo -e "Logging in to MySQL (default password is empty, simply press Enter) "
mysql -u root -p <<EOF
CREATE USER '$db_user'@'localhost' IDENTIFIED BY '$db_pass';
CREATE DATABASE IF NOT EXISTS $db_user;
GRANT ALL PRIVILEGES ON $db_user.* TO '$db_user'@'localhost';
ALTER DATABASE $db_user CHARACTER SET utf8 COLLATE utf8_general_ci;
EOF

cat >/workspace/wp/wp-config.php <<EOL
<?php

define('DB_NAME', '$db_user');

define('DB_USER', '$db_user');

define('DB_PASSWORD', '$db_pass');

define('DB_HOST', 'localhost');

define('DB_CHARSET', 'utf8');

define('DB_COLLATE', '');

define('AUTH_KEY',         '$db_user');
define('SECURE_AUTH_KEY',  '$db_user');
define('LOGGED_IN_KEY',    '$db_user');
define('NONCE_KEY',        '$db_user');
define('AUTH_SALT',        '$db_user');
define('SECURE_AUTH_SALT', '$db_user');
define('LOGGED_IN_SALT',   '$db_user');
define('NONCE_SALT',       '$db_user');

\$table_prefix  = 'wp_';

define('WP_DEBUG', false);

if ( !defined('ABSPATH') )
	define('ABSPATH', dirname(__FILE__) . '/');

require_once(ABSPATH . 'wp-settings.php');
EOL

echo -e "${GREEN}Database user, database and wp-config.php were succesfully created & configured!${NC}"

service apache2 restart
service mysql restart

echo -e "


"
sleep 1
echo -e "You can now connect to MySQL as root (no passwd) via https://...run-eu-central1.goorm.io/phpmyadmin "
echo -e "You can now connect to Wordpress and continue online installation via https://...run-eu-central1.goorm.io/wp"

echo "<html><head><meta http-equiv='refresh' content='time; URL=/wp' /></head><body><a href='/wp'>Go to Wordpress</a></body></html>" > ./index.html
echo "<html><head><meta http-equiv='refresh' content='time; URL=/wp' /></head><body><a href='/wp'>Go to Wordpress</a></body></html>" > ../index.html

sleep 3
echo -e "Installation & configuration succesfully finished.
Bye!"
