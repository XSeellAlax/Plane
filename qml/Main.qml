/*
function: main window
author: zouyujie
date: 2023.6.14
*/
import Felgo 3.0
import QtQuick 2.0
import QtQml.Models 2.15
import QtQuick.Controls 2.0
import "scene"
GameWindow {
    id: gameWindow
    property alias gameWindow: gameWindow

    screenHeight: 1280
    screenWidth: 960
    //activeScene: menuScene

    Component.onCompleted: {
        console.log("the mainutem is created!")
        mainItemLoader.source = "./scene/MainItem.qml"

    }

    Loader {
        id: mainItemLoader
    }
}
