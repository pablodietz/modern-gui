import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: toggleBtn

    property url btnIconSource: "../../images/svg/menu-icon.svg"
    property color btnColorDefault: "#1f1f1f"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject {
        id: internal
        property var dynamicColor: if(toggleBtn.down) {
                                       toggleBtn.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       toggleBtn.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    implicitWidth: 70
    implicitHeight: 60

    background: Rectangle {
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
            visible: false
        }

        ColorOverlay {
                    anchors.fill: iconBtn
                    source: iconBtn
                    color: "#b4b4b4"
                    antialiasing: false
        }
    }
}
