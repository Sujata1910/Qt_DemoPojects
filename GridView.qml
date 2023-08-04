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
    color: "grey"
    property int cellSize: 220
    property int selectedItemIndex: -1
    visible:true

    Text {
           id: selectedIndexText
           text: gridrec.selectedItemIndex !== -1 ? "Index: " + gridrec.selectedItemIndex : ""
           color: "white"
           font.pixelSize: 40
           font.bold: true
           anchors.bottom: parent.bottom
           anchors.right: parent.right
           anchors.rightMargin: 30
           anchors.bottomMargin: 30
       }
    GridView{
        id: gridView
        anchors.fill: parent
        cellWidth: cellSize
        cellHeight: cellSize
        model: myModel
        delegate: Rectangle {
            id:rec
            width: gridView.cellWidth
            height: gridView.cellHeight
            color: gridrec.selectedItemIndex === index ? "steelblue" :"lightblue"
            border.color: gridrec.selectedItemIndex === index ?"white":"black"
            border.width:gridrec.selectedItemIndex === index ? 7:1
            Text {
                anchors.centerIn: parent
                text: name
                color: gridrec.selectedItemIndex === index ?"white":"black"
                font.pixelSize: 30
                font.bold: true
            }


            MouseArea {
                anchors.fill: parent
                onClicked: {
                    gridrec.selectedItemIndex = index;
                    text:"\nIndex: " + index
                    console.log("Clicked item index:", index);
                    selectedIndexText.text = "Selected Item Index: " + index;
                }
            }
        }
    }
    ListModel {
        id: myModel
        ListElement { name: "Music"}
        ListElement { name: "Movies"}
        ListElement { name: "Calender"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Camera"}
        ListElement { name: "Contact"}
        ListElement { name: "Music"}
        ListElement { name: "Movies"}
        ListElement { name: "Calender"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Camera"}
        ListElement { name: "Contact"}
        ListElement { name: "Music"}
        ListElement { name: "Movies"}
        ListElement { name: "Calender"}
        ListElement { name: "Messaging"}
        ListElement { name: "Todo List"}
        ListElement { name: "Camera"}
    }
}
