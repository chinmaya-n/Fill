// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 360
    height: 360

    ListModel {
        id:namesModel
        ListElement {
            name: "Ram"
            age: 25
            town: "Hyderabad"
        }
        ListElement {
            name: "Shyam"
            age: 23
            town: "Mumbai"
        }
        ListElement {
            name: "Venkat"
            age: 23
            town: "Chennai"
        }
    }

    Component {
        id:namesDeligate
//        Column {
//            height: element.height
//            spacing: 30
            Rectangle {
                id:element
                height: info.height+10
                Text { id:info; text: name + " ; " + age + " ; " + town; anchors.verticalCenter: parent.verticalCenter;}
            }
//        }
    }

    ListView {
        anchors.fill: parent
        model: namesModel
        delegate: namesDeligate
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
//            Qt.quit();
            namesModel.append({"name":"Deva", "age": 28, "town": "kadiri" });
            namesModel.remove(2);
            console.log(namesModel.get(1).name);
            namesModel.append({"name": namesModel.get(2).name,
                                  "age": namesModel.get(2).age,
                                  "town": namesModel.get(2).town});
            namesModel.insert(1, {"name": "Ravi", "age": 25, "town": "Kadiri"});
            namesModel.move(1,namesModel.count-2,2);
            namesModel.set(4,{"age":30});
            namesModel.setProperty(1,"town","Bangalore");
            namesModel.sync();
        }
    }
}
