import QtQuick 2.14
import QtQuick 2.2
import QtQuick.Controls 2.14
import MainWindowLib 1.0
import Qt.labs.settings 1.0
import QtQuick.Dialogs 1.0




ApplicationWindow {
    id: mainStack
    title: qsTr("StackView")
    width: 1365
    height: 765
    visible: true

    MainWindow{
        id: formClassId

        function readFile(fileUrl) {

                    console.log("Reading file: " + fileUrl)
                }

//        function writeFile(fileUrl, content) {

//                console.log("Writing to file: " + fileUrl)
//                console.log("Content: " + content)
//            }
    }


    FileDialog {
        id: fileDialog
        title: "Please choose a file"
        folder: shortcuts.home
       // nameFilters: ".png"

        onAccepted: {
            formClassId.readTextFile(fileDialog.fileUrls)
            console.log("You chose: " + fileDialog.fileUrls)
           // formClassId.writeFile(fileDialog.fileUrls)
            console.log()
            fileDialog.close()

        }
        onRejected: {
            console.log("Canceled")
            fileDialog.close()
        }
//        Component.onCompleted: visible = true
    }



    Rectangle{
        id: upperrec
        width: parent.width
        height: parent.height * 0.15
        //color: "red"

        StackView {
            id: mainStackView
            anchors.top: parent.bottom
            initialItem: project1Page

        }


        Row {
            spacing: 80
            anchors{
                centerIn: parent
            }
            RoundButton {
                text: "LogIn"
                font.pixelSize: 20
                width: 100
                height: 50
                onClicked:{
                    mainStackView.pop()
                    mainStackView.push("loginpage.qml")
                    console.log("Button 1 clicked")
                }
            }

            RoundButton {
                text: "Button 2"
                font.pixelSize: 20
                width: 100
                height: 50
                onClicked: {
                    mainStackView.pop();
                    mainStackView.push("SignUp.qml")
                }
            }


            RoundButton {
                text: "Button 3"
                font.pixelSize: 20
                width: 100
                height: 50
                onClicked: fileDialog.open()
            }

            RoundButton {
                text: "Button 4"
                font.pixelSize: 20
                width: 100
                height: 50
                onClicked: {
                    mainStackView.pop();
                    mainStackView.push("UserFrom.qml")
                }
            }

            RoundButton {
                text: "Button 5"
                font.pixelSize: 20
                width: 100
                height: 50
                onClicked: console.log("Button 5 clicked")
            }
        }
    }

    Component {
        id: project1Page
        Rectangle {
            id:recinit
            color: "lightblue"
            width:mainStack.width
            height: mainStack.height * 0.8
            border.color: "blue"
            Text {
                text: "Hello Welcome To StackView"
                font.pointSize: 50
                anchors.centerIn: recinit
            }

        }
    }
}
