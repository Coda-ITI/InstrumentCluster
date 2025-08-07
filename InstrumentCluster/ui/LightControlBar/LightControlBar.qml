import QtQuick 2.15
import "../IconButton"
import InstrumentCluster 1.0

Rectangle {
    id: lightControlBar
    color: ThemeSettings.isLightMode ? "#F0F0F0" : "#000000"
    anchors {
        left: parent.left
    }
    width: parent.width / 16
    height: parent.height

    Component.onCompleted: {
        console.log("Initial low beam state:", lightControl.lowBeam)
    }

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
        checked: lightControl.lowBeam

        onClicked: {
            lightControl.lowBeam = !lightControl.lowBeam
        }

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
        checked: lightControl.highBeam

        onClicked: {
            lightControl.highBeam = !lightControl.highBeam
        }

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
        checked: lightControl.fogBeam

        onClicked: {
            lightControl.fogBeam = !lightControl.fogBeam
        }

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
