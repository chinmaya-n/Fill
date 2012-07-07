// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: container
    width: 240
    height: 320
    color: "#2aa2dd"

    border.color: "#2fe9ec"
    smooth: true

    Rectangle {
        id: coin
        width: 50
        height: 50
        color: "#140a0a"
        radius: 14
        smooth: true
        border.width: 2
        border.color: "#55ff00"
    }
    Rectangle {
        id: container2
        width: 100; height: 100;
        color: "green"
        anchors.right: parent.right; anchors.bottom: parent.bottom;

        Behavior on width {
            PropertyAnimation { duration: 4000; easing.type: Easing.InOutElastic;}
        }
        Behavior on height {
            PropertyAnimation { duration: 4000; easing.type: Easing.OutBounce;}
        }
    }

    states: State {
        name: "state1"
        PropertyChanges {
            target: container
//            border.width: 3
            color: "pink"
        }
        PropertyChanges {
            target: container2
            width: container2.width*2
            height: container2.height*2
        }
        AnchorChanges {
            target: coin
            anchors.right: parent.right
        }
        ParentChange {
            target: coin
            parent: container2
        }
    }

    transitions: [
        Transition {
            to: "state1"
            AnchorAnimation { duration: 3000; easing.type: Easing.OutBounce; }
            ParentAnimation { }
            SequentialAnimation {
                NumberAnimation { target: container; property: "border.width"; easing.type: Easing.OutBounce; to: width/2; duration: 3000 }
                NumberAnimation { target: container; property: "border.width"; easing.type: Easing.OutBounce; to: 3; duration: 3000 }
            }
        }
    ]

    Behavior on color {
        ColorAnimation { target: container; easing.type: Easing.InOutBounce; duration: 3000 }
    }

    Component.onCompleted: container.state = "state1"
}
