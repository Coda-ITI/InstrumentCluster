import QtQuick 2.15

Rectangle {
    id: footerBar
    anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }
    width: parent.width
    height: parent.height / 8
    // z: 1 // make it above the car video
    // CC for 0.8 alpha/opacity
    // E6 for 0.9
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#F0F0F0" }
        GradientStop { position: 1.0; color: "#AAAAAA" }
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
        color: "#000000"
        // text: systemHandler.currentTime
        text: "10:09"
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
        color: "#000000"
        // text: systemHandler.outdoorTemp + "°C"
        text: "24°C"
    }
}
