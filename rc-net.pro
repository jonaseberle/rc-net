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

greaterThan(QT_MAJOR_VERSION, 4) {
   QT *= widgets
#   QT *= quick1
} else {
#   QT *= declarative
}
QT       *= core gui network

TARGET = rc-net
TEMPLATE = app

# temp files
MOC_DIR = ./temp/
UI_DIR = ./temp/
RCC_DIR = ./temp/
OBJECTS_DIR = ./temp/$${PLATFORM}-$${DEBUGRELEASE}

SOURCES += src/main.cpp\
        src/Window.cpp \
     src/Peer.cpp \
     src/Net.cpp \
     src/Settings.cpp \
     src/Input.cpp \
     src/InputDialog.cpp \
     src/Inputs.cpp

HEADERS  +=  src/Window.h \
     src/Peer.h \
     src/Net.h \
     src/Settings.h \
     src/InputAxisWidget.h \
     src/InputBtnWidget.h \
     src/Input.h \
     src/InputDialog.h \
     src/Inputs.h

FORMS    +=  src/Window.ui \
     src/InputAxisWidget.ui \
     src/InputBtnWidget.ui \
     src/InputDialog.ui

OTHER_FILES += CHANGELOG.md \
    README.md \
    conf
