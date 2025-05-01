#! /bin/sh
#sh script para resturar el wifi luego de ejecutar aircrack-ng en Fedora 41
#Reiniciamos los procesos que se detuvieron para ejecutar airmon-ng
systemctl restart avahi-daemon
systemctl restart wpa_supplicant
systemctl restart NetworkManager
#Se cambia manualmente la configuración de la tarjeta de red Wifi
ip link set wlo1 down
iw dev wlo1 set type managed
ip link set wlo1 up
#Se reinicia nuevamente el proceso que controla las redes del equipo
systemctl restart NetworkManager
