win32:PLATFORM = "win32"
macx:PLATFORM = "macx"
unix:PLATFORM = "unix"

CONFIG(debug,release|debug) {
    !build_pass:message("DEBUG")
    DEBUGRELEASE = "debug"
    DESTDIR = ./
}
CONFIG(release,release|debug) {
    !build_pass:message("RELEASE")
    DEBUGRELEASE = "release"
    DESTDIR = ./DIST-$${PLATFORM}
}
QT       *= core gui network

TARGET = rc
TEMPLATE = app

# temp files
MOC_DIR = ./temp/$${PLATFORM}-$${DEBUGRELEASE}
UI_DIR = ./temp/$${PLATFORM}-$${DEBUGRELEASE}
OBJECTS_DIR = ./temp/$${PLATFORM}-$${DEBUGRELEASE}
RCC_DIR = ./temp/$${PLATFORM}-$${DEBUGRELEASE}

SOURCES += main.cpp\
        Window.cpp \
    Peer.cpp \
    Net.cpp \
    Settings.cpp \
    Input.cpp \
    InputDialog.cpp \
    Inputs.cpp

HEADERS  += Window.h \
    Peer.h \
    Net.h \
    Settings.h \
    InputAxisWidget.h \
    InputBtnWidget.h \
    Input.h \
    InputDialog.h \
    Inputs.h

FORMS    += Window.ui \
    InputAxisWidget.ui \
    InputBtnWidget.ui \
    InputDialog.ui

OTHER_FILES += CHANGELOG \
    README \
    conf
