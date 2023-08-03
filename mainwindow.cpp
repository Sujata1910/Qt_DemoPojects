#include "mainwindow.h"
#include <QDebug>
#include<QFile>
#include <QCryptographicHash>
#include <QJsonObject>
#include <QJsonDocument>
#include <QByteArray>
#include <QJsonArray>

bool MainWindow::isValidEmail(QString email)
{
    QRegularExpression regex("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}\\b");
    return regex.match(email).hasMatch();

}

MainWindow::MainWindow(QObject *parent ):
    QObject(parent)
{

}

void MainWindow::readTextFile(QString filePath)
{
    filePath = filePath.remove("file:///");
QFile file(filePath);
qDebug()<<"In  readTextFile..";
QStringList strings;
if (file.open(QIODevice::ReadOnly | QIODevice::Text))
{
    QTextStream in(&file);
    while (!in.atEnd()) {
        strings += in.readLine().split(";");
    }
    qDebug()<<"strings.."<<strings;
}
}




