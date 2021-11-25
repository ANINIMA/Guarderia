import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "components"
import QtGraphicalEffects 1.15

Window {
    id: mainWindow
    width: 1440
    height: 880
    visible: true
    color: "#00000000"
    title: qsTr("Guardería Chiquilines Aventureros")


    flags: Qt.Window | Qt.FramelessWindowHint  // quitar la barra de la ventana

    // Propiedades
    property int windowStatus: 0
    property int windowMargin: 10
    property int type_user: 0 // 1 administrador, 2 maestro, 3 padre

    // funciones internas
    QtObject{
        id: internal

        //maximize restore
        function maximizeRestore(){
            if(windowStatus == 0){
                mainWindow.showMaximized()
                windowStatus = 1
                windowMargin = 0
                btnMaximizeRestore.btnIcon = "../images/svg_icons/restore_icon.svg"
            }
            else{
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                btnMaximizeRestore.btnIcon = "../images/svg_icons/maximize_icon.svg"
            }
        }

        // si maximize restore
        function ifMaximizeRestore(){
            if(windowStatus == 1){
                mainWindow.showNormal()
                windowStatus = 0
                windowMargin = 10
                btnMaximizeRestore.btnIcon = "../images/svg_icons/maximize_icon.svg"
            }
        }

        // Restaurar margen
        function restoreMargins(){
            windowStatus = 0
            windowMargin = 10
            btnMaximizeRestore.btnIcon = "../images/svg_icons/maximize_icon.svg"
        }
    }

    Rectangle {
        id: bgApp
        color: "#35383f"
        anchors.fill: parent
        anchors.margins: windowMargin
        z: 1


        Rectangle {
            id: top_bar_app
            height: 22
            color: "#202225"
            anchors.left: left_menu_bar.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.topMargin: 0

            DragHandler{
                onActiveChanged: if(active){
                                     mainWindow.startSystemMove()
                                     internal.ifMaximizeRestore()
                                 }
            }

            Rectangle {
                id: rectangle1
                color: "#00ff867a"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 0
                anchors.topMargin: 0

                MouseArea{
                    anchors.fill: parent
                    onDoubleClicked: {
                        internal.maximizeRestore()
                    }
                }

                Rectangle {
                    id: btnTopContent
                    x: 1260
                    y: 0
                    width: 90
                    height: 22
                    color: "#00ffffff"
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    Row{
                        anchors.fill: parent

                        TopBarButton{
                            id: btnMinimize
                            colorMouseDown: "#2f3136"
                            btnIcon: "../images/svg_icons/minimize_icon.svg"
                            onClicked: {
                                mainWindow.showMinimized()
                                internal.restoreMargins()
                            }
                        }

                        TopBarButton{
                            id: btnMaximizeRestore
                            colorMouseDown: "#2f3136"
                            btnIcon: "../images/svg_icons/maximize_icon.svg"
                            onClicked: {
                                internal.maximizeRestore()
                            }
                        }

                        TopBarButton{
                            id: btnClose
                            colorMouseDown: "#ab0000"
                            colorMouseOver: "#f00000"
                            btnIcon: "../images/svg_icons/close_icon.svg"
                            onClicked: mainWindow.close()
                        }

                    }
                }
            }
        }

        Rectangle {
            id: left_menu_bar
            width: 70
            color: "#202225"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0

            Image {
                id: top_logo
                source: "../images/images/top_logo_180x22.png"
                sourceSize.height: 22
                sourceSize.width: 180
            }

            Column {
                id: columnLeftManu
                anchors.fill: parent
                spacing: 8
                anchors.topMargin: 22

                LeftMenu{
                    useImage: true
                    LeftMenuTooltip{
                        text: "Información Usuario"
                    }
                }

                // Dividimos el Menu
                Rectangle{
                    id: rectangle2
                    width: 70
                    height: 2
                    color: "#00000000"

                    Rectangle{
                        width: 30
                        height: 2
                        color: "#2f3136"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                LeftMenu{
                    visible: if(type_user==0 | type_user == 1){
                                 return true
                             }else{
                                 return false
                             }
                    iconWidth: 40
                    iconHeight: 40
                    iconPath: "../images/images/matricula.png"
                    LeftMenuTooltip{
                        text: "Matricula"
                    }

                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 1){
                                 return true
                             }else{
                                 return false
                             }
                    iconWidth: 45
                    iconHeight: 45
                    iconPath: "../images/images/Profesor.png"
                    LeftMenuTooltip{
                        text: "Docentes"
                    }

                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 1){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/estudiantes.png"
                    iconWidth: 50
                    iconHeight: 50
                    LeftMenuTooltip{
                        text: "Estudiantes"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 1){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/registrar_notas.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Reporte de notas"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 1){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/materias.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Materias"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 1){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/notas_agenda.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Notas Enviadas"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 2){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/registrar_notas.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Registrar notas"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 2){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/tienda.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Vender"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 2){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/pago_mensualidad.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Registrar pago de mensualidad"
                    }
                }
                LeftMenu{
                    visible: if(type_user==0 | type_user == 3){
                                 return true
                             }else{
                                 return false
                             }
                    iconPath: "../images/images/registrar_notas.png"
                    iconWidth: 40
                    iconHeight: 40
                    LeftMenuTooltip{
                        text: "Consultar calificaciones"
                    }
                }

            }
        }

        Rectangle {
            id: top_bar_title_and_user
            height: 48
            color: "#36393f"
            border.color: "#202225"
            anchors.left: left_menu_bar.right
            anchors.right: parent.right
            anchors.top: top_bar_app.bottom
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.leftMargin: 0

            Rectangle {
                id: top_barr_info
                color: "#0036393f"
                border.color: "#002f3136"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.bottomMargin: 1
                anchors.topMargin: 0

                Rectangle {
                    id: top_bar_left
                    width: 240
                    color: "#202225"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Rectangle {
                        id: rectangle
                        color: "#2f3136"
                        radius: 10
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: -10
                        anchors.leftMargin: 0
                        anchors.bottomMargin: -10
                        anchors.topMargin: 0

                        Rectangle {
                            id: rectangle3
                            color: "#00ffffff"
                            anchors.fill: parent
                            width: parent
                            height: parent

                            // Enable Layer
                            layer.enabled: true
                            layer.effect: OpacityMask{
                                maskSource: parent
                            }
                        }
                    }
                }
            }
        }

        Rectangle {
            id: content_area
            color: "#00ffffff"
            anchors.left: left_menu_bar.right
            anchors.right: parent.right
            anchors.top: top_bar_title_and_user.bottom
            anchors.bottom: parent.bottom
            clip: true
            anchors.rightMargin: 0
            anchors.leftMargin: 0
            anchors.bottomMargin: 0
            anchors.topMargin: 0
            

            Loader{
                id: page_loader
                anchors.fill: parent
                source: Qt.resolvedUrl("pages/homePage.qml")
            }
        }
    }

    DropShadow{
        anchors.fill: bgApp
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 12
        color: "#80000000"
        source: bgApp
        z: 0
    }
}


/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:1}D{i:3}D{i:12}D{i:39}D{i:45}D{i:2}D{i:47}
}
##^##*/
