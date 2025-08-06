import QtQuick 2.15

Rectangle {
    id: lightControlBar
    color: "#000000"
    anchors {
        left: parent.left
    }
    width: parent.width / 16
    height: parent.height * 7 / 8
    z: 1 // make it above the car video
}
