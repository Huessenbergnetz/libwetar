#-------------------------------------------------
#
# Project created by QtCreator 2017-09-04T09:51:50
#
#-------------------------------------------------

QT       += network xml

QT       -= gui

TARGET = wetar
TEMPLATE = lib

lessThan(QT_MAJOR_VERSION, 5) | lessThan(QT_MINOR_VERSION, 6) {
    error(libwetar requires Qt 5.6.0 or newer but Qt $$[QT_VERSION] was detected.)
}

VER_MAJ = 0
VER_MIN = 0
VER_PAT = 1
VERSION = $${VER_MAJ}.$${VER_MIN}.$${VER_PAT}

CONFIG -= console
CONFIG -= app_bundle
CONFIG += shared
CONFIG += c++11
CONFIG += no_keywords

DEFINES += LIBWETAR_LIBRARY

DEFINES += VERSION_STRING=\"\\\"$${VERSION}\\\"\"

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

isEmpty(PREFIX): PREFIX = $$[QT_INSTALL_PREFIX]
isEmpty(INSTALL_LIB_DIR): INSTALL_LIB_DIR = $$[QT_INSTALL_LIBS]

!contains(CONFIG, no_install_dev_files) {
    isEmpty(INSTALL_HEADERS_DIR): INSTALL_HEADERS_DIR = $$[QT_INSTALL_HEADERS]
    INSTALL_HEADERS += \
        Wetar/wetar_global.h \
        Wetar/wetar.h
        Wetar/Wetar

    basePath = $${dirname(PWD)}
    for(header, INSTALL_HEADERS) {
        relPath = $${relative_path($$header, $$basePath)}
        path = $${INSTALL_HEADERS_DIR}/$${dirname(relPath)}
        eval(headers_$${path}.files += $$relPath)
        eval(headers_$${path}.path = $$path)
        eval(INSTALLS *= headers_$${path})
    }

    pkgconfigfile.input = wetar.pc.in
    pkgconfigfile.output = wetar.pc
    pkgconfigfile.path = $$[QT_INSTALL_LIBS]/pkgconfig
    pkgconfigfile.files = $$pkgconfigfile.output

    QMAKE_SUBSTITUTES += pkgconfigfile

    INSTALLS += pkgconfigfile
}

target = $$TARGET
target.path = $$INSTALL_LIB_DIR
INSTALLS += target

SOURCES +=

HEADERS += \
    Wetar/wetar.h \
    Wetar/wetar_global.h

DISTFILES += \
    wetar.pc.in
