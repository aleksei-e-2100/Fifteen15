import QtQuick

Rectangle {
    id: settings
    color: "white"
    anchors.fill: parent

    Row {
        id: musicSettingsRow
        spacing: 10

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }

        Rectangle {
            color: "white"
            width: settings.width / 10
            height: width
            radius: 6

            border {
                width: 2
                color: "darkblue"
            }

            Rectangle {
                id: musicIndicator
                visible: false
                color: "darkgreen"
                width: parent.width - 12
                height: width
                radius: 4
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    musicIndicator.visible = !musicIndicator.visible

                    if (musicIndicator.visible)
                    {
                        musicIsPlaying = true;
                        musicPlayer.play();
                    }
                    else
                    {
                        musicIsPlaying = false;
                        musicPlayer.stop();
                    }
                }
            }
        }

        Text {
            text: "Музыка"
            font.pixelSize: settings.width / 14
            visible: true
        }
    }

    Row {
        spacing: 10

        anchors {
            left: musicSettingsRow.left
            top: musicSettingsRow.bottom
            topMargin: height
        }

        Rectangle {
            color: "white"
            width: settings.width / 10
            height: width
            radius: 6

            border {
                width: 2
                color: "darkblue"
            }

            Rectangle {
                id: soundIndicator
                color: "darkgreen"
                width: parent.width - 12
                height: width
                radius: 4
                anchors.centerIn: parent
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    soundIndicator.visible = !soundIndicator.visible

                    if (soundIndicator.visible)
                    {
                        soundIsPlaying = true;
                    }
                    else
                    {
                        soundIsPlaying = false;
                    }
                }
            }
        }

        Text {
            text: "Звук"
            font.pixelSize: settings.width / 14
            visible: true
        }
    }
}
