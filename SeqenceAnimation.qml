// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 240
    height: 320
    color: "black"

    Rectangle {
        id:ball
        width: parent.width/4; height: width; radius: width;
        x:0; y:0;
        color: "magenta"
        smooth: true

        SequentialAnimation {
//        ParallelAnimation {
            id: bounce

            SmoothedAnimation{
                property: "x"; target: ball; velocity: 200;
                to:240-ball.width; //easing.type: Easing.OutBounce;
                reversingMode: SmoothedAnimation.Immediate;
            }
            SmoothedAnimation {
                property: "y"; target: ball; velocity: 200;
                to:320-ball.width; //easing.type: Easing.OutBounce;
                reversingMode: SmoothedAnimation.Immediate;
            }

//            PropertyAnimation{
//                property: "x"; target: ball; //velocity: 200;
//                to:240-ball.width; easing.type: Easing.OutBounce;
//                duration: 1000;
//            }
//            PropertyAnimation {
//                property: "y"; target: ball; //velocity: 200;
//                to:320-ball.width; easing.type: Easing.OutBounce;
//                duration: 1000;
//            }
        }
    }

    Button {
        id:button
        anchors.centerIn: parent
        color: "lightgreen"; opacity: 0.5;

        MouseArea {
            anchors.fill: parent
            onClicked: bounce.start()
        }
    }
}
