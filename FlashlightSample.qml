import QtQuick 2.0
import Ubuntu.Components 0.1
import "components"
import QtMultimedia 5.0

/*!
    \brief MainView with an Image to enable/disable Flashlight
*/

MainView {
    id: root
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "flashlight.batlin"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(100)
    height: units.gu(75)

    property real margins: units.gu(2)
    property real buttonWidth: units.gu(9)



    Page {
        title: i18n.tr("Flashlight")
        Camera {
            id: camera
            flash.mode: Camera.FlashOff
        }

        Column {
            id: pageLayout

            anchors {
                fill: parent
                margins: root.margins
            }
            spacing: units.gu(1)

            MouseArea {
                width: my_background.width
                height: my_background.height
                Image {
                    id: my_background
                    source: "images/flash_off.png"
                }
                onClicked: {
                    if (camera.flash.mode != Camera.FlashTorch){
                        camera.flash.mode = Camera.FlashTorch
                        my_background.source = "images/flash_on.png"
                    } else {
                        camera.flash.mode = Camera.FlashOff
                        my_background.source = "images/flash_off.png"
                    }

                }
            }
        }
    }

}
