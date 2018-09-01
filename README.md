
		USB FIREWALL

	-Antonio Salinas Olivares
		github.com/antoniosalinasolivares
	-Paola Mariana Meneses Rodriguez
		github.com/pmeneses4

[INSTALACIÓN]
descomprimir los archivos firewall.sh e install.sh donde
 se quiera
instalar el firewall.
ejecutar con sudo install.sh

Si deseas verificar que se instaló correctamente puedes 
ejecutar

cat /etc/udev/rules.d/firewall.rules

cat .whitelist.fw; cat .blacklist.fw

Si existe un error de archivo no existente, intsnte ejecu-
tar install.sh de nuevo

[NOTAS]
Funciona mejor en distribuciones de ubuntu previas a 14.04, 
en versiones posteriores la regla udev debe ser modificada.

