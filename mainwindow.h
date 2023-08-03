#ifndef MAINWINDOW_H
#define MAINWINDOW_H
#include <QMainWindow>
#include <QCryptographicHash>
#include <QObject>
#include <QDebug>
#include <QRegularExpression>

class MainWindow : public QObject
{
    Q_OBJECT

public:
    Q_INVOKABLE bool isValidEmail(const QString &email);
    explicit MainWindow(QObject *parent=nullptr);
};
#endif // MAINWINDOW_H
