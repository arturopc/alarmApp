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

    function setInitialTime(hours, minutes) {
        timeSelection.selectedDate.setHours(hours)
        timeSelection.selectedDate.setMinutes(minutes)
    }

    AppText {
        anchors.top: parent.top
        anchors.topMargin: dp(10)
        anchors.horizontalCenter: parent.horizontalCenter
        text: "Edit Alarm"
    }

    DatePicker {
        id: timeSelection
        width: dp(150)
        height: dp(180)
        anchors.centerIn: parent
        datePickerMode: timeMode
    }

    AppButton {
        text: "Delete"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(5)
        anchors.left: parent.left
        anchors.leftMargin: dp(30)
        radius: 10
        borderWidth: 4
        minimumHeight: dp(30)
        minimumWidth: dp(50)
        onClicked: {
            dataModel.alarmList.splice(dataModel.editAlarmIndex, 1)
            dataModel.alarmListChanged()
            closeClicked()
        }
    }

    AppButton {
        text: "Update"
        anchors.bottom: parent.bottom
        anchors.bottomMargin: dp(5)
        anchors.right: parent.right
        anchors.rightMargin: dp(30)
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
            dataModel.alarmList[dataModel.editAlarmIndex].text = timeSelected
            dataModel.alarmList[dataModel.editAlarmIndex].isOn = true
            dataModel.alarmList[dataModel.editAlarmIndex].orderStamp = stamp
            dataModel.sortList()
            dataModel.alarmListChanged()
            closeClicked()
        }
    }
}
