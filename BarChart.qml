import QtQuick 2.14
import QtQuick.Controls 2.2
import MainWindowLib 1.0
import QtCharts 2.14

Rectangle{
    width:mainStack.width
    height: mainStack.height * 0.8
    // border.color: "black"
    // border.width: 3
    // color: "light grey"
    //    anchors.right: parent.right

    ChartView {
        title: "Students Growth per Year"
        width: parent.width * 0.3
        height: parent.height * 0.7
        //  theme: ChartView.ChartThemeBrownSand
        anchors.left: chart.right
        legend.alignment: Qt.AlignBottom
        antialiasing: true

        BarSeries {
            id: mySeries
            axisX: BarCategoryAxis { categories: ["2007", "2008", "2009", "2010", "2011", "2012" ] }
            BarSet { label: "Bob"; values: [2, 2, 3, 4, 5, 6] }
            BarSet { label: "Susan"; values: [5, 1, 2, 4, 1, 7] }
            BarSet { label: "James"; values: [3, 5, 8, 13, 5, 8] }
        }
    }


}
