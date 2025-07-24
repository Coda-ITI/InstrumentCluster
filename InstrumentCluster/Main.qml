import QtQuick
import "ui/TopBar"
import "ui/FooterBar"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id: backgroundRect
        color: "black"
        width: parent.width
        height: parent.height
        TopBar {
            id: topBar
        }
        FooterBar {
            id: footerBar
        }
    }
}
