// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 240
    height: 320

    VisualDataModel {
        id: visualDataModel
        model: ListModel {
            ListElement { name:"Aanand"; age: 20 }
            ListElement { name:"Manideep"; age: 22 }
        }
        delegate: Column {
            Text { text: name+" is "+age }
        }
    }
    ListView {
        anchors.fill: parent
        model: visualDataModel
    }

//    XmlListModel {
//        id:xmlModel
//        source: "./XML/list.xml"
//        query: "/list/person/"

//        XmlRole { name: "name"; query: "name/string()"}
//        XmlRole { name: "age"; query: "age/string()"}
//    }
//    ListView {
//        width: parent.width; height: 200
//        model: xmlModel
//        delegate: Text { text: name + ":" + query}
//    }
}
