#!/bin/bash
medias=$(cat /etc/mtab | grep media)
#echo $medias
device=($medias)
#echo ${device[0]}
#echo ${device[1]}
#grep "${device[1]}" .whitelist.fw
if grep -q "${device[1]}" .blacklist.fw;
then
	echo blacklist
	umount ${device[0]}
elif grep -q "${device[1]}" .whitelist.fw;
then
	echo whitelist
	#mount ${device[0]}
else
	elec=$(zenity --entry --text "Que quiere hacer con ${device[1]}?\n1)montar \n2)Whitelist \n3)blacklist \n4)No utilizar" --entry-text "escoja")
	case $elec in
		1) mount ${device[0]}
		       	zenity --info --text "montado"
			exit ;;
		2) echo "${device[1]}" > .whitelist.fw
			mount ${device[0]}
			zenity --info --text "Añadido a la whitelist y montado"
			exit ;;
		3) umount ${device[0]}
			echo "${device[1]}" > .blacklist.fw
			zenity --info --text "Añadido a la blacklist y desmontado"
			exit ;;
		*) echo "Desmontando"
			umount ${device[0]}
		esac
	fi

