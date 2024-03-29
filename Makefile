#############################################################################
# Makefile for building: dist/debug/unix/rc-net
# Generated by qmake (2.01a) (Qt 4.8.1) on: Sa. Apr 28 14:51:28 2012
# Project:  rc-net.pro
# Template: app
# Command: /usr/bin/qmake-qt4 -spec /usr/share/qt4/mkspecs/linux-g++ CONFIG+=debug CONFIG+=declarative_debug -o Makefile rc-net.pro
#############################################################################

####### Compiler, tools and options

CC            = gcc
CXX           = g++
DEFINES       = -DQT_WEBKIT -DQT_GUI_LIB -DQT_NETWORK_LIB -DQT_CORE_LIB -DQT_SHARED
CFLAGS        = -pipe -g -Wall -W -D_REENTRANT $(DEFINES)
CXXFLAGS      = -pipe -g -Wall -W -D_REENTRANT $(DEFINES)
INCPATH       = -I/usr/share/qt4/mkspecs/linux-g++ -I. -I/usr/include/qt4/QtCore -I/usr/include/qt4/QtNetwork -I/usr/include/qt4/QtGui -I/usr/include/qt4 -Itemp -Itemp
LINK          = g++
LFLAGS        = 
LIBS          = $(SUBLIBS)  -L/usr/lib/i386-linux-gnu -lQtGui -lQtNetwork -lQtCore -lpthread 
AR            = ar cqs
RANLIB        = 
QMAKE         = /usr/bin/qmake-qt4
TAR           = tar -cf
COMPRESS      = gzip -9f
COPY          = cp -f
SED           = sed
COPY_FILE     = $(COPY)
COPY_DIR      = $(COPY) -r
STRIP         = strip
INSTALL_FILE  = install -m 644 -p
INSTALL_DIR   = $(COPY_DIR)
INSTALL_PROGRAM = install -m 755 -p
DEL_FILE      = rm -f
SYMLINK       = ln -f -s
DEL_DIR       = rmdir
MOVE          = mv -f
CHK_DIR_EXISTS= test -d
MKDIR         = mkdir -p

####### Output directory

OBJECTS_DIR   = temp/unix-debug/

####### Files

SOURCES       = src/main.cpp \
		src/Window.cpp \
		src/Peer.cpp \
		src/Net.cpp \
		src/Settings.cpp \
		src/Input.cpp \
		src/InputDialog.cpp \
		src/Inputs.cpp temp/moc_Window.cpp \
		temp/moc_Peer.cpp \
		temp/moc_Net.cpp \
		temp/moc_Settings.cpp \
		temp/moc_InputAxisWidget.cpp \
		temp/moc_InputBtnWidget.cpp \
		temp/moc_Input.cpp \
		temp/moc_InputDialog.cpp \
		temp/moc_Inputs.cpp
OBJECTS       = temp/unix-debug/main.o \
		temp/unix-debug/Window.o \
		temp/unix-debug/Peer.o \
		temp/unix-debug/Net.o \
		temp/unix-debug/Settings.o \
		temp/unix-debug/Input.o \
		temp/unix-debug/InputDialog.o \
		temp/unix-debug/Inputs.o \
		temp/unix-debug/moc_Window.o \
		temp/unix-debug/moc_Peer.o \
		temp/unix-debug/moc_Net.o \
		temp/unix-debug/moc_Settings.o \
		temp/unix-debug/moc_InputAxisWidget.o \
		temp/unix-debug/moc_InputBtnWidget.o \
		temp/unix-debug/moc_Input.o \
		temp/unix-debug/moc_InputDialog.o \
		temp/unix-debug/moc_Inputs.o
DIST          = /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/debug.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/declarative_debug.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		rc-net.pro
QMAKE_TARGET  = rc-net
DESTDIR       = dist/debug/unix/
TARGET        = dist/debug/unix/rc-net

first: all
####### Implicit rules

.SUFFIXES: .o .c .cpp .cc .cxx .C

.cpp.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cc.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.cxx.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.C.o:
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o "$@" "$<"

.c.o:
	$(CC) -c $(CFLAGS) $(INCPATH) -o "$@" "$<"

####### Build rules

all: Makefile $(TARGET)

