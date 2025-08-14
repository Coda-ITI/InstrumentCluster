import QtQuick 2.15
import QtMultimedia
// import Qt.labs.lottieqt 1.0
import InstrumentCluster 1.0

AnimatedImage {
    id: carModel
    source: ThemeSettings.isLightMode
        ? "qrc:/ui/assets/Light_Theme.gif"
        : "qrc:/ui/assets/Dark_Theme.gif"
    playing: false
    width: parent.width * 3.5 / 8
    height: parent.height

    Component.onCompleted: {
        playing = readings.speedVal > 0
    }

    Connections {
        target: ThemeSettings
        function onIsLightModeChanged() {
            playing = false
            source = ThemeSettings.isLightMode
                ? "qrc:/ui/assets/Light_Theme.gif"
                : "qrc:/ui/assets/Dark_Theme.gif"
            if (readings.speedVal > 0) {
                playing = true
            }
        }
    }

    Connections {
        target: readings
        function onSpeedValChanged() {
            if (readings.speedVal === 0) {
                playing = false
            } else if (!playing) {
                playing = true
            }
        }
    }
}

