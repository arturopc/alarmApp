import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.4

Item {
    property string timeText: Date().toLocaleString().split(" ")[3]

    Timer {
        interval: 100
        running: true
        repeat: true
        onTriggered: {
            interval = 1000
            timeText = Date().toLocaleString().split(" ")[3]
        }
    }

    ClockCircle {
        anchors.fill: parent
        seconds: parseInt(timeText.split(":")[2]) + 1

        AppText {
            anchors.centerIn: parent
            color: "#FFFCF7"
            fontSize: 65
            text: timeText.slice(0, -3)
        }
    }
}
