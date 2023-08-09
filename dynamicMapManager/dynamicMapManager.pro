#-------------------------------------------------
#
# Project created by QtCreator 2018-08-07T21:15:48
#
#-------------------------------------------------

QT       += core gui network xml

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = dynamicMapManager
TEMPLATE = app


SOURCES += main.cpp\
        dialog.cpp \
    multicastsocket.cpp

HEADERS  += dialog.h \
    communicationData.h \
    multicastsocket.h

FORMS    += dialog.ui

RESOURCES += \
    res.qrc
