// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "./GenerateObject.js" as GO

Rectangle {
    id:mainView
    width: 240
    height: 320
    color: "black"

    focus: true
    Keys.onPressed: {
        if(event.key == Qt.Key_Asterisk) {
            console.log("Pressed *");
            var obj = GO.createObject(mainView,"StatusBar.qml",{});
            obj.creationAnimation();
            obj.destroyAnimation(obj);
        }
    }
    Component.onCompleted: {
        GO.createObject(mainView,"MenuBar.qml",{});
    }
}
