#!/bin/bash  #Indica el tipo de programa

##Este script crea los archivos necesarios para el funcionamiento del firewall USB
touch .blacklist.fw #Creacion de lista negra
touch .whitelist.fw #Creacion de lista blanca

#Agregamos la regla UDEV que ejecutará nuestro script cada vez que conectemos un pendrive
ruta=$(pwd)
echo "ACTION==\"add\", ATTRS{idVendor}==\" **** \", ATTRS{idProduct}==\" **** \", RUN+=\"$ruta/firewall.sh\"" > /etc/udev/rules.d/firewall.rules
chmod 777 /etc/udev/rules.d/firewall.rules #Cambio de permisos

echo "Instalación completada" #impresion de 

