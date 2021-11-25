import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Button {
    id: leftMenu
    width: 70
    height: 50

    // propiedades de personalizacion
    property bool useImage: false
    property int iconWidth: 24
    property int iconHeight: 24
    property color iconColor: "#ABA5D9"
    property color colorEntered: "#FFFFFF"
    property color iconColorEntered: "#FFFFFF"
    property url iconPath: "../../images/images/guarderia_simbol.png"
    property url imagePath: "../../images/images/avatar.png"
    property color bgColor: "#36393f"
    property color bgColorEntered: "#ABA5D9"

    // Fondo del Menu
    background: Item {
        id: item1
        clip: true
        width: 70
        height: 50

        // Left Detail
        Rectangle{
            id: leftDetail
            width: 4
            height: 0
            color: "#ffffff"
            radius: 4
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: -4
          }

        // Set icon or image
        Rectangle{
            id: iconImage
            width: 50
            height: 50
            radius: 25
            color: bgColor
            clip: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            // Icon
            Image{
                id: icon
                anchors.verticalCenter: parent.verticalCenter
                source: iconPath
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.height: iconHeight
                sourceSize.width: iconWidth
                //visible: false
            }

            ColorOverlay{             //quitar coimentario en caso de solo usar .svg
                id: iconOverlay
            //    anchors.fill: icon
            //    source: icon
            //    color: iconColor
            //    antialiasing: true
            }

            Image {
                id: image
                anchors.verticalCenter: parent.verticalCenter
                source: imagePath
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
                sourceSize.height: 50
                sourceSize.width: 50
                visible: useImage

                // Enabled Layer
                layer.enabled: true
                layer.effect: OpacityMask{
                    maskSource: parent
                }
            }
        }
    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true

        // Mouse Entered
        onEntered: {
            bgEntered.running = true
            borderEntered.running = true
            detailEntered.running = true
            detailWidthEntered.running = true
            iconEntered.running = true
        }

        //Mouse Exited
        onExited: {
            bgExited.running = true
            borderExited.running = true
            detailExited.running = true
            detailWidthExited.running = true
            iconExited.running = true
        }
    }

    // BG Color
    PropertyAnimation{
        id: bgEntered
        target: iconImage
        properties: "color"
        to: bgColorEntered
        duration: 150
    }
    PropertyAnimation{
        id: bgExited
        target: iconImage
        properties: "color"
        to: bgColor
        duration: 150
    }

    // Icon Overlay
    PropertyAnimation{
        id: iconEntered
        target: iconOverlay
        properties: "color"
        to: iconColorEntered
        duration: 100
    }

    PropertyAnimation{
        id: iconExited
        target: iconOverlay
        properties: "color"
        to: iconColor
        duration: 100
    }

    // BG border
    PropertyAnimation{
        id: borderEntered
        target: iconImage
        properties: "radius"
        to: 18
        duration: 150
    }
    PropertyAnimation{
        id: borderExited
        target: iconImage
        properties: "radius"
        to: 25
        duration: 150
    }
    // left Detail
    PropertyAnimation{
        id: detailEntered
        target: leftDetail
        properties: "height"
        to: 20
        duration: 200
        easing.type: Easing.OutInCubic
    }
    PropertyAnimation{
        id: detailExited
        target: leftDetail
        properties: "height"
        to: 0
        duration: 200
        easing.type: Easing.OutInCubic
    }
    PropertyAnimation{
        id: detailWidthEntered
        target: leftDetail
        properties: "width"
        to: 8
        duration: 200
        easing.type: Easing.OutInCubic
    }
    PropertyAnimation{
        id: detailWidthExited
        target: leftDetail
        properties: "width"
        to: 4
        duration: 200
        easing.type: Easing.OutInCubic
    }
}

/*##^##
Designer {
    D{i:0;formeditorColor:"#4c4e50";height:50;width:70}D{i:8}D{i:9}D{i:10}D{i:11}D{i:12}
D{i:13}D{i:14}D{i:15}D{i:16}D{i:17}D{i:18}
}
##^##*/
