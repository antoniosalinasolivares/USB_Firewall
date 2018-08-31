#!/bin/bash

##Este script crea los archivos necesarios para el funcionamiento del firewall USB
touch .blacklist.fw
touch .whitelist.fw

#Agregamos la regla UDEV que ejecutará nuestro script cada vez que conectemos un pendrive
ruta=$(pwd)
echo "ACTION==\"add\", ATTRS{idVendor}==\" **** \", ATTRS{idProduct}==\" **** \", RUN+=\"$ruta/firewall.sh\"" > /etc/udev/rules.d/firewall.rules
chmod 777 /etc/udev/rules.d/firewall.rules

echo "Instalación completada"

