#include "mainwindow.h"
#include <QFile>
#include <QDebug>

MainWindow:: MainWindow(QObject *parent)
    : QObject(parent)
{
}

MainWindow::~MainWindow()
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


