import QtQuick 2.15
import "../IconButton"

Rectangle {
    id: lightControlBar
    color: "#F0F0F0"
    anchors {
        left: parent.left
    }
    width: parent.width / 16
    height: parent.height
    IconButton {
        id: nearLights
        anchors {
            horizontalCenter: lightControlBar.horizontalCenter
            top: lightControlBar.top
            topMargin: lightControlBar.height / 8
        }
        roundIcon: true
        iconWidth: lightControlBar.width / 2
        iconHeight: 35
        checkable: true

        setIcon: checked
            ? "qrc:/ui/assets/low-beam-on.png"
            : "qrc:/ui/assets/low-beam-off.png"

        onCheckedChanged: {
            if (!checked) {
                const target = roundIcon ? roundIconSource : iconSource
                if (target) target.opacity = 1
            }
        }
    }

    IconButton {
        id: farLights
        anchors {
            horizontalCenter: lightControlBar.horizontalCenter
            top: nearLights.bottom
            topMargin: lightControlBar.height / 12
        }
        roundIcon: true
        iconWidth: lightControlBar.width / 2
        iconHeight: 35
        checkable: true

        setIcon: checked
            ? "qrc:/ui/assets/high-beam-on.png"
            : "qrc:/ui/assets/high-beam-off.png"

        onCheckedChanged: {
            if (!checked) {
                const target = roundIcon ? roundIconSource : iconSource
                if (target) target.opacity = 1
            }
        }
    }
    IconButton {
        id: fogLights
        anchors {
            horizontalCenter: lightControlBar.horizontalCenter
            top: farLights.bottom
            topMargin: lightControlBar.height / 12
        }
        roundIcon: true
        iconWidth: lightControlBar.width / 2
        iconHeight: 35
        checkable: true

        setIcon: checked
            ? "qrc:/ui/assets/fog-light-on.png"
            : "qrc:/ui/assets/fog-light-off.png"

        onCheckedChanged: {
            if (!checked) {
                const target = roundIcon ? roundIconSource : iconSource
                if (target) target.opacity = 1
            }
        }
    }
}
