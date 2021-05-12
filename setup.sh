#!/bin/bash

#####################################################
#Script to confiruge Digital Commerce workspace
#####################################################

#Welcome message
echo -e "Welcome to Innovation & Entrepreneurship in the Digital Economy!
This script will setup Wordpress in Goorm IDE."

wget https://raw.githubusercontent.com/riggas-ionio/digi-conomy/master/wordpress.sh

sh ./wordpress.sh   2>&1 | tee ./setup.log
