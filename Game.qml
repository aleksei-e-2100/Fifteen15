import QtQuick
import QtQuick.Layouts
import controls

Rectangle {
    id: game
    color: "white"
    anchors.fill: parent

    GameControl {
        id: gameControl
    }

    Rectangle {
        id: playField
        width: parent.width
        height: width
        radius: 8
        anchors.top: parent.top
        color: "gray"

        border {
            width: 3
            color: "black"
        }

        GridLayout {
            id: gridLayout
            columns: 4
            rows: 4
            columnSpacing: 4
            rowSpacing: 4

            anchors {
                fill: parent
                topMargin: rowSpacing + parent.border.width
                bottomMargin: rowSpacing + parent.border.width
                leftMargin: columnSpacing + parent.border.width
                rightMargin: columnSpacing + parent.border.width
            }

            Repeater {
                id: squaresSet
                model: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]

                Rectangle {
                    id: square
                    color: "darkblue"
                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    radius: 8
                    Layout.row: gameControl.row(modelData)
                    Layout.column: gameControl.column(modelData)

                    border {
                        width: 2
                        color: "black"
                    }

                    Text {
                        text: modelData
                        anchors.centerIn: parent
                        font.pixelSize: parent.width / 3
                        color: "white"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            let isMoved = gameControl.relocate(modelData)

                            squaresSet.itemAt(modelData - 1).Layout.row =
                                    gameControl.row(modelData)

                            squaresSet.itemAt(modelData - 1).Layout.column =
                                    gameControl.column(modelData)

                            if (isMoved && soundIsPlaying)
                                soundPlayer.play()
                        }
                    }
                }
            }
        }
    }

    Rectangle {
        id: buttonShuffle
        width: playField.width / 2
        height: width / 4
        radius: 8
        color: "darkgreen"

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: playField.bottom
            topMargin: height
        }

        Text {
            text: "Перемешать"
            color: "white"
            anchors.centerIn: parent
            font.pixelSize: parent.width / 12
        }

        MouseArea {
            anchors.fill: parent

            onClicked: {
                gameControl.shuffle()

                for (let i = 0; i < 15; ++i)
                {
                    squaresSet.itemAt(i).Layout.row =
                            gameControl.row(i + 1)

                    squaresSet.itemAt(i).Layout.column =
                            gameControl.column(i + 1)
                }
            }
        }
    }
}
