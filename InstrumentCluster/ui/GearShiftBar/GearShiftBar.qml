import QtQuick 2.15

Rectangle {
    id: gearShiftBar
    color: "#F0F0F0"
    anchors {
        right: parent.right
    }
    width: parent.width / 16
    height: parent.height
    Text {
        id: parkingGear
        anchors {
            horizontalCenter: gearShiftBar.horizontalCenter
            top: gearShiftBar.top
            topMargin: gearShiftBar.height / 4
        }
        text: qsTr("P")
        color: "#000000"
        font.pixelSize: 36
        font.capitalization: Font.Capitalize
        font.bold: Font.Bold
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
    }
    Text {
        id: reverseGear
        anchors {
            horizontalCenter: gearShiftBar.horizontalCenter
            top: parkingGear.bottom
            topMargin: gearShiftBar.height / 12
        }
        text: qsTr("R")
        color: "#A5A5A5"
        font.pixelSize: 36
        font.capitalization: Font.Capitalize
        font.bold: Font.Bold
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
    }
    Text {
        id: driveGear
        anchors {
            horizontalCenter: gearShiftBar.horizontalCenter
            top: reverseGear.bottom
            topMargin: gearShiftBar.height / 12
        }
        text: qsTr("D")
        color: "#A5A5A5"
        font.pixelSize: 36
        font.capitalization: Font.Capitalize
        font.bold: Font.Bold
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
    }
    Text {
        id: neutralGear
        anchors {
            horizontalCenter: gearShiftBar.horizontalCenter
            top: driveGear.bottom
            topMargin: gearShiftBar.height / 12
        }
        text: qsTr("N")
        color: "#A5A5A5"
        font.pixelSize: 36
        font.capitalization: Font.Capitalize
        font.bold: Font.Bold
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
    }
}

