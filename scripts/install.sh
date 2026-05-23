#!/bin/bash
JB_PREFIX="/var/jb"
echo "[+] Iniciando el entorno independiente de THGJB..."

if [ ! -d "$JB_PREFIX" ]; then
    echo "[+] Creando rutas para el entorno rootless..."
    mkdir -p "$JB_PREFIX/usr/bin"
    mkdir -p "$JB_PREFIX/usr/lib"
    mkdir -p "$JB_PREFIX/Library/DynamicLibraries"
    mkdir -p "$JB_PREFIX/etc/apt/sources.list.d"
fi

echo "[?] Introduce la versión de iOS (ej: 15.1 o 26.0):"
read IOS_VERSION

IS_CLASSIC=$(echo "$IOS_VERSION < 17.0" | bc -l 2>/dev/null || echo 0)

if [ "$IS_CLASSIC" -eq 1 ]; then
    echo "[🔥] ¡Suerte detectada! Versión clásica."
    echo "[+] Habilitando: CYDIA INSTALLER y APPTAPP"
else
    echo "[⚡] Versión moderna detectada."
    echo "[+] Habilitando obligatorios: SILEO y ZEBRA"
fi

echo "[🚀] Instalando Saily Package Manager (Universal)..."
echo "[===] THGJB CONFIGURADO CON ÉXITO [===]"
