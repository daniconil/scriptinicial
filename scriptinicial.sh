#!/usr/bin/bash
#title           :scriptinicial.sh
#description     :Este script conigura algunos parámetros iniciales en Ubuntu Server 20.04
#author		 :daniconil@disroot.org
#date            :20210616
#version         :0.1
#usage		 :./scriptinicial.sh
#notes           :Otorgar permisos de ejecución mediante chmod +x scriptinicial.sh

#Declaración de variables usadas en el script
user=$(whoami)
ipinterna=$(hostname -I | awk '{print $1}')
ipexterna=$(curl ifconfig.me)

#Mensaje de inicio
   echo "Este script hace las siguientes funciones. Recomendable usarlo en una Ubuntu Server recién instalada"
   echo ""
   echo "1) Refresca repositorios y actualiza componentes"
   echo "2) Configura el idioma"
   echo "3) Configura la hora"
   echo "4) Instala openssh-server para acceder vía SSH indicando el comando según IP externa o interna"
   echo ""
   sleep 5
   echo ""
#Paso 1. Actualiza el servidor con las últimas versiones de componentes
   echo "Script en proceso"
   echo "Paso 1, refrescando repositorios y actualizando componentes"
   sleep 3
   sudo apt update && sudo apt -y upgrade
   sleep 3
   echo ""
#Paso 2. Configura el idioma
   echo "Paso 2, comprueba el paquete de idioma"
   sleep 2
   locale
   sleep 2
   echo "A continuación, buscamos el paquete deseado. Para castellano, elige es-ES.UTF-8. Pulsa cancelar para dejarlo como está"
   sleep 5
   sudo dpkg-reconfigure locales
   sleep 2
   echo ""
#Paso 3. Configura la hora
   echo "Paso 3, comprueba la hora"
   sleep 2
   date
   sleep 2
   echo ""
   echo "En el siguiente paso, puedes cambiar la zona horaria"
   sleep 2
   sudo dpkg-reconfigure tzdata
   echo ""
#Paso 4. Instala openssh-server y librerías complementarias
   echo "Paso 4, instalando openssh-server"
   sleep 3
   sudo apt install -y openssh-server
   echo ""
   echo "Para acceder, has de escribir en un terminal remoto el siguiente comando"
   echo ""
   echo "********IP Interna********"
   echo "ssh $user@$ipinterna"
   echo "**************************"
   echo ""
   echo "********IP externa********"
   echo "ssh $user@$ipexterna"
   echo "**************************"
   echo ""
   sleep 3
   echo "Script concluido, has configurado parte de los parámetros iniciales"
