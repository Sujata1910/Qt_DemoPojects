#include "mainwindow.h"
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QApplication>

int main(int argc, char *argv[])
{
    QGuiApplication  app(argc, argv);
    app.setOrganizationName("pdrl");
    app.setOrganizationDomain("https://github.com/8-DK");
    QQmlApplicationEngine engine;

  qmlRegisterType<MainWindow>("MainWindowLib", 1, 0, "MainWindow");
    engine.load(QUrl(QStringLiteral("qrc:/stackView.qml")));
    // engine.load(QUrl(QStringLiteral("qrc:/st.qml")));


    return app.exec();
}
