import QtQuick 2.6
import Sailfish.Silica 1.0
import io.yaqtlib

AccordionItem {
    name: "privacy"
    title: qsTr("YAST X")
    Component {
        ResponsiveGrid {
            bottomPadding: Theme.paddingMedium
            TextSwitch {
                width: parent.columnWidth
                text: qsTr("Don't show sponsored messages")
                checked: yaqtSettings.sponsoredMess == YaqtSettings.SponsoredMessIgnore || yaqtSettings.sponsoredMess == YaqtSettings.SponsoredMessAutoView
                automaticCheck: false
                onClicked: yaqtSettings.sponsoredMess = checked ? YaqtSettings.SponsoredMessHandle : YaqtSettings.SponsoredMessIgnore
            }
            TextSwitch {
                width: parent.columnWidth
                text: qsTr("Hide other ads")
                checked: yaqtSettings.sponsoredChats != YaqtSettings.SponsoredChatsHandle
                automaticCheck: false
                onClicked: yaqtSettings.sponsoredMess = checked ? YaqtSettings.SponsoredChatsHandle : YaqtSettings.SponsoredChatsIgnore
            }
            TextSwitch {
                width: parent.columnWidth
                text: qsTr("Don't send online")
                checked: appSettings.xDontSendOnline
                automaticCheck: false
                onClicked: appSettings.xDontSendOnline = !checked
            }
            TextSwitch {
                width: parent.columnWidth
                text: qsTr("Don't send typing")
                checked: appSettings.xDontSendTyping
                automaticCheck: false
                onClicked: appSettings.xDontSendTyping = !checked
            }
            TextSwitch {
                width: parent.columnWidth
                text: qsTr("Don't read messages")
                checked: appSettings.xDontReadMessages
                automaticCheck: false
                onClicked: appSettings.xDontReadMessages = !checked
            }
            TextSwitch {
                width: parent.columnWidth
                text: qsTr("Show deleted messages")
                description: qsTr("Coming soon")
                enabled: false
            }
        }
    }
}
