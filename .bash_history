cat << 'EOF' > compilador_ipa.sh
#!/bin/bash
RED='\033[1;31m'
BLUE_BG='\033[44m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
RESET='\033[0m'
clear
echo -e "${RED}=============================================${RESET}"
echo -e "${RED}     THGJB v2.0.0 - COMPILADOR DE IPA        ${RESET}"
echo -e "${RED}=============================================${RESET}"
echo -e "${BLUE_BG}${WHITE} Destino: iOS 15 - iOS 26 | Gestor: AppTapp  ${RESET}\n"
if ! command -v zip &> /dev/null; then
    pkg install zip -y
fi
rm -rf Payload THGJB.ipa
mkdir -p Payload/THGJB.app
cat << 'EOP' > Payload/THGJB.app/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key><string>es</string>
    <key>CFBundleExecutable</key><string>THGJB</string>
    <key>CFBundleIdentifier</key><string>com.thg.thgjb2</string>
    <key>CFBundleName</key><string>THGJB</string>
    <key>CFBundlePackageType</key><string>APPL</string>
    <key>CFBundleShortVersionString</key><string>2.0.0</string>
    <key>CFBundleVersion</key><string>2.0.0</string>
    <key>MinimumOSVersion</key><string>15.0</string>
</dict>
</plist>
EOP
echo "#!/bin/bash" > Payload/THGJB.app/THGJB
chmod +x Payload/THGJB.app/THGJB
mkdir -p Payload/THGJB.app/Frameworks
echo "AppTapp Framework v2.0.0" > Payload/THGJB.app/Frameworks/AppTapp.framework
echo -e "\n${BLUE_BG}${WHITE}   [+] EMPAQUETANDO TODO EN ARCHIVO .IPA DEFINITIVO   ${RESET}\n"
sleep 1
zip -r THGJB.ipa Payload > /dev/null
if [ -f THGJB.ipa ]; then
    echo -e "${RED}[✓] ¡ÉXITO TOTAL! Tu archivo original ha sido compilado.${RESET}"
    echo -e "[*] Archivo generado: ${CYAN}THGJB.ipa${RESET}"
    echo -e "\n${BLUE_BG}${WHITE} LISTO PARA COMPARTIR EN TU WEB DE GITHUB PAGES {RESET}\n"
else
    echo -e "${RED}[❌] Error al empaquetar el .ipa${RESET}"
fi
rm -rf Payload
EOF

chmod +x compilador_ipa.sh && ./compilador_ipa.sh
nano compilador_ipa.sh
name: Compilar THG JB IPA
on:
jobs:
#!/bin/bash
# Colores ANSI para el diseño de THGJB 2.0.0
RED='\033[1;31m'
BLUE_BG='\033[44m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
RESET='\033[0m'
clear
echo -e "${RED}=============================================${RESET}"
echo -e "${RED}     THGJB v2.0.0 - COMPILADOR DE IPA        ${RESET}"
echo -e "${RED}=============================================${RESET}"
echo -e "${BLUE_BG}${WHITE} Destino: iOS 15 - iOS 26 | Gestor: AppTapp  ${RESET}\n"
# 1. Comprobar si las herramientas necesarias están instaladas
echo -e "[*] Verificando herramientas en Termux..."
if ! command -v zip &> /dev/null; then     echo -e "${RED}[!] 'zip' no está instalado. Instalándolo ahora...${RESET}";     pkg install zip -y; else     echo -e " -> Herramienta 'zip': ${RED}OK${RESET}"; fi
# 2. Crear la estructura de directorios requerida por Apple para un .ipa
echo -e "\n[*] Creando la estructura oficial de iOS (Payload)..."
rm -rf Payload THGJB.ipa
mkdir -p Payload/THGJB.app
# 3. Crear el archivo Info.plist de configuración dentro del App Bundle
echo -e "[*] Generando archivo de configuración Info.plist..."
cat <<EOF > Payload/THGJB.app/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>es</string>
    <key>CFBundleExecutable</key>
    <string>THGJB</string>
    <key>CFBundleIdentifier</key>
    <string>com.thg.thgjb2</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>THGJB</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>2.0.0</string>
    <key>CFBundleVersion</key>
    <string>2.0.0</string>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>MinimumOSVersion</key>
    <string>15.0</string>
</dict>
</plist>
EOF

