import QtQuick 2.15

Rectangle {
    id: lightControlBar
    color: "#F0F0F0"
    anchors {
        left: parent.left
    }
    width: parent.width / 16
    height: parent.height
    Image {
        id: nearLights
        anchors {
            horizontalCenter: lightControlBar.horizontalCenter
            top: lightControlBar.top
            topMargin: lightControlBar.height / 8
        }
        width: lightControlBar.width / 2
        source: "qrc:/ui/assets/low-beam-on.png"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: farLights
        anchors {
            horizontalCenter: lightControlBar.horizontalCenter
            top: nearLights.bottom
            topMargin: lightControlBar.height / 9
        }
        width: lightControlBar.width / 2
        source: "qrc:/ui/assets/high-beam-on.png"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: fogLights
        anchors {
            horizontalCenter: lightControlBar.horizontalCenter
            top: farLights.bottom
            topMargin: lightControlBar.height / 9
        }
        width: lightControlBar.width / 2
        source: "qrc:/ui/assets/fog-light-on.png"
        fillMode: Image.PreserveAspectFit
    }
}
