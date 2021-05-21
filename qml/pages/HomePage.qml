import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#2e2f30"
        anchors.fill: parent

        Label {
            id: label
            x: 363
            y: 232
            color: "#ffffff"
            text: qsTr("Home Page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 14
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:1}
}
##^##*/
