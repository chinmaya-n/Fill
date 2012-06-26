// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:statusBar
    width: parent.width
    height: parent.height/10
    color: "#ffffff"
    opacity: 1

    gradient: Gradient {
        GradientStop {
            position: 0.00;
            color: "#ffffff";
        }
        GradientStop {
            position: 0.84;
            color: "transparent";
        }
    }

    NumberAnimation { id:opacity0 ; target: statusBar; property: "opacity";
        duration: 3000; easing.type: Easing.InCirc; from:1; to:0;}
//    NumberAnimation { id: opacity0; target: statusBar; property: "height";
//        duration: 3000; easing.type: Easing.InExpo; from:height; to:0 }
    NumberAnimation { id: heightGener; target: statusBar; property: "height";
        duration: 500; easing.type: Easing.InExpo; from:0; to:height }

    function creationAnimation() {
        heightGener.start();
    }

    function destroyAnimation(object) {
        object.destroy(3000);
        opacity0.start();
    }
}
