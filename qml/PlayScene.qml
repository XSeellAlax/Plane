/*
fuction: the scene of the game
author: zouyujie
date: 2023.6.13
*/
import QtQuick 2.0
import Felgo 3.0
import "entities"
import "scene"
//the following causes Android to not run
//import "common"

// EMPTY SCENE

SceneBase {
    id: scene
    property alias myPlane: level.myPlane
    property alias myPlaneAnimation: m_myPlaneAnimation
    property alias levelContral: level
    property alias map: map

    EntityManager {
        id: entityManager
        entityContainer: level

    }

    width: map.picture.width
    height: map.picture.height
    //clip: true

    //background
    Map { id: map; anchors.fill: scene.gameWindowAnchorItem }
    //myPlane
    //MultiResolutionImage { id: m_myPlane; source: "../assets/img/hero2.png"; anchors.horizontalCenter: parent.horizontalCenter; y: parent.height+360 }


    //Animation myPlane
    NumberAnimation { id: m_myPlaneAnimation; property: "y"; easing.type: Easing.InOutBack; target: level.myPlane; to: map.picture.height - 88; duration: 1800; running: false }

    PhysicsWorld {
        id: world
        updatesPerSecondForPhysics: 60
        //debugDrawVisible: true
    }

    Level {
        id:level
    }
    focus: true
    // forward the input keys to both players
    Keys.forwardTo: [level.myPlane.controller]
}
