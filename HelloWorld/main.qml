
import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 960
    height: 480
    title: qsTr("Hello World")

    Image {
        id: sitenow
        objectName: "sitenow"
        x: 200
        source: 'Images/sitenow001.png'
    }


    Rectangle{
        width: 200
        height: 100
        Text {
            id: zhtext
            text: "西山矿务局站"
            font.family: "Microsoft YaHei"
            font.pointSize: 20
//            rotation: -90
            anchors.centerIn: parent
        }
        Text{
            text: "XiShan Mining Bureau Station"
            font.pointSize: 10

            anchors.top: zhtext.bottom
            anchors.horizontalCenter: zhtext.horizontalCenter
        }
    }

    Rectangle{
        y: 100
        width: 100
        height: 200
        Text {
            text: "西\n山\n矿\n务\n局\n站"
            font.family: "Microsoft YaHei"
            font.pointSize: 20
            lineHeightMode: Text.FixedHeight
            lineHeight: 24
//
            anchors.left: entext.right
        }
        Text{
            id: entext
            width: 10
            text: "XiShan Mining Bureau Station"
            font.pointSize: 10
            rotation: 90
        }
    }


    Item {
        width: 400
        height: 400

        Component.onCompleted: {
            for (var i = 0; i < 4; i++) {
                var image = Qt.createQmlObject(
                            'import QtQuick 2.0; Image { source: "rail.png"; }'
                            , parent
                            , "dynamicSnippet" + i);
                image.x = i * 100;
                image.y = 400;
            }
        }
    }

}
