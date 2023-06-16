import QtQuick 2.0
import Felgo 3.0

EntityBase {
    id: monster
    entityType: "monster" // required for removing all of these entities when the game is lost
    property alias monsterImage: monsterImage
    property int health: 3
    //rotation: 270
    MultiResolutionImage {
        id: monsterImage
        source: "../../assets/img/enemy.png"/*
        property list<Item> imagePoints: [
            // this imagePoint can be used for creation of the rocket
            // it must be far enough in front of the car that they don't collide upon creation
            // the +30 might have to be adapted if the size of the rocket is changed
            Item {x: monsterImage.width/2+30}
        ]*/
    }

    x: utils.generateRandomValueBetween(monsterImage.width, scene.width - monsterImage.implicitWidth)

    NumberAnimation on y {
        //from: -monsterImage.height // move the monster to the left side of the screen
        from: 0
        to: scene.height // start at the right side

        duration: utils.generateRandomValueBetween(3000, 5000) // vary animation duration between 2-4 seconds for the 480 px scene width
        onStopped: {
            console.debug("monster reached base - change to gameover scene because the player lost")
            // changeToGameOverScene(false)
        }
    }


    BoxCollider {
        id:boxCollider

        anchors.fill: monsterImage // make the collider as big as the image
        collisionTestingOnlyMode: true // use Box2D only for collision detection, move the entity with the NumberAnimation above
        fixture.onBeginContact: {


            // if the collided type was a projectile, both can be destroyed and the player gets a point
            var collidedEntity = other.getBody().target
            console.debug("collided with entity", collidedEntity.entityType)
            // monsters could also collide with other monsters because they have a random speed - alternatively, collider categories could be used
            if(collidedEntity.entityType === "rocket") {

                health--;
                //monstersDestroyed++
                // remove the projectile entity

                collisionParticleEffect.start()

                collidedEntity.removeEntity()
                if(health==0){
                    // remove the monster
                    //monsterImage.source="../../assets/img/enemyAmmoExplo00.png"
                    collisionSound.play()
                    monster.removeEntity()
                }
            }
            if(collidedEntity.entityType === "plane") {

                collisionSound.play()
                collisionParticleEffect.start()
                // remove the monster
                monster.removeEntity()
            }
            if(collidedEntity.entityType === "wall") {
                // remove the monster
                monster.removeEntity()
            }
        }
        SoundEffect {
          id: collisionSound
          //source: "../../assets/img/snd/boxCollision.wav"
          source: "../../assets/wav/exploPop.wav"
        }

        Particle {
          id: collisionParticleEffect
          // make the particles float independent from the entity position - this would be the default setting, but for making it clear it is added explicitly here as well
          positionType: 0
          //fileName: "../../assets/particle/j1.json"
          fileName: "../../assets/particle/SmokeParticle.json"//fileName: "../../assets/particle/SmokeParticle.json"
          //fileName: "../assets/snd/boxCollision.wav"
        }



    }// BoxCollider
    /*

    Timer {
        running: true//scene.visible == true && splashFinished // only enable the creation timer, when the gameScene is visible
        repeat: true
        interval: 1000 // a new target(=monster) is spawned every second
        onTriggered:applyForwardImpulse()
    }
    function applyForwardImpulse() {
        var imagePointInWorldCoordinates = mapToItem(level,monsterImage.imagePoints[0].x, monsterImage.imagePoints[0].y)
        //console.debug("imagePointInWorldCoordinates x", imagePointInWorldCoordinates.x, " y:", imagePointInWorldCoordinates.y)

        // create the rocket at the specified position with the rotation of the car that fires it
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Rocket.qml"), {"x": imagePointInWorldCoordinates.x-18, "y": imagePointInWorldCoordinates.y, "rotation": monster.rotation})

        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Rocket.qml"), {"x": imagePointInWorldCoordinates.x+18, "y": imagePointInWorldCoordinates.y, "rotation": monster.rotation})
    }*/
}// EntityBase