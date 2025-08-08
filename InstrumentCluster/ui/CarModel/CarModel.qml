import QtQuick 2.15
import QtMultimedia
import Qt.labs.lottieqt 1.0
import InstrumentCluster 1.0

Video {
    id: carModel
    source: ThemeSettings.isLightMode ?
                "file:///media/nemesis/67590880-9c2e-4c6f-8431-2e7e8d8ec2c5/Playground/Github_Repositories/ITI_GP/InstrumentCluster/InstrumentCluster/ui/assets/Light_Theme.webm"
              :
                "file:///media/nemesis/67590880-9c2e-4c6f-8431-2e7e8d8ec2c5/Playground/Github_Repositories/ITI_GP/InstrumentCluster/InstrumentCluster/ui/assets/Dark_Theme.webm"
    autoPlay: true
    loops: MediaPlayer.Infinite
    width: parent.width * 3.5 / 8
    height: parent.height

    Connections {
        target: ThemeSettings
        function onIsLightModeChanged() {
            carModel.stop()
            carModel.source = ThemeSettings.isLightMode ?
                        "file:///media/nemesis/67590880-9c2e-4c6f-8431-2e7e8d8ec2c5/Playground/Github_Repositories/ITI_GP/InstrumentCluster/InstrumentCluster/ui/assets/Light_Theme.webm"
                :
                        "file:///media/nemesis/67590880-9c2e-4c6f-8431-2e7e8d8ec2c5/Playground/Github_Repositories/ITI_GP/InstrumentCluster/InstrumentCluster/ui/assets/Dark_Theme.webm"
            carModel.play()
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
