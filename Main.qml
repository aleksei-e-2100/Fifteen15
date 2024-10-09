import QtQuick
import QtQuick.Layouts
import QtMultimedia

Window {
    id: screen
    color: "white"
    width: 450
    height: 800
    visible: true

    property bool musicIsPlaying: false
    property bool soundIsPlaying: true

    MediaPlayer {
        id: musicPlayer

        audioOutput: AudioOutput {}
        source: "Sounds/Funky-Chase.mp3"

        Component.onCompleted: {
            if (screen.musicIsPlaying)
                play()
        }

        onPlaybackStateChanged: {
            if (screen.musicIsPlaying)
                play()
        }
    }

    MediaPlayer {
        id: soundPlayer

        audioOutput: AudioOutput {}
        source: "Sounds/Click.mp3"
    }

    Text {
        id: appAuthorlabel
        text: "iCE && tEA"
        color: "black"
        font.pixelSize: parent.width / 18

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
            topMargin: screen.height / 20
        }
    }

    Text {
        id: appNameLabel
        text: "Пятнашки"
        color: "darkblue"

        font {
            pixelSize: parent.width / 10
            bold: true
        }

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: appAuthorlabel.bottom
        }

    }

    Rectangle {
        id: appPage
        width: parent.width - 20

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: appNameLabel.bottom
            topMargin: screen.height / 25
            bottom: appButtons.top
        }

        Game {
            id: pageGame
            visible: true
        }

        Settings {
            id: pageSettings
            visible: false
        }

        Credits {
            id: pageCredits
            visible: false
        }
    }

    Rectangle {
        id: appButtons
        width: parent.width
        height: parent.width / 4

        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: height / 12
        }

        RowLayout {
            id: rowLayout
            anchors.fill: parent
            spacing: 0

            Rectangle {
                id: buttonGame
                color: "white"
                Layout.fillHeight: true
                Layout.fillWidth: true

                Image {
                    id: imageGame
                    anchors.centerIn: parent
                    height: parent.height - parent.height / 3
                    fillMode: Image.PreserveAspectFit
                    source: "Images/game.png"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        pageGame.visible = true
                        pageSettings.visible = false
                        pageCredits.visible = false
                    }
                }
            }

            Rectangle {
                id: buttonSettings
                color: "white"
                Layout.fillHeight: true
                Layout.fillWidth: true

                Image {
                    id: imageSettings
                    anchors.centerIn: parent
                    height: parent.height - parent.height / 1.8
                    fillMode: Image.PreserveAspectFit
                    source: "Images/settings.png"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        pageGame.visible = false
                        pageSettings.visible = true
                        pageCredits.visible = false
                    }
                }
            }

            Rectangle {
                id: buttonCredits
                color: "white"
                Layout.fillHeight: true
                Layout.fillWidth: true

                Image {
                    id: imageCredits
                    anchors.centerIn: parent
                    height: parent.height - parent.height / 2
                    fillMode: Image.PreserveAspectFit
                    source: "Images/info.png"
                }

                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        pageGame.visible = false
                        pageSettings.visible = false
                        pageCredits.visible = true
                    }
                }
            }
        }
    }
}
