import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.4

ListPage {
    model: dataModel.alarmList
    listView.delegate: SimpleRow {
        MouseArea {
            anchors.fill: parent
            onClicked: {
                dataModel.updateAlarmClick(item.text)
                dataModel.editAlarmIndex = index
                updateAlarmOverlay.open()
            }
        }

        AlarmCheck {
            anchors.right: parent.right
            anchors.rightMargin: dp(20)
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
