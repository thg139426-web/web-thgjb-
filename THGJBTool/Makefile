# Configuración moderna para evitar errores de arquitectura
ARCHS = arm64
TARGET := iphone:clang:latest:14.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = THGJBTool

THGJBTool_FILES = main.m
THGJBTool_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tool.mk

