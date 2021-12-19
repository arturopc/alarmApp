import QtQuick 2.0
import Felgo 3.0
import QtGraphicalEffects 1.0

Item {
    property int seconds

    Rectangle {
        id: clockSecondsColor
        anchors.centerIn: parent
        width: parent.width - dp(50)
        height: width
        radius: width / 2
        color: "transparent"
        border.color: "#FFFCF7"
        border.width: 12

        ConicalGradient {
            anchors.fill: parent
            source: clockSecondsColor
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#0E9594" }
                GradientStop { position: seconds / 60; color: "#0E9594" }
                GradientStop { position: seconds / 60 + 0.0001; color: "transparent" }
                GradientStop { position: 1.001; color: "transparent" }
            }
        }
    }
}
