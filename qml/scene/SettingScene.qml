import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0

// EMPTY SCENE

SceneBase {
    id: scene
    property alias backImageMouseArea: m_backImage.mouseArea
    property int selectMap: 1
    width: 960//bg.width
    height: 960//bg.height

    //background
    //Map { id: map; anchors.fill: scene.gameWindowAnchorItem }
    MultiResolutionImage {
        id: bg;
        anchors.fill: parent;
        source: "../../assets/img/settingbg.jpg"
    }

    /*
     *
     *Stage 1*/
    Text {
        id: stageText1
        text: qsTr("Stage 1")
        y: 130
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Rectangle {
        id: stage1
        width: 100
        height: 100
        x: 480
        y: 100
        MultiResolutionImage {
            id: image
            anchors.fill: parent
            source: "../../assets/img/sceen01.png"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: { stage1.opacity = 0.7 }
            onExited: { stage1.opacity = 1 }
            onClicked: { selectStage1.visible = true; selectStage2.visible = false; selectStage3.visible = false; selectMap = 1 }
        }
    }
    MultiResolutionImage {
        id: selectStage1
        height: 60
        width: 60
        source: "../../assets/img/select.png"
        x: 700
        y: 120
        visible: true
    }
    /*
     *
     *Stage 2*/
    Text {
        id: stageText2
        text: qsTr("Stage 2")
        y: 280
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Rectangle {
        id: stage2
        width: 100
        height: 100
        x: 480
        y: 250
        MultiResolutionImage {
            anchors.fill: parent
            source: "../../assets/img/sceen02.png"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: { stage2.opacity = 0.7 }
            onExited: { stage2.opacity = 1 }
            onClicked: { selectStage1.visible = false; selectStage2.visible = true; selectStage3.visible = false; selectMap = 2 }
        }
    }
    MultiResolutionImage {
        id: selectStage2
        height: 60
        width: 60
        source: "../../assets/img/select.png"
        x: 700
        y: 270
        visible: false
    }
    /*
     *
     *Stage 3*/
    Text {
        id: stageText3
        text: qsTr("Stage 3")
        y: 430
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Rectangle {
        id: stage3
        width: 100
        height: 100
        x: 480
        y: 400
        MultiResolutionImage {
            anchors.fill: parent
            source: "../../assets/img/sceen03.png"
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: { stage3.opacity = 0.7 }
            onExited: { stage3.opacity = 1 }
            onClicked: { selectStage1.visible = false; selectStage2.visible = false; selectStage3.visible = true; selectMap = 3 }
        }
    }
    MultiResolutionImage {
        id: selectStage3
        height: 60
        width: 60
        source: "../../assets/img/select.png"
        x: 700
        y: 420
        visible: false
    }

    /*
     *
     *master volumn*/
    Text {
        id: masterVolumn
        text: qsTr("Volumn")
        y: 550
        x: 200
        color: "white"
        font.pixelSize: 30
    }
    Slider {
        id: volumeSlider
        y: 550
        x: 450
        orientation: Qt.Horizontal
        value: 0.8
    }

    /*
     *
     *back*/
    MultiResolutionImage {
        id: m_backImage
        source: "../../assets/img/back.png"
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - 220

        property alias mouseArea: m_Area
        MouseArea {
            id: m_Area
            anchors.fill: parent
            hoverEnabled: true
            onEntered: { m_backImage.opacity = 0.7 }
            onExited: { m_backImage.opacity = 1 }
        }
    }

}
