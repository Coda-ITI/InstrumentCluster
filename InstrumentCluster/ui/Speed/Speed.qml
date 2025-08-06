import QtQuick 2.15

Rectangle {
    id: speed
    color: "#FFFF00"
    width: parent.width
    height: parent.height * 8.5 / 10
    Text {
        id: speedVal
        anchors {
            horizontalCenter: speed.horizontalCenter
            verticalCenter: speed.verticalCenter
        }
        text: qsTr("100")
        color: "#000000"
        font.pixelSize: 144
        font.capitalization: Font.Capitalize
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
    Text {
        id: speedUnit
        anchors {
            verticalCenter: speed.verticalCenter
            horizontalCenter: speed.horizontalCenter
            top: speedVal.bottom
        }
        text: qsTr("KM/H")
        color: "#5A5A5A"
        font.pixelSize: 36
        font.capitalization: Font.Capitalize
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
    Image {
        id: detectedRoadSign
        anchors {
            top: speed.top
            topMargin: 30
            right: speed.right
            rightMargin: 30
        }
        width: speed.width / 9
        height: speed.height / 9
        source: "qrc:/ui/assets/speed-limit-test.png"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: driveMode
        anchors {
            top: speed.top
            topMargin: 30
            left: speed.left
            leftMargin: 30
        }
        width: speed.width / 9
        height: speed.height / 9
        source: "qrc:/ui/assets/wheel.png"
        fillMode: Image.PreserveAspectFit
    }
}
