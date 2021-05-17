import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: topBarBtn

    property url btnIconSource: "../../images/svg/minimize-icon.svg"
    property color btnColorDefault: "#1f1f1f"
    property color btnColorMouseOver: "#23272E"
    property color btnColorClicked: "#00a1f1"

    QtObject {
        id: internal
        property var dynamicColor: if(topBarBtn.down) {
                                       topBarBtn.down ? btnColorClicked : btnColorDefault
                                   } else {
                                       topBarBtn.hovered ? btnColorMouseOver : btnColorDefault
                                   }
    }

    width: 35
    height: 35

    background: Rectangle {
        id: bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 16
            width: 16
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
