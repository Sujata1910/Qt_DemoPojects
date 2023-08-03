#include "mainwindow.h"
#include <QCryptographicHash>
#include <QDebug>
#include <QFile>
#include <QDebug>

MainWindow:: MainWindow(QObject *parent)
    : QObject(parent)


bool MainWindow::isValidEmail(const QString &email)
{
    // Regular expression for email validation
    QRegularExpression regex("\\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}\\b");
    bool isValid=regex.match(email).hasMatch();
//    emit emailValidationResult(isValid);
    return isValid;
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


