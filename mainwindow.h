#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QObject>
#include <QDebug>
#include <QCryptographicHash>
#include <QRegularExpression>

class MainWindow : public QObject
{
    Q_OBJECT

public:

    Q_INVOKABLE bool isValidEmail(QString email);
    explicit MainWindow(QObject *parent = nullptr);

};
#endif // MAINWINDOW_H
