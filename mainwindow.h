#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

class MainWindow : public QObject
{
    Q_OBJECT

public:
    MainWindow(QObject *parent = nullptr);
    ~MainWindow();


    Q_INVOKABLE void readTextFile(QString filePath);
};
#endif // MAINWINDOW_H
