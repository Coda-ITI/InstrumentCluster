import QtQuick 2.15
import InstrumentCluster 1.0

Rectangle {
    id: footerBar
    anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }
    width: parent.width
    height: parent.height / 8
    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: ThemeSettings.isLightMode ? "#F0F0F0" : "#000000"
        }
        GradientStop {
            position: 1.0
            color: ThemeSettings.isLightMode ? "#F0F0F0" : "#000000"
        }
    }


    Image {
        id: itiLogo
        source: "qrc:/ui/assets/iti-logo.png"
        anchors {
            verticalCenter: parent.verticalCenter
            centerIn: parent
            horizontalCenter: parent.horizontalCenter
        }
        height: parent.height * 0.8
        fillMode: Image.PreserveAspectFit
    }
    Text {
        id: dateTimeDisplay
        anchors {
            verticalCenter: parent.verticalCenter
            left: footerBar.left
            leftMargin: 40
        }
        font.pixelSize: 24
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
        color: ThemeSettings.isLightMode ? "#000000" : "#FFFFFF"
        text: systemHandler.currentTime
        // text: "10:09"
    }

    Text {
        id: outdoorTempDisplay
        anchors {
            verticalCenter: parent.verticalCenter
            left: dateTimeDisplay.right
            leftMargin: 35
        }
        font.pixelSize: 24
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
        color: ThemeSettings.isLightMode ? "#000000" : "#FFFFFF"
        // text: systemHandler.outdoorTemp + "°C"
        text: "24°C"
    }
}
