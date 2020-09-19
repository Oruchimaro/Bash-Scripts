#!/bin/bash
echo "Initializing Backup Sequence..."
echo "========================================================================="

echo "Enter Today's date with this format (YYYY:MM:DD) : "
read date
echo "Archive name will be : "$date
echo "Do you wish to proceed ? Y/n"
read answer

if [[ $answer == [Nn] ]]; then
	echo "Exiting Due to user command !!!"
	exit
fi

echo "========================================================================="
echo "Proccessing ..."
mkdir visitapp
cp -r /var/www/visitapp/* visitapp/
tar zcvf $date.tar.gz visitapp/*
rm -rf visitapp/


echo "========================================================================="
echo "backing up the code files done !"
echo "moving to backing up the database ..."

echo "Do you wish to proceed ? Y/n"
read answer2

if [[ $answer2 == [Nn] ]]; then
	echo "Backing Up Code Files IS DONE !!!"
	echo "Exiting Due to user command !!!"
	mkdir $date
	mv $date".tar.gz" $date
	ls -l $date
	echo "Good Day Sir"
	exit
fi


USER="DB User"
PASS="DB Password"
DB="DB Name"

mysqldump --opt --user=$USER --password=$PASS $DB > $date"_mysql.sql"

echo "========================================================================="
echo "backing up database done !"
echo "moving to backing up the config files ..."

echo "Do you wish to proceed ? Y/n"
read answer3

if [[ $answer3 == [Nn] ]]; then
	echo "Backing Up Database IS DONE !!!"
	echo "Exiting Due to user command !!!"
	mkdir $date
	mv $date".tar.gz" $date
	mv $date"_mysql.sql" $date
	ls -l $date
	echo "Good Day Sir"
	exit
fi

echo "Proccessing ..."
mkdir ConfigFiles
cd ConfigFiles
mkdir Nginx
cp -r /etc/nginx/conf.d/ Nginx/
cp -r /etc/nginx/nginx.conf Nginx/
cp -r /etc/nginx/sites-available/ Nginx/
cp -r /etc/nginx/sites-enabled/ Nginx/
cd ..
tar zcvf $date"_config.tar.gz" ConfigFiles/
rm -rf visitapp/
rm -rf ConfigFiles/



mkdir $date
mv $date"_mysql.sql" $date
mv $date".tar.gz" $date
mv $date"_config.tar.gz" $date
#mv -r /ConfigFiles/ $date

echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "========================================================================="
echo "========================================================================="
echo "                       Backing Up IS DONE !!!                            "
echo "========================================================================="
echo "========================================================================="
echo "                                                                         "
echo "                                                                         "
echo "	               Files Are stored in "$date" Folder.                     "

echo "                                                                         "
echo "                                                                         "
ls -l $date

echo "========================================================================="
echo "                           Good Day Sir                                  "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "
echo "                                                                         "

