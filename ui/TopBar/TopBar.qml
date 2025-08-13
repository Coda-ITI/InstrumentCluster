import QtQuick 2.15

Image {
    id: topBar
    source: "qrc:/ui/assets/topbar.png"
    anchors {
        top: parent.top
        horizontalCenter: parent.horizontalCenter
    }
    width: parent.width
    height: parent.height / 12
}
