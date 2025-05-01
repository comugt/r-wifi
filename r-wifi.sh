#! /bin/sh
#sh script para resturar el wifi luego de ejecutar aircrack-ng en Fedora 41
#Reiniciamos los procesos que se detuvieron para ejecutar airmon-ng
systemctl restart avahi-daemon
systemctl restart wpa_supplicant
systemctl restart NetworkManager
#Se cambia manualmente la configuración de la tarjeta de red Wifi
echo "Ingrese la interface a resturar:"
read intf
ip link set $intf down
iw dev $intf set type managed
ip link set $intf up
#Se reinicia nuevamente el proceso que controla las redes del equipo
systemctl restart NetworkManager
