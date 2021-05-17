import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: mainWindow
    width: 1000
    height: 580
    visible: true
    color: "#00000000"
    title: qsTr("Hello World")
    flags: Qt.Window | Qt.FramelessWindowHint

    property int windowStatus: 0
    property int windowMargin: 10

    QtObject {
        id: internal

        function maximizeRestore() {
            if (windowStatus == 0) {
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                maximizeRestoreBtn.btnIconSource = "../images/svg/restore-icon.svg"
            } else {
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                maximizeRestoreBtn.btnIconSource = "../images/svg/maximize-icon.svg"
            }
        }

        function ifMaximizedWindowRestore() {
            if (windowStatus == 1) {
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                maximizeRestoreBtn.btnIconSource = "../images/svg/maximize-icon.svg"
            }
        }

        function restoreMargins() {
            windowStatus = 0
            windowMargin = 10
            maximizeRestoreBtn.btnIconSource = "../images/svg/maximize-icon.svg"
        }
    }

    Rectangle {
        id: bg
        color: "#2e2f30"
        border.color: "#383e4c"
        border.width: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin

        Rectangle {
            id: appContainer
            color: "#00000000"
            anchors.fill: parent
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1f1f1f"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton {
                    id: toggleBtn
                    onClicked: animationMenu.running = true
                }

                Rectangle {
                    id: topBarDescription
                    y: 35
                    height: 24
                    color: "#28292a"
                    anchors.left: toggleBtn.right
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.rightMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#b4b4b4"
                        text: qsTr("Application description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.topMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 0
                    }

                    Label {
                        id: labelRightInfo
                        color: "#b4b4b4"
                        text: qsTr("| HOME")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    color: "#00000000"
                    anchors.left: toggleBtn.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: topBarDescription.top
                    anchors.bottomMargin: 0
                    anchors.rightMargin: 105
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if (active) {
                                            mainWindow.startSystemMove()
                                            internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 22
                        height: 22
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        source: "../images/svg/app-top-icon.svg"
                        anchors.leftMargin: 5
                        fillMode: Image.PreserveAspectFit
                    }

                    Label {
                        id: label
                        color: "#b4b4b4"
                        text: qsTr("My Application Title")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 9
                        font.bold: false
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: row
                    anchors.left: titleBar.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: topBarDescription.top
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    TopBarButton {
                        id: minimizeBtn
                        btnColorDefault: "#1f1f1f"
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }

                    }

                    TopBarButton {
                        id: maximizeRestoreBtn
                        btnColorDefault: "#1f1f1f"
                        visible: true
                        btnIconSource: "../images/svg/maximize-icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: closeBtn
                        visible: true
                        btnColorClicked: "#ff2f47"
                        btnColorMouseOver: "#b62233"
                        btnColorDefault: "#1f1f1f"
                        clip: false
                        btnIconSource: "../images/svg/close-icon.svg"
                        onClicked: mainWindow.close()
                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                border.color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1f1f1f"
                    border.color: "#00000000"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation {
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width == 70) return 200; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }

                    Column {
                        id: column
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0

                        LeftMenuButton {
                            id: homeBtn
                            width: leftMenu.width
                            text: qsTr("Home")
                            isActiveMenu: true
                            btnIconSource: "../images/svg/home-icon.svg"
                        }

                        LeftMenuButton {
                            id: openBtn
                            width: leftMenu.width
                            text: qsTr("Open")
                            isActiveMenu: false
                            btnIconSource: "../images/svg/open-icon.svg"
                        }

                        LeftMenuButton {
                            id: saveBtn
                            width: leftMenu.width
                            text: qsTr("Save")
                            isActiveMenu: false
                            btnIconSource: "../images/svg/save-icon.svg"
                        }
                    }

                    LeftMenuButton {
                        id: settingsBtn
                        x: 0
                        y: 180
                        width: leftMenu.width
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        btnIconSource: "../images/svg/settings-icon.svg"
                        anchors.bottomMargin: 25
                        isActiveMenu: false
                    }
                }

                Rectangle {
                    id: contentPages
                    visible: true
                    color: "#2e2f30"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.topMargin: 0
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                }

                Rectangle {
                    id: rectangle
                    color: "#28292a"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelBottomInfo
                        color: "#b4b4b4"
                        text: qsTr("Application description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        anchors.rightMargin: 30
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        anchors.leftMargin: 10
                    }
                }
            }

        }
    }

    DropShadow {
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 18
        samples: 16
        color: "#80000000"
        source: bg
        z: 0
    }
}
