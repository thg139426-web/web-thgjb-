#!/bin/bash
clear

while true; do
    echo -e "\e[1;34m==================================================\e[0m"
    echo -e "\e[1;36m             THGJB-4 - PANEL DE CONTROL           \e[0m"
    echo -e "\e[1;34m==================================================\e[0m"
    echo -e " Selecciona el Gestor de Paquetes que deseas lanzar:"
    echo ""
    echo -e " \e[1;33m[1]\e[0m Cydia (Classic Repos)"
    echo -e " \e[1;35m[2]\e[0m Sileo (Modern Rootless)"
    echo -e " \e[1;32m[3]\e[0m Zebra (Fast Indexer)"
    echo -e " \e[1;36m[4]\e[0m Saily (Lightweight Manager)"
    echo -e " \e[1;31m[5]\e[0m AppTapp Installer"
    echo -e " \e[1;34m[6]\e[0m Actualizar todos los repositorios (Run update.sh)"
    echo -e " \e[1;30m[7]\e[0m Salir del Panel"
    echo -e "\e[1;34m==================================================\e[0m"
    echo -n " Elige una opción [1-7]: "
    read opcion

    case $opcion in
        1)
            echo -e "\n\e[1;33m[📦 Cydia]\e[0m Cargando entorno clásico..."
            sleep 1.5
            ;;
        2)
            echo -e "\n\e[1;35m[🪐 Sileo]\e[0m Iniciando compatibilidad rootless..."
            sleep 1.5
            ;;
        3)
            echo -e "\n\e[1;32m[🦓 Zebra]\e[0m Abriendo gestor rápido..."
            sleep 1.5
            ;;
        4)
            echo -e "\n\e[1;36m[🐬 Saily]\e[0m Lanzando interfaz ligera..."
            sleep 1.5
            ;;
        5)
            echo -e "\n\e[1;31m[📱 AppTapp]\e[0m Conectando con Installer..."
            sleep 1.5
            ;;
        6)
            echo -e "\n\e[1;34m[🔄] Ejecutando motor de actualización de THGJB-4...\e[0m\n"
            sleep 1
            if [ -f "./update.sh" ]; then
                ./update.sh
            else
                echo -e "\e[1;31m[ERROR] No se encuentra update.sh\e[0m"
            fi
            echo -e "\nPresiona [Enter] para volver al menú..."
            read
            ;;
        7)
            echo -e "\n\e[1;32m¡Saliendo de THGJB-4! Hasta la próxima, crack.\e[0m\n"
            exit 0
            ;;
        *)
            echo -e "\n\e[1;31m[!] Opción no válida. Intenta otra vez.\e[0m"
            sleep 1.5
            ;;
    esac
    clear
done
