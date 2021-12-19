import QtQuick 2.0
import Felgo 3.0

Item {
    /**********ALARM***********/
    property string editAlarmStartHours
    property string editAlarmStartMinutes
    property int editAlarmIndex
    signal updateAlarmClick(var timeSelected)

    onUpdateAlarmClick: {
        let time = timeSelected.split(":")
        editAlarmStartHours = formatAlarmTime(time[0])
        editAlarmStartMinutes = formatAlarmTime(time[1])
    }

    property var alarmList: []

    function formatAlarmTime(timeString) {
        if (timeString < 10) {
            return "0" + timeString
        }

        return timeString
    }

    function sortList() {
        alarmList.sort((a,b) => { return parseInt(a.orderStamp) - parseInt(b.orderStamp) })
    }

    /**********StopWatch***********/
    function formatStopWatchTime(milliseconds) {
        let hours = Math.floor(milliseconds / 3600000)
        let minutes = Math.floor((milliseconds % 3600000) / 60000)
        let seconds = Math.floor((milliseconds % 60000) / 1000)
        let hundreth = Math.floor((milliseconds % 1000) / 100)

        let result

        if (hours > 0) {
            result = formatAlarmTime(hours) + ":" + formatAlarmTime(minutes) + ":" + formatAlarmTime(seconds) + ":" + formatAlarmTime(hundreth)
        } else {
            result = formatAlarmTime(minutes) + ":" + formatAlarmTime(seconds) + ":" + formatAlarmTime(hundreth)
        }

        return result
    }
}
