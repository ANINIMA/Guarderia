import QtQuick 2.0

Item {
    width: 1100
    height: 600

    Rectangle {
        id: rectangle
        color: "#36393f"
        anchors.fill: parent

        Rectangle {
            id: left_home_page
            width: 240
            color: "#2f3136"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50";formeditorZoom:0.9}D{i:2}D{i:1}
}
##^##*/
