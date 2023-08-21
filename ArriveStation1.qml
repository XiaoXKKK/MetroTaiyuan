import QtQuick 2.0

Item {
    Rectangle{
        id:box
        opacity:0.2
        x:800
        y:100
        width:1050
        height:225
        radius:25
    }

    HorizontalText{
        id: start
        x: 1100
        y: 172
        chineseText: "大南门站"
        englishText: "Da Nan Men Station"
        chineseFontSize: 80
        englishFontSize: 35
    }

    AnimatedImage {
        id: rightPic1
        x: 1480; y: 180
        source: "Images/changepic.png"
    }

    AnimatedImage {
        id: rightPic2
        x: 1580; y: 162
        source: "Images/changeline2.png"
    }
}
