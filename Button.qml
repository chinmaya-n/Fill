// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: button
    width: 100
    height: 62
    color: "transparent"
    border.color: "#EAEAEA"
    radius: 10
    Text {
        id: buttonText
        text: qsTr("Click!")
        anchors.centerIn: parent
    }

    function setText(text) {
        button.buttonText.text = text;
    }
}
