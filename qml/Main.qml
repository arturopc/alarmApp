import Felgo 3.0
import QtQuick 2.0
import "model"
import "pages"


App {
    onInitTheme: {
        Theme.colors.backgroundColor = "#2E2E3A"
        Theme.colors.textColor = "#FFFCF7"
        Theme.colors.secondaryBackgroundColor = "#2E2E3A"

        //Bottom Bar
        Theme.navigationTabBar.backgroundColor = "#2E2E3A"
        Theme.navigationTabBar.dividerColor = "#2E2E3A"
        Theme.navigationTabBar.titleColor = "#FFFCF7"
        Theme.navigationTabBar.titleDisabledColor = "#868683"
        Theme.navigationTabBar.textSize = 10
        Theme.navigationTabBar.iconSize = 20

        //Top Bar
        Theme.navigationBar.backgroundColor = "#2E2E3A"
        Theme.navigationBar.titleTextFont = "Helvetica"
        Theme.navigationBar.titleColor = "#FFFCF7"
        Theme.navigationBar.dividerColor = "#2E2E3A"
        Theme.navigationBar.titleTextSize = 25

        //List Page Elements
        Theme.listItem.backgroundColor = "#2E2E3A"
        Theme.listItem.dividerColor = "#2E2E3A"
        Theme.listItem.activeBackgroundColor = "#EC9A29"
        Theme.listItem.fontSizeText = 45
        Theme.listItem.iconSize = 0

        //App Button
        Theme.appButton.backgroundColor = "#EC9A29"
        Theme.appButton.borderColor = "#FFFCF7"
        Theme.appButton.textColor = "#FFFCF7"
    }

    // model
    DataModel {
        id: dataModel
    }

    //Add Alarm Overlay
    AppOverlay {
        id: addAlarmOverlay
        sourceItem: addOverlayComponent
        onOpening: item.closeClicked.connect(addAlarmOverlay.close)
    }

    Component {
        id: addOverlayComponent
        AddAlarmOverlay {
            id: item
            anchors.centerIn: parent
        }
    }

    //Update Alarm Overlay
    AppOverlay {
        id: updateAlarmOverlay
        sourceItem: updateOverlayComponent
        onOpening: {
            item.setInitialTime(dataModel.editAlarmStartHours, dataModel.editAlarmStartMinutes)
            item.closeClicked.connect(updateAlarmOverlay.close)
        }
    }

    Component {
        id: updateOverlayComponent
        UpdateAlarmOverlay {
            id: item
            anchors.centerIn: parent
        }
    }

    // view
    Navigation {
        id: navigation

        navigationMode: navigationModeTabs

        NavigationItem {
            title: "Alarm"
            icon: IconType.bello

            NavigationStack {
                Page {
                    title: "Alarm"
                    rightBarItem: IconButtonBarItem {
                        icon: IconType.plus
                        color: "#FFFCF7"
                        onClicked: {
                            addAlarmOverlay.open()
                        }
                    }

                    AlarmPage {
                       anchors.fill: parent
                    }
                }
            }
        }

        NavigationItem {
            title: "Clock"
            icon: IconType.clocko

            NavigationStack {
                Page {
                    title: "Clock"
                    ClockPage {
                        anchors.fill: parent
                    }
                }
            }
        }

        NavigationItem {
            title: "Stopwatch"
            icon: IconType.dashboard

            NavigationStack {
                Page {
                    title: "Stopwatch"
                    StopWatchPage {
                        anchors.fill: parent
                    }
                }
            }
        }
    }
}
