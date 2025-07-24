import QtQuick 2.15

Image {
    id: footerBar
    source: "qrc:/ui/assets/footerbar.svg"
    anchors {
        bottom: parent.bottom
        horizontalCenter: parent.horizontalCenter
    }
    width: parent.width
    height: parent.height / 12
}
