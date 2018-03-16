LOCAL_PATH:= $(call my-dir)

# radvd daemon
include $(CLEAR_VARS)
LOCAL_SRC_FILES := radvd.c device-common.c device-linux.c gram.c interface.c log.c \
	netlink.c privsep-linux.c process.c recv.c scanner.c send.c \
	socket.c timer.c util.c
#LOCAL_CFLAGS := -Wall -Werror -Wunused-parameter
LOCAL_SHARED_LIBRARIES := libc libcutils
LOCAL_C_INCLUDES := $(KERNEL_HEADERS)
LOCAL_MODULE = radvd
include $(BUILD_EXECUTABLE)

# Configuration file
include $(CLEAR_VARS)
LOCAL_MODULE = radvd.conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT)/data/misc/radvd
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)
