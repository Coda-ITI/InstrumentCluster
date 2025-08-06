import QtQuick 2.15
import QtMultimedia

Video {
    id: carModel
    source: "file:///media/nemesis/67590880-9c2e-4c6f-8431-2e7e8d8ec2c5/Playground/Github_Repositories/ITI_GP/InstrumentCluster/InstrumentCluster/ui/assets/nav_car_light.mp4"
    autoPlay: true
    loops: MediaPlayer.Infinite
    anchors {
        top: parent.top
        bottom: parent.bottom
    }
    width: parent.width / 2
    height: parent.height
}