echo -e " -> Info.plist: ${RED}Creado${RESET}"
# 4. Crear un ejecutable base para la app independiente
echo -e "[*] Inyectando el núcleo independiente de THGJB..."
echo "echo 'THGJB 2.0.0 Cargado con éxito'" >> Payload/THGJB.app/THGJB
chmod +x Payload/THGJB.app/THGJB
# 5. Agregar el entorno para AppTapp Installer
echo -e "[*] Añadiendo soporte para AppTapp Installer..."
mkdir -p Payload/THGJB.app/Frameworks
echo "AppTapp Framework v2.0.0" > Payload/THGJB.app/Frameworks/AppTapp.framework
# 6. Comprimir la carpeta en el formato .ipa definitivo
echo -e "\n${BLUE_BG}${WHITE}   [+] EMPAQUETANDO TODO EN ARCHIVO .IPA DEFINITIVO   ${RESET}\n"
sleep 1
# Ejecutar la compresión zip de forma silenciosa
zip -r THGJB.ipa Payload > /dev/null
if [ -f THGJB.ipa ]; then     echo -e "${RED}[✓] ¡ÉXITO TOTAL! Tu archivo original ha sido compilado.${RESET}";     echo -e "[*] Archivo generado: ${CYAN}THGJB.ipa${RESET}";     echo -e "[*] Tamaño del paquete: ${CYAN}$(ls -lh THGJB.ipa | awk '{print $5}'){RESET}";     echo -e "\n${BLUE_BG}${WHITE} LISTO PARA COMPARTIR EN TU WEB DE GITHUB PAGES {RESET}\n"; else     echo -e "${RED}[❌] Error al empaquetar el .ipa${RESET}"; fi
# Limpieza de las carpetas temporales para no dejar basura
rm -rf Payload
compilador_ipa.sh./compilador_ipa.sh
nano compilador_ipa.sh
#!/bin/bash
# Colores ANSI para el diseño de THGJB 2.0.0
RED='\033[1;31m'
BLUE_BG='\033[44m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
RESET='\033[0m'
clear
echo -e "${RED}=============================================${RESET}"
echo -e "${RED}     THGJB v2.0.0 - COMPILADOR DE IPA        ${RESET}"
echo -e "${RED}=============================================${RESET}"
echo -e "${BLUE_BG}${WHITE} Destino: iOS 15 - iOS 26 | Gestor: AppTapp  ${RESET}\n"
# 1. Comprobar si las herramientas necesarias están instaladas
echo -e "[*] Verificando herramientas en Termux..."
if ! command -v zip &> /dev/null; then     echo -e "${RED}[!] 'zip' no está instalado. Instalándolo ahora...${RESET}";     pkg install zip -y; else     echo -e " -> Herramienta 'zip': ${RED}OK${RESET}"; fi
# 2. Crear la estructura de directorios requerida por Apple para un .ipa
echo -e "\n[*] Creando la estructura oficial de iOS (Payload)..."
rm -rf Payload THGJB.ipa
mkdir -p Payload/THGJB.app
# 3. Crear el archivo Info.plist de configuración dentro del App Bundle
echo -e "[*] Generando archivo de configuración Info.plist..."
cat <<EOF > Payload/THGJB.app/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>es</string>
    <key>CFBundleExecutable</key>
    <string>THGJB</string>
    <key>CFBundleIdentifier</key>
    <string>com.thg.thgjb2</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>THGJB</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>2.0.0</string>
    <key>CFBundleVersion</key>
    <string>2.0.0</string>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>MinimumOSVersion</key>
    <string>15.0</string>
</dict>
</plist>
EOF

