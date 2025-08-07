import QtQuick 2.15
import InstrumentCluster 1.0

Rectangle {
    id: bottomLine
    anchors {
        bottom: parent.bottom
        right: parent.right
        left: parent.left
        leftMargin: 50
        rightMargin: 50
    }
    height: 5
    color: ThemeSettings.isLightMode ? "#A5A5A5" : "#5A5A5A"
}
