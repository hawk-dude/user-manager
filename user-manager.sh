#!/bin/bash
clear
echo "------------------------Script is running--------------------------------"
echo "Script's menu:"
echo "		1) Create new user	6) Create new user"
echo "		2) Delete user		7) Delete group"
echo "		3) Change the password	8) Add user to group"
echo "		4) Check keys of users	9) Check list of groups"
echo "		5) Check list of users  10) Check groups of user"
echo "		e) Exit			11) Delete user from group"
read -p "Please choose your first option": choice 
while [ $choice != "e" ]
do
  case $choice in
  1)	read -p "Enter name of a new user": new_user
	sudo useradd -m $new_user;;
  2)	read -p "Enter name of user, who will be deleted": deleted_user
	sudo userdel -r $deleted_user;;
  3)	read -p "Enter name of user, whose password will be changed": modify_user
	sudo passwd $modify_user;;

  4)	sudo cat /etc/shadow ;;
  5)	sudo cat /etc/passwd | grep /home | grep /bin/;;

  6)	read -p "Enter name of a new group": new_group
	sudo groupadd $new_group;;
  7)	read -p "Enter name of group, which will be deleted": deleted_group
	sudo groupdel $deleted_group;;
  8)	read -p "Enter user name": modify_user
	read -p "Enter group name": modify_group
	sudo usermod -a -G $modify_group $modify_user;;

  9)	sudo cat /etc/group | grep :x:100;;
  10)	read -p "Enter username": user
	sudo id $user;;
  11)	read -p "Enter username": modify_user
	read -p "Enter group's name": modify_group
	sudo deluser $modify_user $modify_group;;
  *)	echo "Error!!! Unknown command";;

  esac
  read -p "Choose the next optoin": choice
done
echo "----------------------------Script is finished-------------------------------"
