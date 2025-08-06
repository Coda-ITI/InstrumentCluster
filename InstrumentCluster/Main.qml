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
    CarModel {
        id: carModel
    }
    FooterBar {
        id: footerBar
    }
    GearShiftBar {
        id: gearShiftBar
    }
    LightControlBar {
        id: lightControlBar
    }
    // MainScreen {
    //     id: mainScreen
    //     anchors {
    //         left: lightControlBar.right
    //         right: gearShiftBar.left
    //     }
    // }
}