$(TARGET): temp/ui_Window.h temp/ui_InputAxisWidget.h temp/ui_InputBtnWidget.h temp/ui_InputDialog.h $(OBJECTS)  
	@$(CHK_DIR_EXISTS) dist/debug/unix/ || $(MKDIR) dist/debug/unix/ 
	$(LINK) $(LFLAGS) -o $(TARGET) $(OBJECTS) $(OBJCOMP) $(LIBS)
	{ test -n "$(DESTDIR)" && DESTDIR="$(DESTDIR)" || DESTDIR=.; } && test $$(gdb --version | sed -e 's,[^0-9]\+\([0-9]\)\.\([0-9]\).*,\1\2,;q') -gt 72 && gdb --nx --batch --quiet -ex 'set confirm off' -ex "save gdb-index $$DESTDIR" -ex quit '$(TARGET)' && test -f $(TARGET).gdb-index && objcopy --add-section '.gdb_index=$(TARGET).gdb-index' --set-section-flags '.gdb_index=readonly' '$(TARGET)' '$(TARGET)' && rm -f $(TARGET).gdb-index || true

Makefile: rc-net.pro  /usr/share/qt4/mkspecs/linux-g++/qmake.conf /usr/share/qt4/mkspecs/common/unix.conf \
		/usr/share/qt4/mkspecs/common/linux.conf \
		/usr/share/qt4/mkspecs/common/gcc-base.conf \
		/usr/share/qt4/mkspecs/common/gcc-base-unix.conf \
		/usr/share/qt4/mkspecs/common/g++-base.conf \
		/usr/share/qt4/mkspecs/common/g++-unix.conf \
		/usr/share/qt4/mkspecs/qconfig.pri \
		/usr/share/qt4/mkspecs/modules/qt_phonon.pri \
		/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri \
		/usr/share/qt4/mkspecs/features/qt_functions.prf \
		/usr/share/qt4/mkspecs/features/qt_config.prf \
		/usr/share/qt4/mkspecs/features/exclusive_builds.prf \
		/usr/share/qt4/mkspecs/features/default_pre.prf \
		/usr/share/qt4/mkspecs/features/debug.prf \
		/usr/share/qt4/mkspecs/features/default_post.prf \
		/usr/share/qt4/mkspecs/features/declarative_debug.prf \
		/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf \
		/usr/share/qt4/mkspecs/features/warn_on.prf \
		/usr/share/qt4/mkspecs/features/qt.prf \
		/usr/share/qt4/mkspecs/features/unix/thread.prf \
		/usr/share/qt4/mkspecs/features/moc.prf \
		/usr/share/qt4/mkspecs/features/resources.prf \
		/usr/share/qt4/mkspecs/features/uic.prf \
		/usr/share/qt4/mkspecs/features/yacc.prf \
		/usr/share/qt4/mkspecs/features/lex.prf \
		/usr/lib/i386-linux-gnu/libQtGui.prl \
		/usr/lib/i386-linux-gnu/libQtNetwork.prl \
		/usr/lib/i386-linux-gnu/libQtCore.prl
	$(QMAKE) -spec /usr/share/qt4/mkspecs/linux-g++ CONFIG+=debug CONFIG+=declarative_debug -o Makefile rc-net.pro
/usr/share/qt4/mkspecs/common/unix.conf:
/usr/share/qt4/mkspecs/common/linux.conf:
/usr/share/qt4/mkspecs/common/gcc-base.conf:
/usr/share/qt4/mkspecs/common/gcc-base-unix.conf:
/usr/share/qt4/mkspecs/common/g++-base.conf:
/usr/share/qt4/mkspecs/common/g++-unix.conf:
/usr/share/qt4/mkspecs/qconfig.pri:
/usr/share/qt4/mkspecs/modules/qt_phonon.pri:
/usr/share/qt4/mkspecs/modules/qt_webkit_version.pri:
/usr/share/qt4/mkspecs/features/qt_functions.prf:
/usr/share/qt4/mkspecs/features/qt_config.prf:
/usr/share/qt4/mkspecs/features/exclusive_builds.prf:
/usr/share/qt4/mkspecs/features/default_pre.prf:
/usr/share/qt4/mkspecs/features/debug.prf:
/usr/share/qt4/mkspecs/features/default_post.prf:
/usr/share/qt4/mkspecs/features/declarative_debug.prf:
/usr/share/qt4/mkspecs/features/unix/gdb_dwarf_index.prf:
/usr/share/qt4/mkspecs/features/warn_on.prf:
/usr/share/qt4/mkspecs/features/qt.prf:
/usr/share/qt4/mkspecs/features/unix/thread.prf:
/usr/share/qt4/mkspecs/features/moc.prf:
/usr/share/qt4/mkspecs/features/resources.prf:
/usr/share/qt4/mkspecs/features/uic.prf:
/usr/share/qt4/mkspecs/features/yacc.prf:
/usr/share/qt4/mkspecs/features/lex.prf:
/usr/lib/i386-linux-gnu/libQtGui.prl:
/usr/lib/i386-linux-gnu/libQtNetwork.prl:
/usr/lib/i386-linux-gnu/libQtCore.prl:
qmake:  FORCE
	@$(QMAKE) -spec /usr/share/qt4/mkspecs/linux-g++ CONFIG+=debug CONFIG+=declarative_debug -o Makefile rc-net.pro

