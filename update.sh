#!/bin/bash
# Script para actualizar tu repo automáticamente
cd packages
dpkg-scanpackages -m . > Packages
gzip -c Packages > Packages.gz
cd ..
git add .
git commit -m "Actualización automática de paquetes"
git push
echo "¡Repositorio actualizado con éxito!"

