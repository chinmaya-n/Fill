// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: popupBackground
    property int textHeight: 0;
    property QtObject object: null
    width: parent.width; height: parent.height;
//    width: 240; height: 320;    //For testing purpose only
    color: "skyblue"; opacity: 0;
    smooth: true;

    Rectangle {
        id: popup
        width: parent.width*0.6; height: popupList.height;
        radius: 5
        anchors.centerIn: parent
        color: "transparent"
        gradient: Gradient {
            GradientStop {
                position: 0.00;
                color: "#eaeaea";
            }
            GradientStop {
                position: 0.84;
                color: "#fafafa";
            }
        }

        ListModel {
            id:popupListModel

            ListElement {item: "Delete" }
            ListElement {item: "Mark" }
            ListElement {item: "Move" }
            ListElement {item: "Help" }
        }
        Component{
            id:popupDelegate
            Column {
                id:popupColumn
                width: parent.width


                    Text {
                        id:itemText
                        width: popup.width
                        text: item
                        color: "green"
                        font.bold: true
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    Component.onCompleted: {
                        popupBackground.textHeight = itemText.height;
                    }
            }
        }
        ListView {
            id: popupList
            width: parent.width; height: (popupListModel.count)*popupBackground.textHeight;

            model: popupListModel
            delegate: popupDelegate
        }
    }

    focus: true
    Keys.onPressed: {
        if(event.key == Qt.Key_Escape) {
            console.log("destroying");
            destroyAnimation(popupBackground.object);
        }
    }

    NumberAnimation {
        id: creation; target: popupBackground;
        property: "opacity"; duration: 500;
        from: 0; to: 0.6; easing.type: Easing.InOutQuad
    }
    NumberAnimation {
        id: destroy; target: popupBackground;
        property: "opacity"; duration: 1000;
        to: 0; easing.type: Easing.InOutQuad
    }
    function creationAnimation(obj) {
        creation.start();
        popupBackground.object = obj;
    }
    function destroyAnimation(obj) {
        destroy.start();
        obj.destroy();
    }
}


