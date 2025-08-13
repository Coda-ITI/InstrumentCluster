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
        text: readings.speedVal
        color: {
            let overLimit = (readings.detectedRoadSign === "SpeedLimit50" && readings.speedVal > 50) ||
                            (readings.detectedRoadSign === "SpeedLimit80" && readings.speedVal > 80);
            if (readings.detectedRoadSign === "Stop" || overLimit) {
                return ThemeSettings.isLightMode ? "#A9272D" : "#CC4E4E";
            }
            return ThemeSettings.isLightMode ? "#000000" : "#D0D0D0";
        }
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
        // color: ThemeSettings.isLightMode ? "#5A5A5A" : "#A5A5A5"
        color: {
            let overLimit = (readings.detectedRoadSign === "SpeedLimit50" && readings.speedVal > 50) ||
                            (readings.detectedRoadSign === "SpeedLimit80" && readings.speedVal > 80);
            if (readings.detectedRoadSign === "Stop" || overLimit) {
                // Slightly muted red shades to match normal tone difference
                return ThemeSettings.isLightMode ? "#C14C4C" : "#E17878";
            }
            return ThemeSettings.isLightMode ? "#5A5A5A" : "#A5A5A5";
        }
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
        fillMode: Image.PreserveAspectFit
        source: {
            switch (readings.detectedRoadSign) {
            case "Stop":
                return "qrc:/ui/assets/stop.png"
            case "TurnLeft":
                return "qrc:/ui/assets/turn-left.png"
            case "TurnRight":
                return "qrc:/ui/assets/turn-right.png"
            case "SpeedLimit80":
                return "qrc:/ui/assets/speed-limit-80.png"
            case "SpeedLimit50":
                return "qrc:/ui/assets/speed-limit-50.png"
            default:
                return ""
            }
        }
    }
}
