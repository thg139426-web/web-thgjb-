# Define la arquitectura y el SDK moderno
ARCHS = arm64
TARGET := iphone:clang:latest:14.0

# Incluye las librerías base de Theos
include $(THEOS)/makefiles/common.mk

# Nombre de tu herramienta
TOOL_NAME = THGJBTool

# Archivos fuente
THGJBTool_FILES = main.m
THGJBTool_CFLAGS = -fobjc-arc

# Incluye la lógica de compilación de herramientas
include $(THEOS_MAKE_PATH)/tool.mk

# Regla opcional para confirmar el final del empaquetado
after-package::
	@echo "Paquete generado correctamente"

