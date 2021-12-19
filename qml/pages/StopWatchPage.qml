import QtQuick 2.0
import Felgo 3.0

Item {
    property int timeElapsed
    property bool stopped
    property bool initialize: true

    Timer {
        id: stopwatchTimer
        interval: 100
        running: false
        repeat: true
        onTriggered: timeElapsed += 100
    }

    Rectangle {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: dp(40)
        width: dp(250)
        height: dp(90)
        radius: width / 2
        color: "#868683"
        border.color: "#FFFCF7"
        border.width: 7
        AppText {
            anchors.centerIn: parent
            color: "#FFFCF7"
            fontSize: 40
            text: dataModel.formatStopWatchTime(timeElapsed)
        }
    }

    AppButton {
        visible: !stopwatchTimer.running
        text: stopped ? "Resume" : "Start"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: stopped ? dp(70) : dp(0)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: stopped ? dp(110) : dp(40)
        radius: width / 2
        borderWidth: 4
        minimumHeight: stopped ? dp(120) : dp(200)
        minimumWidth: stopped ? dp(120) : dp(200)
        backgroundColor: "#0E9594"
        backgroundColorPressed: Qt.darker(backgroundColor, 1.2)
        textSize: stopped ? 40 : 70
        onClicked: stopwatchTimer.start()
    }

    AppButton {
        visible: stopwatchTimer.running
        text: "Stop"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(40)
        radius: minimumWidth / 2
        borderWidth: 4
        minimumHeight: dp(200)
        minimumWidth: dp(200)
        backgroundColor: "#EC9A29"
        backgroundColorPressed: Qt.darker(backgroundColor, 1.2)
        textSize: 70
        onClicked: {
            stopped = true
            initialize = false
            stopwatchTimer.stop()
        }
    }

    AppButton {
        visible: !stopwatchTimer.running && !initialize
        text: "Clear"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: -dp(70)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(110)
        radius: minimumWidth / 2
        borderWidth: 4
        minimumHeight: dp(120)
        minimumWidth: dp(120)
        backgroundColor: "#EC9A29"
        backgroundColorPressed: Qt.darker(backgroundColor, 1.2)
        textSize: 50
        onClicked: {
            initialize = true
            stopped = false
            timeElapsed = 0
        }
    }
}