dist: 
	@$(CHK_DIR_EXISTS) temp/unix-debug/rc-net1.0.0 || $(MKDIR) temp/unix-debug/rc-net1.0.0 
	$(COPY_FILE) --parents $(SOURCES) $(DIST) temp/unix-debug/rc-net1.0.0/ && $(COPY_FILE) --parents src/Window.h src/Peer.h src/Net.h src/Settings.h src/InputAxisWidget.h src/InputBtnWidget.h src/Input.h src/InputDialog.h src/Inputs.h temp/unix-debug/rc-net1.0.0/ && $(COPY_FILE) --parents src/main.cpp src/Window.cpp src/Peer.cpp src/Net.cpp src/Settings.cpp src/Input.cpp src/InputDialog.cpp src/Inputs.cpp temp/unix-debug/rc-net1.0.0/ && $(COPY_FILE) --parents src/Window.ui src/InputAxisWidget.ui src/InputBtnWidget.ui src/InputDialog.ui temp/unix-debug/rc-net1.0.0/ && (cd `dirname temp/unix-debug/rc-net1.0.0` && $(TAR) rc-net1.0.0.tar rc-net1.0.0 && $(COMPRESS) rc-net1.0.0.tar) && $(MOVE) `dirname temp/unix-debug/rc-net1.0.0`/rc-net1.0.0.tar.gz . && $(DEL_FILE) -r temp/unix-debug/rc-net1.0.0


clean:compiler_clean 
	-$(DEL_FILE) $(OBJECTS)
	-$(DEL_FILE) *~ core *.core


####### Sub-libraries

distclean: clean
	-$(DEL_FILE) $(TARGET) 
	-$(DEL_FILE) Makefile


check: first

mocclean: compiler_moc_header_clean compiler_moc_source_clean

mocables: compiler_moc_header_make_all compiler_moc_source_make_all

compiler_moc_header_make_all: temp/moc_Window.cpp temp/moc_Peer.cpp temp/moc_Net.cpp temp/moc_Settings.cpp temp/moc_InputAxisWidget.cpp temp/moc_InputBtnWidget.cpp temp/moc_Input.cpp temp/moc_InputDialog.cpp temp/moc_Inputs.cpp
compiler_moc_header_clean:
	-$(DEL_FILE) temp/moc_Window.cpp temp/moc_Peer.cpp temp/moc_Net.cpp temp/moc_Settings.cpp temp/moc_InputAxisWidget.cpp temp/moc_InputBtnWidget.cpp temp/moc_Input.cpp temp/moc_InputDialog.cpp temp/moc_Inputs.cpp
temp/moc_Window.cpp: src/Window.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/Window.h -o temp/moc_Window.cpp

temp/moc_Peer.cpp: src/Peer.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/Peer.h -o temp/moc_Peer.cpp

temp/moc_Net.cpp: src/Peer.h \
		src/Net.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/Net.h -o temp/moc_Net.cpp

temp/moc_Settings.cpp: src/Settings.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/Settings.h -o temp/moc_Settings.cpp

temp/moc_InputAxisWidget.cpp: temp/ui_InputAxisWidget.h \
		src/InputAxisWidget.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/InputAxisWidget.h -o temp/moc_InputAxisWidget.cpp

temp/moc_InputBtnWidget.cpp: temp/ui_InputBtnWidget.h \
		src/InputBtnWidget.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/InputBtnWidget.h -o temp/moc_InputBtnWidget.cpp

temp/moc_Input.cpp: src/Input.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/Input.h -o temp/moc_Input.cpp

temp/moc_InputDialog.cpp: src/InputAxisWidget.h \
		temp/ui_InputAxisWidget.h \
		src/InputBtnWidget.h \
		temp/ui_InputBtnWidget.h \
		src/InputDialog.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/InputDialog.h -o temp/moc_InputDialog.cpp

temp/moc_Inputs.cpp: src/Input.h \
		src/Inputs.h
	/usr/bin/moc-qt4 $(DEFINES) $(INCPATH) src/Inputs.h -o temp/moc_Inputs.cpp

compiler_rcc_make_all:
compiler_rcc_clean:
compiler_image_collection_make_all: temp/qmake_image_collection.cpp
compiler_image_collection_clean:
	-$(DEL_FILE) temp/qmake_image_collection.cpp
