#!/bin/bash   #Indica el tipo de programa
medias=$(cat /etc/mtab | grep media) #Variable
#echo $medias #El signo de pesos invoca a la variable
device=($medias) #Dispositivo
#echo ${device[0]} #Impresion
#echo ${device[1]} #Impresion
#grep "${device[1]}" .whitelist.fw #Busqueda en lista blanca
if grep -q "${device[1]}" .blacklist.fw; #El if funciona como condicion, en este caso, es para la black list o lista negra de aquellos aquellos archivos que deseamos restringir el acceso
then
	echo blacklist #Impresion de lista negra
	umount ${device[0]}
elif grep -q "${device[1]}" .whitelist.fw; #Condicion, para white list o lista blanca
then
	echo whitelist
	#mount ${device[0]}
else     	#En caso contrario se inician preguntas para asignar a lista blanca o lista negra
	elec=$(zenity --entry --text "Que quiere hacer con ${device[1]}?\n1)montar \n2)Whitelist \n3)blacklist \n4)No utilizar" --entry-text "escoja")
	case $elec in
		1) mount ${device[0]}   #Se inicia el montado del dispositivo
		       	zenity --info --text "montado"
			exit ;;
		2) echo "${device[1]}" > .whitelist.fw
			mount ${device[0]} #Se agrega a lista blanca
			zenity --info --text "Añadido a la whitelist y montado"
			exit ;;
		3) umount ${device[0]} #Se agrega a lista negra
			echo "${device[1]}" > .blacklist.fw
			zenity --info --text "Añadido a la blacklist y desmontado"
			exit ;;
		*) echo "Desmontando" #Se desmonta el dispositivo
			umount ${device[0]}
		esac
	fi #Cierra el if

