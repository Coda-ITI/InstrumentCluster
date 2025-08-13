import QtQuick 2.15
import QtMultimedia
import Qt.labs.lottieqt 1.0
import InstrumentCluster 1.0

Video {
    id: carModel
    source: ThemeSettings.isLightMode
           ? "qrc:/ui/assets/Light_Theme.webm"
           : "qrc:/ui/assets/Dark_Theme.webm"
    autoPlay: false
    loops: MediaPlayer.Infinite
    width: parent.width * 3.5 / 8
    height: parent.height

    Component.onCompleted: {
        if (readings.speedVal > 0) {
            carModel.play()
        } else {
            carModel.pause()
        }
    }

    Connections {
        target: ThemeSettings
        function onIsLightModeChanged() {
            carModel.pause()
            carModel.source = ThemeSettings.isLightMode
                ? "qrc:/ui/assets/Light_Theme.webm"
                : "qrc:/ui/assets/Dark_Theme.webm"
            if (readings.speedVal > 0) {
                carModel.play()
            }
        }
    }

    Connections {
        target: readings
        function onSpeedValChanged() {
            if (readings.speedVal === 0) {
                carModel.pause()
            } else if (carModel.playbackState !== MediaPlayer.PlayingState) {
                carModel.play()
            }
        }
    }
}

// LottieAnimation {
//     id: carModel
//     source: "qrc:/ui/assets/Light_Theme.json"
//     loops: LottieAnimation.Infinite
//     width: parent.width / 2
//     height: parent.height * 9 / 10
// }
