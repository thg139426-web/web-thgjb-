TARGET := iphone:clang:latest:7.0

include $(THEOS)/makefiles/common.mk

TOOL_NAME = THGJBTool

THGJBTool_FILES = main.m
THGJBTool_CFLAGS = -fobjc-arc
THGJBTool_CODESIGN_FLAGS = -Sentitlements.plist
THGJBTool_INSTALL_PATH = /usr/local/bin

include $(THEOS_MAKE_PATH)/tool.mk
THEOS_DEVICE_IP = 127.0.0.1
ARCHS = arm64
TARGET = iphone:clang:latest:14.0

