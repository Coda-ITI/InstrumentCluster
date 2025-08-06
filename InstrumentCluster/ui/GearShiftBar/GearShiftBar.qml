import QtQuick 2.15

Rectangle {
    id: gearShiftBar
    color: "#000000"
    anchors {
        right: parent.right
    }
    width: parent.width / 16
    height: parent.height * 7 / 8
    z: 1 // make it above the car video
}