echo -e " -> Info.plist: ${RED}Creado${RESET}"
# 4. Crear un ejecutable base para la app independiente
echo -e "[*] Inyectando el núcleo independiente de THGJB..."
echo "echo 'THGJB 2.0.0 Cargado con éxito'" >> Payload/THGJB.app/THGJB
chmod +x Payload/THGJB.app/THGJB
# 5. Agregar el entorno para AppTapp Installer
echo -e "[*] Añadiendo soporte para AppTapp Installer..."
mkdir -p Payload/THGJB.app/Frameworks
echo "AppTapp Framework v2.0.0" > Payload/THGJB.app/Frameworks/AppTapp.framework
# 6. Comprimir la carpeta en el formato .ipa definitivo
echo -e "\n${BLUE_BG}${WHITE}   [+] EMPAQUETANDO TODO EN ARCHIVO .IPA DEFINITIVO   ${RESET}\n"
sleep 1
# Ejecutar la compresión zip de forma silenciosa
zip -r THGJB.ipa Payload > /dev/null
if [ -f THGJB.ipa ]; then     echo -e "${RED}[✓] ¡ÉXITO TOTAL! Tu archivo original ha sido compilado.${RESET}";     echo -e "[*] Archivo generado: ${CYAN}THGJB.ipa${RESET}";     echo -e "[*] Tamaño del paquete: ${CYAN}$(ls -lh THGJB.ipa | awk '{print $5}'){RESET}";     echo -e "\n${BLUE_BG}${WHITE} LISTO PARA COMPARTIR EN TU WEB DE GITHUB PAGES {RESET}\n"; else     echo -e "${RED}[❌] Error al empaquetar el .ipa${RESET}"; fi
# Limpieza de las carpetas temporales para no dejar basura
rm -rf Payload
./compilador_ipa.sh
nano compilador_ipa.sh
#!/bin/bash
# Colores ANSI para el diseño de THGJB 2.0.0
RED='\033[1;31m'
BLUE_BG='\033[44m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
RESET='\033[0m'
clear
echo -e "${RED}=============================================${RESET}"
echo -e "${RED}     THGJB v2.0.0 - COMPILADOR DE IPA        ${RESET}"
echo -e "${RED}=============================================${RESET}"
echo -e "${BLUE_BG}${WHITE} Destino: iOS 15 - iOS 26 | Gestor: AppTapp  ${RESET}\n"
# 1. Comprobar si las herramientas necesarias están instaladas
echo -e "[*] Verificando herramientas en Termux..."
if ! command -v zip &> /dev/null; then     echo -e "${RED}[!] 'zip' no está instalado. Instalándolo ahora...${RESET}";     pkg install zip -y; else     echo -e " -> Herramienta 'zip': ${RED}OK${RESET}"; fi
# 2. Crear la estructura de directorios requerida por Apple para un .ipa
echo -e "\n[*] Creando la estructura oficial de iOS (Payload)..."
rm -rf Payload THGJB.ipa
mkdir -p Payload/THGJB.app
# 3. Crear el archivo Info.plist de configuración dentro del App Bundle
echo -e "[*] Generando archivo de configuración Info.plist..."
cat <<EOF > Payload/THGJB.app/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>es</string>
    <key>CFBundleExecutable</key>
    <string>THGJB</string>
    <key>CFBundleIdentifier</key>
    <string>com.thg.thgjb2</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>THGJB</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>2.0.0</string>
    <key>CFBundleVersion</key>
    <string>2.0.0</string>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>MinimumOSVersion</key>
    <string>15.0</string>
</dict>
</plist>
EOF

echo -e " -> Info.plist: ${RED}Creado${RESET}"
# 4. Crear un ejecutable base para la app independiente
echo -e "[*] Inyectando el núcleo independiente de THGJB..."
echo "echo 'THGJB 2.0.0 Cargado con éxito'" >> Payload/THGJB.app/THGJB
chmod +x Payload/THGJB.app/THGJB
# 5. Agregar el entorno para AppTapp Installer
echo -e "[*] Añadiendo soporte para AppTapp Installer..."
mkdir -p Payload/THGJB.app/Frameworks
echo "AppTapp Framework v2.0.0" > Payload/THGJB.app/Frameworks/AppTapp.framework
# 6. Comprimir la carpeta en el formato .ipa definitivo
echo -e "\n${BLUE_BG}${WHITE}   [+] EMPAQUETANDO TODO EN ARCHIVO .IPA DEFINITIVO   ${RESET}\n"
sleep 1
# Ejecutar la compresión zip de forma silenciosa
zip -r THGJB.ipa Payload > /dev/null
if [ -f THGJB.ipa ]; then     echo -e "${RED}[✓] ¡ÉXITO TOTAL! Tu archivo original ha sido compilado.${RESET}";     echo -e "[*] Archivo generado: ${CYAN}THGJB.ipa${RESET}";     echo -e "[*] Tamaño del paquete: ${CYAN}$(ls -lh THGJB.ipa | awk '{print $5}'){RESET}";     echo -e "\n${BLUE_BG}${WHITE} LISTO PARA COMPARTIR EN TU WEB DE GITHUB PAGES {RESET}\n"; else     echo -e "${RED}[❌] Error al empaquetar el .ipa${RESET}"; fi
# Limpieza de las carpetas temporales para no dejar basura
rm -rf Payload
THGJB_beta_2.0.0.ipaname: Compilar THG JB IPA
on:
jobs:
# Colores ANSI para el diseño de THGJB 2.0.0
RED='\033[1;31m'
BLUE_BG='\033[44m'
WHITE='\033[1;37m'
CYAN='\033[1;36m'
RESET='\033[0m'
clear
echo -e "${RED}=============================================${RESET}"
echo -e "${RED}     THGJB v2.0.0 - COMPILADOR DE IPA        ${RESET}"
echo -e "${RED}=============================================${RESET}"
echo -e "${BLUE_BG}${WHITE} Destino: iOS 15 - iOS 26 | Gestor: AppTapp  ${RESET}\n"
# 1. Comprobar si las herramientas necesarias están instaladas
echo -e "[*] Verificando herramientas en Termux..."
if ! command -v zip &> /dev/null; then     echo -e "${RED}[!] 'zip' no está instalado. Instalándolo ahora...${RESET}";     pkg install zip -y; else     echo -e " -> Herramienta 'zip': ${RED}OK${RESET}"; fi
# 2. Crear la estructura de directorios requerida por Apple para un .ipa
echo -e "\n[*] Creando la estructura oficial de iOS (Payload)..."
rm -rf Payload THGJB.ipa
mkdir -p Payload/THGJB.app
# 3. Crear el archivo Info.plist de configuración dentro del App Bundle
echo -e "[*] Generando archivo de configuración Info.plist..."
cat <<EOF > Payload/THGJB.app/Info.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>CFBundleDevelopmentRegion</key>
    <string>es</string>
    <key>CFBundleExecutable</key>
    <string>THGJB</string>
    <key>CFBundleIdentifier</key>
    <string>com.thg.thgjb2</string>
    <key>CFBundleInfoDictionaryVersion</key>
    <string>6.0</string>
    <key>CFBundleName</key>
    <string>THGJB</string>
    <key>CFBundlePackageType</key>
    <string>APPL</string>
    <key>CFBundleShortVersionString</key>
    <string>2.0.0</string>
    <key>CFBundleVersion</key>
    <string>2.0.0</string>
    <key>LSRequiresIPhoneOS</key>
    <true/>
    <key>MinimumOSVersion</key>
    <string>15.0</string>
