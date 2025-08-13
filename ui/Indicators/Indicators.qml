import QtQuick 2.15
import "../IconButton"
import InstrumentCluster 1.0

Rectangle {
    id: indicatorBar
    color: ThemeSettings.isLightMode ? "#F0F0F0" : "#000000"
    anchors {
        top: parent.top
    }
    width: parent.width
    height: parent.height * 1.5 / 10

    IconButton {
        id: leftIndicator
        roundIcon: true
        iconWidth: 50
        iconHeight: 50
        checkable: true
        checked: indicators.leftBlinker

        onClicked: {
            indicators.leftBlinker = !indicators.leftBlinker
        }

        anchors {
            top: indicatorBar.top
            topMargin: 12
            left: indicatorBar.left
            leftMargin: 30
        }

        setIcon: checked
            ? "qrc:/ui/assets/icn_leftindicator_glow.svg"
            : "qrc:/ui/assets/icn_leftindicator.svg"

        SequentialAnimation {
            id: flicker2Animation
            running: leftIndicator.checked
            loops: Animation.Infinite

            NumberAnimation {
                target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                property: "opacity"
                from: 0
                to: 1
                duration: 500
            }
            NumberAnimation {
                target: leftIndicator.roundIcon ? leftIndicator.roundIconSource : leftIndicator.iconSource
                property: "opacity"
                from: 1
                to: 0
                duration: 500
            }
        }

        onCheckedChanged: {
            if (checked) {
                rightIndicator.checked = false // Turn off the other
            } else {
                const target = roundIcon ? roundIconSource : iconSource
                if (target) target.opacity = 1
            }
        }
    }

    IconButton {
        id: rightIndicator
        roundIcon: true
        iconWidth: 50
        iconHeight: 50
        checkable: true
        checked: indicators.rightBlinker

        onClicked: {
            indicators.rightBlinker = !indicators.rightBlinker
        }

        anchors {
            top: indicatorBar.top
            topMargin: 12
            right: indicatorBar.right
            rightMargin: 30
        }

        setIcon: checked
            ? "qrc:/ui/assets/icn_rightindicator _glow.svg"
            : "qrc:/ui/assets/icn_rightindicator.svg"

        SequentialAnimation {
            id: flickerAnimation
            running: rightIndicator.checked
            loops: Animation.Infinite

            NumberAnimation {
                target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                property: "opacity"
                from: 0
                to: 1
                duration: 500
            }
            NumberAnimation {
                target: rightIndicator.roundIcon ? rightIndicator.roundIconSource : rightIndicator.iconSource
                property: "opacity"
                from: 1
                to: 0
                duration: 500
            }
        }

        onCheckedChanged: {
            if (checked) {
                leftIndicator.checked = false
            } else {
                const target = roundIcon ? roundIconSource : iconSource
                if (target) target.opacity = 1
            }
        }
    }
}
