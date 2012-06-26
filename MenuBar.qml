// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
//import "./Button.qml" as Button

Rectangle {
    id: menuBar
    width: parent.width; height: parent.height/15
    color:"#EAEAEA"
    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#fafafa";
        }
        GradientStop {
            position: 1.00;
            color: "#eaeaea";
        }
    }
    smooth: true
    anchors.bottom: parent.bottom

    Row {
        anchors.fill: parent

        Button {
//            Text.text: "Button Left";
            height: parent.height; width: parent.width/2;
            Component.onCompleted: setText("Button Left");
//            onClicked:;
        }
        Button {
//            text: "Button Right";
            height: parent.height; width: parent.width/2
//            anchors.right: parent.right
//            onClicked:;
        }


//        Rectangle {color: "blue"; height: parent.height; width: parent.width/2 }
//        Rectangle {color: "green"; height: parent.height; width: parent.width/2 }
    }
}
