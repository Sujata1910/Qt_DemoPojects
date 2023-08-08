import QtQuick 2.14
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.14
import QtGraphicalEffects 1.14
import Qt.labs.settings 1.0
import MainWindowLib 1.0
Rectangle {
    id:gridrec
    border.color: "blue"
    border.width: 4
    width:mainStack.width
    height: mainStack.height * 0.8
    color: "lightblue"
    property int cellSize: 220
    property int selectedItemIndex: -1
    visible:true

    MainWindow{
        id:mwclass
    }

    Rectangle{
        id:cal
        width:parent.width*0.28
        height:parent.height*0.60
        radius: 12
        anchors.centerIn: parent
        color: "black"
        TextField {
            id:input
            font.pixelSize: 20
            font.bold:true
            color: "white"
            width:parent.width*0.86
            height:parent.height*0.15
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height*0.08
            background: Rectangle{
                id:inprec
                width:parent.width
                height:parent.height
                radius: 12
                color:"grey"
            }
        }
        RowLayout {
            id:row1
            spacing: 20
            anchors.top: clearbutton.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: ["7", "8", "9", "*"]
                Button {
                    width: 70
                    height: 70
                    Text {
                        id: name1
                        text: modelData
                        font.bold: true
                        font.pixelSize: 22
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        input.text += modelData
                    }
                }
            }
        }
        RowLayout {
            id:row2
            spacing: 20
            anchors.top: row1.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: ["4", "5", "6","/"]
                Button {
                    width: 70
                    height: 70
                    Text {
                        id: name2
                        text: modelData
                        font.bold: true
                        font.pixelSize: 22
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        input.text += modelData
                    }
                }
            }
        }
        RowLayout {
            id:row3
            spacing: 20
            anchors.top: row2.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            Repeater {
                model: ["1", "2", "3", "-"]
                Button {
                    width: 70
                    height: 70
                    Text {
                        id: name3
                        text: modelData
                        font.bold: true
                        font.pixelSize: 22
                        anchors.centerIn: parent
                    }
                    onClicked: {
                        input.text += modelData
                    }
                }
            }
        }
        RowLayout {
            id:row4
            spacing: 20
            anchors.top: row3.bottom
            anchors.topMargin: 25
            anchors.left: parent.left
            anchors.leftMargin: 41
            Repeater {
                model: ["0", ".","+"]
                Button {
                    width: 70
                    height: 70
                    Text {
                        id: name4
                        text: modelData
                        font.bold: true
                        font.pixelSize: 22
                        anchors.centerIn: parent
                    }

                    onClicked: {
                        input.text += " " + modelData + " "

                    }
                }

            }
        }
        RowLayout {
            id:equal
            spacing: 20
            anchors.top: row3.bottom
            anchors.topMargin: 25
            anchors.right:parent.right
            anchors.rightMargin: 35
            Button {
                width: 70
                height: 70
                Text {
                    id: name5
                    text: qsTr("=")
                    font.bold: true
                    font.pixelSize: 22
                    anchors.centerIn: parent
                }
                onClicked: {
                    try {
                        var expression = input.text.replace(/\s+/g, '');
                        var result = eval(expression);
                        if (!isNaN(result)) {
                            input.text = result.toString();
                        } else {
                            input.text = "Error";
                        }
                    } catch (e) {
                        input.text = "Error";
                    }
                }
            }
        }
        RowLayout {
            id:clearbutton
            anchors.top: input.bottom
            anchors.topMargin: 25
            anchors.right: parent.right
            anchors.rightMargin: 41
            Button {
                width: 70
                height: 70
                Text {
                    id: name6
                    text: qsTr("C")
                    font.bold: true
                    font.pixelSize: 22
                    anchors.centerIn: parent
                }
                onClicked: {
                    input.text = ""
                }
            }

        }

    }
}
