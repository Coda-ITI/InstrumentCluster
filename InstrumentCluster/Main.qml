import QtQuick
import "ui/TopBar"
import "ui/FooterBar"
import "ui/Logo"
import "ui/CarSpeed"
import "ui/GearShiftBar"
import "ui/LightControlBar"
import "ui/CarModel"
import "ui/MainScreen"

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")
    color: "#f0f0f0"
    FooterBar {
        id: footerBar
    }
    MainScreen {
        id: mainScreen
        GearShiftBar {
            id: gearShiftBar
        }
        LightControlBar {
            id: lightControlBar
        }
        CarModel {
            id: carModel
            anchors {
                left: lightControlBar.right
            }
        }
    }
}

