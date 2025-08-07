import QtQuick 2.15
import InstrumentCluster 1.0

Rectangle {
    id: speed
    color: ThemeSettings.isLightMode ? "#F0F0F0" : "#000000"
    width: parent.width
    height: parent.height * 8.5 / 10
    Text {
        id: speedVal
        anchors {
            horizontalCenter: speed.horizontalCenter
            verticalCenter: speed.verticalCenter
        }
        text: qsTr("100")
        color: ThemeSettings.isLightMode ? "#000000" : "#D0D0D0"
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
        color: ThemeSettings.isLightMode ? "#5A5A5A" : "#A5A5A5"
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
        width: speed.width / 7
        height: speed.height / 7
        source: "qrc:/ui/assets/speed-limit-test.png"
        fillMode: Image.PreserveAspectFit
    }
}