compiler_moc_source_make_all:
compiler_moc_source_clean:
compiler_uic_make_all: temp/ui_Window.h temp/ui_InputAxisWidget.h temp/ui_InputBtnWidget.h temp/ui_InputDialog.h
compiler_uic_clean:
	-$(DEL_FILE) temp/ui_Window.h temp/ui_InputAxisWidget.h temp/ui_InputBtnWidget.h temp/ui_InputDialog.h
temp/ui_Window.h: src/Window.ui
	/usr/bin/uic-qt4 src/Window.ui -o temp/ui_Window.h

temp/ui_InputAxisWidget.h: src/InputAxisWidget.ui
	/usr/bin/uic-qt4 src/InputAxisWidget.ui -o temp/ui_InputAxisWidget.h

temp/ui_InputBtnWidget.h: src/InputBtnWidget.ui
	/usr/bin/uic-qt4 src/InputBtnWidget.ui -o temp/ui_InputBtnWidget.h

temp/ui_InputDialog.h: src/InputDialog.ui
	/usr/bin/uic-qt4 src/InputDialog.ui -o temp/ui_InputDialog.h

compiler_yacc_decl_make_all:
compiler_yacc_decl_clean:
compiler_yacc_impl_make_all:
compiler_yacc_impl_clean:
compiler_lex_make_all:
compiler_lex_clean:
compiler_clean: compiler_moc_header_clean compiler_uic_clean 

####### Compile

temp/unix-debug/main.o: src/main.cpp src/Window.h \
		src/Net.h \
		src/Peer.h \
		src/Inputs.h \
		src/Input.h \
		src/Settings.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/main.o src/main.cpp

temp/unix-debug/Window.o: src/Window.cpp src/Window.h \
		temp/ui_Window.h \
		src/Net.h \
		src/Peer.h \
		src/Inputs.h \
		src/Input.h \
		src/InputDialog.h \
		src/InputAxisWidget.h \
		temp/ui_InputAxisWidget.h \
		src/InputBtnWidget.h \
		temp/ui_InputBtnWidget.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/Window.o src/Window.cpp

temp/unix-debug/Peer.o: src/Peer.cpp src/Peer.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/Peer.o src/Peer.cpp

temp/unix-debug/Net.o: src/Net.cpp src/Net.h \
		src/Peer.h \
		src/Settings.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/Net.o src/Net.cpp

temp/unix-debug/Settings.o: src/Settings.cpp src/Settings.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/Settings.o src/Settings.cpp

temp/unix-debug/Input.o: src/Input.cpp src/Input.h \
		src/Settings.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/Input.o src/Input.cpp

temp/unix-debug/InputDialog.o: src/InputDialog.cpp src/InputDialog.h \
		src/InputAxisWidget.h \
		temp/ui_InputAxisWidget.h \
		src/InputBtnWidget.h \
		temp/ui_InputBtnWidget.h \
		temp/ui_InputDialog.h \
		src/Inputs.h \
		src/Input.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/InputDialog.o src/InputDialog.cpp

temp/unix-debug/Inputs.o: src/Inputs.cpp src/Inputs.h \
		src/Input.h \
		src/Settings.h
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/Inputs.o src/Inputs.cpp

temp/unix-debug/moc_Window.o: temp/moc_Window.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_Window.o temp/moc_Window.cpp

temp/unix-debug/moc_Peer.o: temp/moc_Peer.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_Peer.o temp/moc_Peer.cpp

temp/unix-debug/moc_Net.o: temp/moc_Net.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_Net.o temp/moc_Net.cpp

temp/unix-debug/moc_Settings.o: temp/moc_Settings.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_Settings.o temp/moc_Settings.cpp

temp/unix-debug/moc_InputAxisWidget.o: temp/moc_InputAxisWidget.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_InputAxisWidget.o temp/moc_InputAxisWidget.cpp

temp/unix-debug/moc_InputBtnWidget.o: temp/moc_InputBtnWidget.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_InputBtnWidget.o temp/moc_InputBtnWidget.cpp

temp/unix-debug/moc_Input.o: temp/moc_Input.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_Input.o temp/moc_Input.cpp

temp/unix-debug/moc_InputDialog.o: temp/moc_InputDialog.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_InputDialog.o temp/moc_InputDialog.cpp

temp/unix-debug/moc_Inputs.o: temp/moc_Inputs.cpp 
	$(CXX) -c $(CXXFLAGS) $(INCPATH) -o temp/unix-debug/moc_Inputs.o temp/moc_Inputs.cpp

####### Install

install:   FORCE

uninstall:   FORCE

FORCE:

