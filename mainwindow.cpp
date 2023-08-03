#include "mainwindow.h"
#include <QCryptographicHash>
#include <QDebug>
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

