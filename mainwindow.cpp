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



QString MainWindow::getName()
{
    return name;
}

void MainWindow::setName( QString newName)
{
    name = newName;
}

QString MainWindow::getLastname()
{
    return lastname;
}

void MainWindow::setLastname(QString newLastname)
{
    lastname = newLastname;
}

QString MainWindow::getEmail()
{
    return email;
}

void MainWindow::setEmail(QString newEmail)
{
    email = newEmail;
}



QString MainWindow::getVarphone()
{
    return varphone;
}

void MainWindow::setVarphone(QString newVarphone)
{
    varphone = newVarphone;
}

QString MainWindow::getAddress()
{
    return address;
}

void MainWindow::setAddress(QString newAddress)
{
    address = newAddress;
}

QString MainWindow::getCity()
{
    return city;
}

void MainWindow::setCity(QString newCity)
{
    city = newCity;
}

QString MainWindow::getState()
{
    return state;
}

void MainWindow::setState(QString newState)
{
    state = newState;
}

QString MainWindow::getWebsite1()
{
    return website1;
}

void MainWindow::setWebsite1(QString newWebsite1)
{
    website1 = newWebsite1;
}

QString MainWindow::getZipcode()
{
    return zipcode;
}

void MainWindow::setZipcode(QString newZipcode)
{
    zipcode = newZipcode;
}

QString MainWindow::getHosting()
{
    return hosting;
}

void MainWindow::setHosting(QString newHosting)
{
    hosting = newHosting;
}

QString MainWindow::getProject()
{
    return project;
}

void MainWindow::setProject(QString newProject)
{
    project = newProject;
}

// write data in json file

void MainWindow::writeJsonFile()
{
    // Create a JSON object with the data
    QJsonObject jsonData;
    jsonData["First Name"] = name;
    jsonData["Last Name"] = lastname;
    jsonData["Email"] = email;
    jsonData["Phone"] = varphone;
    jsonData["Address"] = address;
    jsonData["City"] = city;
    jsonData["Country"] = "India";
    jsonData["Profession"] = website1;
    jsonData["Qualification"] = project;

    // Convert the JSON object to a JSON document
    QJsonDocument jsonDoc(jsonData);

    // Save the JSON document to a file
    QString filename = "DataFile0.json";
    QFile file(filename);

    if (file.open(QIODevice::WriteOnly))
    {
        file.write(jsonDoc.toJson());
        file.close();
        qDebug() << "All data store in Json File";
    }
    else
    {
        qDebug() << "Failed to open the file for writing.";
    }
}

void MainWindow::setunit(QString unit)
{
    sunit = unit;

}

QString MainWindow::getunit()
{
    return sunit;
}
double MainWindow::setdisunit(double dunit)
{
    if(dunit==meter){
    return meter * 3.28084;
   }
    if(dunit==feet){
    return feet / 3.28084;
    }

}


//void MainWindow::unitConversion(QString)
//{
//    MainWindow::System currentUnitSystem = MainWindow::System::Meter;

//    if (currentUnitSystem == MainWindow::System::Meter) {
//        qDebug() << "Using Met Unit System";
//        // Perform metric unit system calculations or conversions
//    } else if (currentUnitSystem == MainWindow::System::Feet) {
//        qDebug() << "Using Feet Unit System";
//        // Perform imperial unit system calculations or conversions
//    }
//}

// Json file reading

QString MainWindow::readJsonFile()
{
    QString filename = "DataFile0.json";
    QFile file(filename);

    if (!file.open(QIODevice::ReadOnly))
    {
        qDebug() << "Failed to open the file for reading.";
        return QString();
    }

    QByteArray jsonData = file.readAll();
    file.close();

    // Load the JSON document from the file data
    QJsonParseError error;
    QJsonDocument jsonDoc = QJsonDocument::fromJson(jsonData, &error);
    if (error.error != QJsonParseError::NoError)
    {
        qDebug() << "Failed to parse JSON document: " << error.errorString();
        return QString();
    }

    // Extract data from the JSON document
    QJsonObject jsonObject = jsonDoc.object();
    name = jsonObject["First Name"].toString();
    lastname = jsonObject["Last Name"].toString();
    email = jsonObject["Email"].toString();
    varphone = jsonObject["Phone"].toString();
    address = jsonObject["Address"].toString();
    city = jsonObject["City"].toString();
    website1 = jsonObject["Country"].toString();
    hosting = jsonObject["Profession"].toString();
    project = jsonObject["Qualification"].toString();

    qDebug() << "Data read from JSON file.";
    qDebug() << jsonObject;
    return QString();

}






