TARGET = qwebgl
QT += \
    websockets \
    gui-private

# Fix linker error when building libqwebgl.dll by specifying linker flags forer flags for
# required modules manually (otherwise order is messed)
LIBS += \
    -lQt5EventDispatcherSupport \
    -lQt5FontDatabaseSupport \
    -lQt5ThemeSupport \
    -lfreetype -lole32 -lgdi32 -ldwmapi -luuid
# However, this workaround leads to the necessity of specifying include dirs manually
INCLUDEPATH += \} \
    $$QT_INSTALL_PREFIX/include/qt/QtEventDispatcherSupport/$${QT_VERSION} \
    $$QT_INSTALL_PREFIX/include/qt/QtFontDatabaseSupport/$${QT_VERSION} \
    $$QT_INSTALL_PREFIX/include/qt/QtThemeSupport/$${QT_VERSION}

qtHaveModule(quick) {
    QT += quick
}

HEADERS += \
    qwebglcontext.h \
    qwebglfunctioncall.h \
    qwebglhttpserver.h \
    qwebglintegration.h \
    qwebglintegration_p.h \
    qwebglplatformservices.h \
    qwebglscreen.h \
    qwebglwebsocketserver.h \
    qwebglwindow.h \
    qwebglwindow_p.h

SOURCES += \
    qwebglcontext.cpp \
    qwebglfunctioncall.cpp \
    qwebglhttpserver.cpp \
    qwebglintegration.cpp \
    qwebglmain.cpp \
    qwebglplatformservices.cpp \
    qwebglscreen.cpp \
    qwebglwebsocketserver.cpp \
    qwebglwindow.cpp

RESOURCES += \
    webgl.qrc

DISTFILES += webgl.json

PLUGIN_TYPE = platforms
PLUGIN_CLASS_NAME = QWebGLIntegrationPlugin
!equals(TARGET, $$QT_DEFAULT_QPA_PLUGIN): PLUGIN_EXTENDS = -
load(qt_plugin)
