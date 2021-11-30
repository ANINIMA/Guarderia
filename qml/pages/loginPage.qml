import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    width: 1420
    height: 838
    clip: false

    Image {
        id: image
        x: 0
        y: 0
        width: 1420
        height: 838
        source: "../../images/images/fondo.png"
        fillMode: Image.PreserveAspectFit

        Rectangle {
            id: rectangle
            width: 430
            height: 530
            color: "#2f3136"
            radius: 30
            border.color: "#aba5d9"
            border.width: 3
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            BorderImage {
                id: borderImage
                x: 165
                y: 57
                width: 100
                height: 100
                source: "../../images/images/guarderia_simbol.png"
            }

            TextField {
                id: textField
                x: 107
                y: 245
                font.pointSize: 15
                placeholderText: qsTr("")
            }

            Text {
                id: text2
                x: 107
                y: 218
                color: "#ffffff"
                text: qsTr("Usuario")
                font.pixelSize: 17
            }
        }

        Rectangle {
            id: rectangle1
            x: 340
            y: 8
            width: 741
            height: 62
            color: "#aba5d9"
            radius: 23

            Text {
                id: text1
                x: 8
                y: 16
                width: 725
                height: 30
                color: "#ffffff"
                text: qsTr("Error Usuario o Contraseña incorreta")
                font.pixelSize: 19
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:3}D{i:4}D{i:5}D{i:2}D{i:7}D{i:6}D{i:1}
}
##^##*/
