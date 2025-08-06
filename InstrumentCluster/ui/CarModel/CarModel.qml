import QtQuick 2.15
import QtMultimedia
import Qt.labs.lottieqt 1.0

Video {
    id: carModel
    source: "file:///media/nemesis/67590880-9c2e-4c6f-8431-2e7e8d8ec2c5/Playground/Github_Repositories/ITI_GP/InstrumentCluster/InstrumentCluster/ui/assets/Light_Theme.webm"
    autoPlay: true
    loops: MediaPlayer.Infinite
    width: parent.width * 3.5 / 8
    height: parent.height
    // z: 1
}
// LottieAnimation {
//     id: carModel
//     source: "qrc:/ui/assets/Light_Theme.json"
//     loops: LottieAnimation.Infinite
//     width: parent.width / 2
//     height: parent.height * 9 / 10
// }
