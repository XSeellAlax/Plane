import QtQuick 2.0
import Felgo 3.0
import "../scene"
EntityBase {
    id: props
    entityType: "props" // required for removing all of these entities when the game is lost
    //property alias monsterImage: propsImage
    //property int health: 6
    //rotation: 270
    property alias propsImage: propsImage

    property alias boxContol: boxCollider
    width: 50
    height: 50
    MultiResolutionImage {
        id: propsImage
        anchors.fill: parent
    }

    x: utils.generateRandomValueBetween(propsImage.width, scene.width - propsImage.width-20)

    NumberAnimation on y {
        //from: -monsterImage.height // move the monster to the left side of the screen
        from: 0
        to: scene.height // start at the right side

        duration: utils.generateRandomValueBetween(5000, 8000) // vary animation duration between 2-4 seconds for the 480 px scene width
        onStopped: {
            console.debug("props reached base - change to gameover scene because the player lost")
            // changeToGameOverScene(false)
        }
    }



    BoxCollider {//
        id:boxCollider

        anchors.fill: parent // make the collider as big as the image
        collisionTestingOnlyMode: true // use Box2D only for collision detection, move the entity with the NumberAnimation above
        fixture.onBeginContact: {

            // if the collided type was a projectile, both can be destroyed and the player gets a point
            var collidedEntity = other.getBody().target
            console.debug("collided with entity", collidedEntity.entityType)
            // monsters could also collide with other monsters because they have a random speed - alternatively, collider categories could be used

            if(collidedEntity.entityType === "plane") {

                collisionSound.play()

               // collisionParticleEffect.start()
                // remove the props
                props.removeEntity()
            }
            if(collidedEntity.entityType === "wall") {
                // remove the props
                props.removeEntity()
            }
        }
        SoundEffect {
          id: collisionSound
          source: "../../assets/wav/props.wav"
        }

    }


    SpriteSequence {
        id: sprites
        width: 90
        height: 90
        anchors.centerIn: propsImage
        visible: false

}
}
