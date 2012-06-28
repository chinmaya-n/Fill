// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    width: 240
    height: 320
    color: "black"

    ListModel {
        id:contactListModel
        ListElement { name:"Ali"; number:"234567"; image: "1.png"}
        ListElement { name:"Bunny"; number:"234535" ; image: "2.png"}
        ListElement { name:"Charan"; number:"234569" ; image: "3.png"}
        ListElement { name:"Dhanush"; number:"234529" ; image: "4.png"}
        ListElement { name:"Eeshwar"; number:"234517" ; image: "5.png"}
        ListElement { name:"Firoz"; number:"234557" ; image: "6.png"}
        ListElement { name:"Gajini"; number:"234167" ; image: "7.png"}
        ListElement { name:"Hanuman"; number:"234335"; image: "8.png"}
        ListElement { name:"Imran"; number:"234769"; image: "9.png"}
        ListElement { name:"Jhony"; number:"234329"; image: "1.png"}
        ListElement { name:"Kishore"; number:"234587"; image: "2.png"}
        ListElement { name:"Lakshmi"; number:"234357"; image: "3.png"}
    }
    Component {
        id:contactDeligate
        Column {
            Image {
                id:contactImage
                width:contactGrid.cellWidth;
                height: contactGrid.cellHeight-contactName.height;

                transform: Scale { origin.x: width/2; origin.y: height/2 ; xScale: 0.75; yScale: 0.75}
                fillMode: Image.PreserveAspectCrop
                source: "./images/"+image
                smooth: true
            }
            Text {
                id: contactName;
                anchors.top: contactImage.bottom
                anchors.horizontalCenter: contactImage.horizontalCenter

                text: name
                color: "#EAEAEA"
            }
        }
    }
    GridView {
        id:contactGrid
        width: parent.width
        height: parent.height
        cellWidth: width/3
        cellHeight: cellWidth

        model: contactListModel
        delegate: contactDeligate

        focus: true
        highlight: Rectangle {
            width: contactGrid.cellWidth
            height: contactGrid.cellHeight
            radius: 20
            color: "blue"
            opacity: 0.5
        }
        highlightFollowsCurrentItem: true
        highlightMoveDuration: 500
    }
}
