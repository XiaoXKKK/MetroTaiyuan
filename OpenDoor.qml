import QtQuick 2.0

Item {
    property int ifBad: 0

    Item {
        id: good
        visible: !ifBad
        AnimatedImage {
            id: opendoorl
            x: 50; y: 120
            height: 187
            width: 120
            //scale: 2
            source: "Images/tts-opendoorl.gif"
        }

        AnimatedImage {
            id: opendoorr
            x: 175; y: 120
            height: 187
            width: 120
            source: "Images/tts-opendoorr.gif"
        }

        HorizontalText{
            id: dooropen
            x: 500
            y: 200

            chineseText: "本侧开门"
            englishText: "Doors open at this side"
            chineseFontSize: 35
            englishFontSize: 20
        }
    }

    Item {
        id:bad
        visible: ifBad
        AnimatedImage {
            id: baddoor
            x: 50; y: 120
            height: 187
            width: 217
            //scale: 2
            source: "Images/failuredoor.png"
        }

        HorizontalText{
            id: badopen
            x: 500
            y: 200
            mycolor: "red"
            chineseText: "此门故障，请从其他门下车"
            //空格和换行不能变
            englishText: "       This door is failure.
Please alight at the other doors"
            chineseFontSize: 25
            englishFontSize: 20
        }
    }
}
