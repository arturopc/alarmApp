import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.3

CheckBox {
    style: CheckBoxStyle {
        indicator: Rectangle {
            implicitHeight: 40
            implicitWidth: 40
            radius: implicitHeight / 2
            color: "#868683"
            border.color: "#fffcf7"
            border.width: 4
            Rectangle {
                visible: control.checked
                anchors.fill: parent
                radius: width / 2
                color: "#0E9594"
                border.color: "#fffcf7"
                border.width: 4
            }
        }
    }
    checked: dataModel.alarmList[index].isOn
    onClicked: {
        dataModel.alarmList[index].isOn = !dataModel.alarmList[index].isOn
    }
}
