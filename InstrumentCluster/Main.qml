import QtQuick
import QtMultimedia
import "ui/TopBar"
import "ui/FooterBar"
import "ui/Logo"
import "ui/CarSpeed"

Window {
    width: 1024
    height: 600
    visible: true
    title: qsTr("Hello World")
    color: "#ffffff"
    FooterBar {
        id: footerBar
    }
}

