import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import my.highscoremodel.singleton 1.0


TableView {

    id : tableView
    anchors.left: parent.left
    anchors.right: parent.right
    backgroundVisible: false
    alternatingRowColors: false


    TableViewColumn {
        role: "place"
        title: "Place"
        width : parent.width / 3.1
    }

      TableViewColumn {
          role: "player"
          title: "Player"
          width : parent.width / 3.1

      }
      TableViewColumn {
          role: "score"
          title: "Score"
          width : parent.width / 3.1

      }
      model: HighScoreModel
      selectionMode : SelectionMode.NoSelection

      style: TableViewStyle {
          backgroundColor: "transparent"

          frame: Rectangle {
                     border{
                         color: "transparent" // color of the border
                     }
                     color : "transparent"
                 }

          rowDelegate: Rectangle {
                  color: "transparent"
                  height: 32
              }

          itemDelegate: Item {
              Text {

                  anchors.verticalCenter: parent.verticalCenter
                  anchors.fill: parent
                  color: "#0095a6"
                  elide: styleData.elideMode
                  text: styleData.value
                  font.pointSize: 20
                  horizontalAlignment: Text.AlignHCenter
                  //horizontalAlignment: styleData.column === 2 ? Text.AlignRight : styleData.textAlignment
                  renderType: Text.QtRendering
              }
          }

                 headerDelegate: Rectangle {
                     height: textItem.implicitHeight * 1.2
                     width: textItem.implicitWidth
                     color: "#0095a6"
                     Text {
                         id: textItem
                         anchors.fill: parent
                         verticalAlignment: Text.AlignVCenter
                         horizontalAlignment: Text.AlignHCenter
                         //horizontalAlignment: styleData.column === 2 ? Text.AlignRight : styleData.textAlignment
                         anchors.leftMargin: 12
                         text: styleData.value
                         font.pointSize: 20
                         elide: Text.ElideRight
                         color: "#01375D"
                         renderType: Text.QtRendering
                     }
                     Rectangle {
                         anchors.right: parent.right
                         anchors.top: parent.top
                         anchors.bottom: parent.bottom
                         anchors.bottomMargin: 1
                         anchors.topMargin: 1
                         width: 1
                         color: "#0095a6"
                     }
                 }
             }

      Component.onCompleted:
      {
          tableView.resizeColumnsToContents()
      }
  }

//ListView {
//    id: highScoreListView

//    delegate:
//        Row {
//            id: row1

//            Text {
//                text: player
//                font.pointSize: 20
//                color: "#01375D"
//                font.bold: true
//                anchors.verticalCenter: parent.verticalCenter
//            }
//            Text {
//                text: score
//                font.pointSize: 20
//                color: "#01375D"
//                font.bold: true
//                anchors.verticalCenter: parent.verticalCenter
//            }
//            spacing: 10
//        }

//    model : HighScoreModel
//}

