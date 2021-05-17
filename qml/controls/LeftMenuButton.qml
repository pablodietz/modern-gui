import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: leftMenuBtn
    text: qsTr("Left Menu Text")

    property url btnIconSource: "../../images/svg/home-icon.svg"
    property color btnColorDefault: "#1f1f1f"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"
    property int iconWidth: 18
    property int iconHeight: 18
    property color activeMenuColor: "#55aaff"
    property color activeMenuColorRight: "#2e2f30"
    property bool isActiveMenu: false

    QtObject {
        id: internal
        property var dynamicColor: if(leftMenuBtn.down) {
                                       leftMenuBtn.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       leftMenuBtn.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 250
    implicitHeight: 60

    background: Rectangle {
        id: bgBtn
        color: internal.dynamicColor

        Rectangle {
            anchors {
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: activeMenuColor
            width: 3
            visible: isActiveMenu
        }

        Rectangle {
            anchors {
                top: parent.top
                right: parent.right
                bottom: parent.bottom
            }
            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu
        }
    }

    contentItem: Item {
        anchors.fill: parent
        id: content
        Image {
            id: iconBtn
            anchors.leftMargin: 26
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            source: btnIconSource
            sourceSize.width: iconWidth
            sourceSize.height: iconHeight
            width: iconWidth
            height: iconHeight
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay {
                    anchors.fill: iconBtn
                    source: iconBtn
                    color: "#b4b4b4"
                    anchors.verticalCenter: parent.verticalCenter
                    antialiasing: true
                    width: iconWidth
                    height: iconHeight
        }

        Text {
            color: "#b4b4b4"
            text: leftMenuBtn.text
            font: leftMenuBtn.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.66;height:60;width:250}
}
##^##*/
