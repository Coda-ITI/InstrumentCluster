import QtQuick 2.15

Rectangle {
    id: footerBar
    anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }
    width: parent.width
    height: parent.height / 8
    z: 1 // make it above the car video
    // CC for 0.8 alpha/opacity
    // E6 for 0.9
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#E6f0f0f0" }
        GradientStop { position: 1.0; color: "#E6f8f5f5" }
    }
}
