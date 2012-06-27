// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 240
    height: 320
    color: "black"

    ListModel {
        id:contactListModel
        ListElement { name:"Ali"; number:"234567" }
        ListElement { name:"Bunny"; number:"234535" }
        ListElement { name:"Charan"; number:"234569" }
        ListElement { name:"Dhoni"; number:"234529" }
        ListElement { name:"Eeshwar"; number:"234517" }
        ListElement { name:"Firoz"; number:"234557" }
        ListElement { name:"Gajini"; number:"234167" }
        ListElement { name:"Hanuman"; number:"234335" }
        ListElement { name:"Imran"; number:"234769" }
        ListElement { name:"Jhony"; number:"234329" }
        ListElement { name:"Kishore"; number:"234587" }
        ListElement { name:"Lakshmi"; number:"234357" }
    }
    Component {
        id:contactDelegate
        Rectangle {
            height: contactName.height+contactNumber.height
            width: parent.width
            color: "transparent"

            Text { id: contactName; text:name; color:"#EAEAEA"}
            Text { id: contactNumber; text: number; anchors.top: contactName.bottom; color:"#FAFAFA"}
        }
    }
    ListView {
        id:contactList
        spacing: 5
        anchors.fill: parent

        model: contactListModel
        delegate: contactDelegate
        //header
        header: Rectangle {
            width: contactList.width
            height: 30
            color: "grey"
            Text { text:"ContactList"; color:"#EAEAEA"; anchors.centerIn: parent;}
        }
        footer: Rectangle {
            width: contactList.width
            height: 30
            color: "grey"
            Text { text:"END"; color:"#EAEAEA"; anchors.centerIn: parent;}
        }

        focus: true
        smooth: true
        highlight: Rectangle {
            width: parent.width
            height: contactDelegate.height
            color: "blue"
            opacity: 0.5
        }
        highlightFollowsCurrentItem: true
        highlightMoveDuration: 500
        highlightMoveSpeed: 10
//        preferredHighlightBegin: 180
//        preferredHighlightEnd: 180
//        highlightRangeMode: ListView.ApplyRange
//        high
    }

    focus: true
    Keys.onPressed: {
        if(event.key === Qt.Key_0) {
            console.log(contactList.count);
            console.log(contactList.currentItem);
            console.log(contactList.currentIndex);
            event.accepted = true;
        }
    }
}
