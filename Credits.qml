import QtQuick
import QtQuick.Layouts

Rectangle {
    id: info
    color: "white"
    anchors.fill: parent

    Text {
        id: aboutLabel
        text: "Задание по предмету"
        color: "darkblue"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width / 22

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: parent.top
        }
    }

    Text {
        id: aboutText
        text: "Технологии разработки\nприложений\nдля мобильных устройств"
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width / 20

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: aboutLabel.bottom
        }
    }

    Text {
        id: authorLabel
        text: "Автор"
        color: "darkblue"
        font.pixelSize: parent.width / 22

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: aboutText.bottom
            topMargin: height
        }
    }

    Text {
        id: authorText
        text: "Ефименко А.В.\n4ЗбАСУп (МАДИ)\n2024-2025 уч. г."
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        font.pixelSize: parent.width / 20

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: authorLabel.bottom
        }
    }

    Text {
        id: stackLabel
        text: "Стек"
        color: "darkblue"
        font.pixelSize: parent.width / 22

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: authorText.bottom
            topMargin: height
        }
    }

    Image {
        id: stackImage
        width: parent.width / 2
        fillMode: Image.PreserveAspectFit
        source: "Images/stack.png"

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: stackLabel.bottom
            topMargin: height / 5
        }
    }

    Text {
        id: musicLabel
        text: "Источник музыки"
        color: "darkblue"
        font.pixelSize: parent.width / 22

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: stackImage.bottom
            topMargin: height
        }
    }

    Text {
        id: musicText
        text: '<a href="https://audiotrimmer.com/ru/royalty-free-music/">AudioTrimmer</a>'
        onLinkActivated: Qt.openUrlExternally(link)
        font.pixelSize: parent.width / 20

        anchors {
            horizontalCenter: parent.horizontalCenter
            top: musicLabel.bottom
        }
    }
}
