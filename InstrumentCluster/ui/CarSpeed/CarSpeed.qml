import QtQuick 2.15

Text {
    anchors {
        horizontalCenter: parent.horizontalCenter
        verticalCenter: parent.verticalCenter
        verticalCenterOffset: -50
    }
    text: qsTr("KM/H")
    color: "#045457"
    font.pixelSize: 28
    font.capitalization: Font.Capitalize
    font.bold: Font.Bold
    font.weight: Font.Bold
    font.family: "qrc:/ui/fonts/HelveticaNeueLTCom-Bd.tff"
    wrapMode: Text.WrapAtWordBoundaryOrAnywhere
}
