import QtQuick
import "ui/TopBar"
import "ui/FooterBar"
import "ui/Logo"
import "ui/CarSpeed"
import "ui/GearShiftBar"
import "ui/LightControlBar"
import "ui/CarModel"
import "ui/MainScreen"
import "ui/SpeedometerPlusSign"
import "ui/Indicators"
import "ui/SpeedUnit"
import "ui/Speed"
import "ui/BottomLine"

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
        SpeedometerPlusSign {
            id: speedometerPlusSign
            anchors {
                right: gearShiftBar.left
            }
            Indicators {
                id: indicatorsBar

            }
            Speed {
                id: speed
                anchors {
                    top: indicatorsBar.bottom
                }
            }
            BottomLine {
                id: bottomLine
            }

            // SpeedUnit {
            //     id: speedUnit
            //     anchors {
            //         top: speed.bottom
            //     }
            // }
        }
    }
}