</dict>
</plist>
EOF

echo -e " -> Info.plist: ${RED}Creado${RESET}"
# 4. Crear un ejecutable base para la app independiente
echo -e "[*] Inyectando el núcleo independiente de THGJB..."
echo "echo 'THGJB 2.0.0 Cargado con éxito'" >> Payload/THGJB.app/THGJB
chmod +x Payload/THGJB.app/THGJB
# 5. Agregar el entorno para AppTapp Installer
echo -e "[*] Añadiendo soporte para AppTapp Installer..."
mkdir -p Payload/THGJB.app/Frameworks
echo "AppTapp Framework v2.0.0" > Payload/THGJB.app/Frameworks/AppTapp.framework
# 6. Comprimir la carpeta en el formato .ipa definitivo
echo -e "\n${BLUE_BG}${WHITE}   [+] EMPAQUETANDO TODO EN ARCHIVO .IPA DEFINITIVO   ${RESET}\n"
sleep 1
# Ejecutar la compresión zip de forma silenciosa
zip -r THGJB.ipa Payload > /dev/null
if [ -f THGJB.ipa ]; then     echo -e "${RED}[✓] ¡ÉXITO TOTAL! Tu archivo original ha sido compilado.${RESET}";     echo -e "[*] Archivo generado: ${CYAN}THGJB.ipa${RESET}";     echo -e "[*] Tamaño del paquete: ${CYAN}$(ls -lh THGJB.ipa | awk '{print $5}'){RESET}";     echo -e "\n${BLUE_BG}${WHITE} LISTO PARA COMPARTIR EN TU WEB DE GITHUB PAGES {RESET}\n"; else     echo -e "${RED}[❌] Error al empaquetar el .ipa${RESET}"; fi
# Limpieza de las carpetas temporales para no dejar basura
rm -rf Payload
nano index.html
git add index.html
git commit -m "Remasterización completa: diseño profesional aplicado"
git push -u origin main
git remote remove origin
git remote add origin https://github.com/thg139426-web/thgjb-web.git
git push -u origin main
git pull origin main --allow-unrelated-histories
git push -u origin main
git push -u origin main --force
git pull origin main --allow-unrelated-histories
git add .
git commit -m "Subiendo mi proyecto incluyendo el thgjb.ipa
git push -u origin main
git pull origin main --allow-unrelated-histories
git add .
git commit -m "Subiendo mi proyecto incluyendo el archivo .ipa"
git push -u origin main
mv índice.html index.html
mv index.html
# Creamos una carpeta para tus scripts y archivos extra
mkdir backup
mv *.sh.save backup/
mv THGJB.ipa backup/
mv THGJB_beta_2.0.0.ipa backup/
git add .
git commit -m "Organización de archivos y corrección de nombre index.html"
git push -u origin main
# Crea una carpeta llamada "descargas"
mkdir descargas
# Mueve tus archivos .ipa a esa carpeta
mv THGJB.ipa descargas/
mv THGJB_beta_2.0.0.ipa descargas/
ls
find. -thgjb "*.ipa"
find . -name "*THGJB*.ipa"
# Aseguramos que la carpeta exista
mkdir -p descargas
# Movemos el que está en THGJB-3
mv THGJB-3/*.ipa descargas/
# Movemos los dos que están en backup
mv backup/*.ipa descargas/
ls -l descargas/
nano index.html
git add .
git commit -m "Organización final: movidos todos los IPA a la carpeta descargas"
git push -u origin main
git push
python -m http.server 8080
# 1. Crear carpetas maestras si no existen
mkdir -p descargas docs scripts
# 2. Mover archivos a sus lugares lógicos
mv *.ipa descargas/           # Todos los instaladores a la carpeta de descargas
mv *.sh scripts/              # Todos tus scripts (instalar, actualizar, menús) a scripts
mv *.txt docs/                # Documentación o notas a docs
mv *.deb descargas/           # Si tienes archivos .deb, también van a descargas
# Borra el contenido actual
cat /dev/null > index.html
# Abre el archivo para pegar el código limpio
nano index.html
python -m http.server 8080
# Borra el contenido actual
cat /dev/null > index.html
# Abre el archivo para pegar el código limpio
nano index.html
python -m http.server 8080
# Borra el contenido actual
cat /dev/null > index.html
# Abre el archivo para pegar el código limpio
nano index.html
nano index.css
python python3 -m http.server 8080
nano test_web.sh
python -m http.server 8080
rm index.css
nano index.html
nano index.css
python -m http.server 8080
nano index.html
rm index.html
nano index.html
python -m http.server 8080
rm index.html
nano index.html
python -m http.server 8080
nano index.html
rm index.html
nano index.html
python -m http.server 8080
rm index.html 
nano index.html
python -m http.server 8080
rm index.html
nano index.html
nano index.css
nano index.html
rm index.html
rm index.cas
rm index.css
index.css
nano index.css
nano index.html
python -m http.server 8080
mkdir ~/web_thgjb
# Entra a tu carpeta
cd ~/ruta/a/tu/proyecto
# Inicia Git
git init
# Crea el archivo para ignorar archivos basura de tu sistema
echo ".DS_Store" > .gitignore
git add .
git commit -m "Mi versión final y permanente de THGJB"
git branch -M main
git remote add origin https://github.com/thg139426-web/THGJB-web.git
git push -u origin main
rm .git-credentials
echo ".git-credentials" >> .gitignore
# Elimina el archivo del área de preparación (staging)
git rm --cached .git-credentials
# Reescribe el commit anterior para que no incluya el archivo
git commit --amend -m "Mi versión final y permanente de THGJB"
git push -u origin main
# Elimina la entrada del archivo de configuración de Git
git config --remove-section submodule.THGJB-3
# Elimina el archivo .gitmodules si existe (solo si no tienes otros submódulos reales)
rm -f .gitmodules
# Si hay una carpeta llamada THGJB-3, quítala del repositorio
git rm --cached THGJB-3
git add .
git commit -m "Limpiando submódulo fantasma THGJB-3"
git push -u origin main
ls -F
touch .nojekyll
nano index.html
python -m http.server 8080
git add index.html
git commit -m "Actualizando diseño de interfaz en index.html"
git push origin main
ls -F
touch .nojekyll
# Elimina los archivos de respaldo que están ensuciando el repositorio
rm -f *.save*
# Si no necesitas las carpetas de otros proyectos (THGJB-3, etc) en este repositorio, bórralas:
rm -rf THGJB-3/ THGJB_rootless/ backup/ build_thgjb/
git add .
git commit -m "Organizando archivos en carpeta docs para evitar errores de despliegue"
git push origin main
cd descargas
ls -lh
mkdir -p docs
mv index.html index.css descargas docs/
touch docs/.nojekyll
cd ..
mkdir -p docs
# Movemos los archivos a docs
mv index.html index.css descargas docs/
# Creamos el archivo .nojekyll dentro de docs
touch docs/.nojekyll
git add .
git commit -m "Organizando estructura en carpeta docs"
git push -u origin main
git add .
git commit -m "Organizando estructura en docs para despliegue final"
git push -u origin main
