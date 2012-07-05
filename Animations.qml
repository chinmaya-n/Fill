// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 240
    height: 320
//    color:"black"

    property bool isDown: false

    Rectangle {
        id:circle
        width: parent.width/3
        height: width
        radius: width
        color: "#9f205b"
        border.color: "yellow"
        border.width: 1
        smooth: true

//        anchors.horizontalCenter: parent.horizontalCenter

//        SequentialAnimation {
////        ParallelAnimation {
//            id: bounce
//            PropertyAnimation {
//                property: y
//                duration: 3000;
//                to: 240
//                easing.type: Easing.OutBounce;
//            }
//            PropertyAnimation {
//                property: x
//                duration: 3000;
//                to: 160
//                easing.type: Easing.OutBounce;
//            }
//        }

        Behavior on y {
            PropertyAnimation{
                duration: 3000;
                easing.type: Easing.OutBounce
            }
        }
        Behavior on x {
            PropertyAnimation {
                duration: 3000;
                easing.type: Easing.OutBounce
            }
        }
    }

    Button {
        anchors.centerIn: parent
        color: "green"
        opacity: 0.5
        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("clicked!");

//                For Behavior
                if(!isDown) { circle.y = 240; circle.x = 160; isDown= true}
                else { circle.y = 0; circle.x = 0; isDown=false}

////                For SequentialAnimation
//                bounce.start();
            }
            onPressed: {
                parent.color = "black"
            }
            onReleased: {
                parent.color = "green"
            }
        }
    }
}
