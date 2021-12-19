import QtQuick 2.0
import Felgo 3.0

Rectangle {
    width: dp(250)
    height: dp(260)
    color: Theme.backgroundColor
    border.color: Theme.textColor
    border.width: 4
    radius: 10

    signal closeClicked

    AppText {
        anchors.top: parent.top
        anchors.topMargin: dp(10)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "New Alarm"
    }

    DatePicker {
        id: timeSelection
        width: dp(150)
        height: dp(180)
        anchors.centerIn: parent
        datePickerMode: timeMode
    }

    AppButton {
        text: "Cancel"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(5)
        anchors.left: parent.left
        anchors.leftMargin: dp(50)
        radius: 10
        borderWidth: 4
        minimumHeight: dp(30)
        minimumWidth: dp(50)
        onClicked: closeClicked()
    }

    AppButton {
        text: "Add"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(5)
        anchors.right: parent.right
        anchors.rightMargin: dp(50)
        radius: 10
        borderWidth: 4
        minimumHeight: dp(30)
        minimumWidth: dp(50)
        backgroundColor: "#0E9594"
        backgroundColorPressed: Qt.darker(backgroundColor, 1.2)
        onClicked: {
            let hoursSelected = timeSelection.selectedDate.getHours()
            let minutesSelected = timeSelection.selectedDate.getMinutes()
            if (minutesSelected < 10) {
                minutesSelected = "0" + minutesSelected
            }
            let stamp = parseInt(hoursSelected) * 60 + parseInt(minutesSelected)
            let timeSelected = hoursSelected + ":" + minutesSelected
            dataModel.alarmList.push({ text: timeSelected, isOn: true, orderStamp: stamp })
            dataModel.sortList()
            dataModel.alarmListChanged()
            closeClicked()
        }
    }
}
