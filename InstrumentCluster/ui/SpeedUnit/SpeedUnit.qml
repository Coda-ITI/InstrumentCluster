import QtQuick 2.15

Rectangle {
    id: speedUnit
    color: "#f0f0f0"
    anchors {
        bottom: parent.bottom
    }
    width: parent.width
    height: parent.height / 10
    Text {
        anchors {
            horizontalCenter: speedUnit.horizontalCenter
            verticalCenter: speedUnit.verticalCenter
        }
        text: qsTr("KM/H")
        color: "#045457"
        font.pixelSize: 48
        font.capitalization: Font.Capitalize
        font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Roman.tff"
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
    }
}
