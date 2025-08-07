import QtQuick 2.15

Rectangle {
    id: gearShiftBar
    color: "#F0F0F0"
    anchors.right: parent.right
    width: parent.width / 16
    height: parent.height

    property string currentGear: "D"

    function gearColor(gear) {
        return gear === currentGear ? "#000000" : "#A5A5A5"
    }

    Text {
        id: parkingGear
        anchors {
            horizontalCenter: gearShiftBar.horizontalCenter
            top: gearShiftBar.top
            topMargin: gearShiftBar.height / 4
        }
        text: qsTr("P")
        color: gearColor("P")
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
        color: gearColor("R")
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
        color: gearColor("D")
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
        color: gearColor("N")
        font.pixelSize: 36
        font.capitalization: Font.Capitalize
        font.bold: Font.Bold
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
    }
}
