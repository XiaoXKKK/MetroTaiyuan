import QtQuick 2.0

Item {
    property string chineseText1: "桃园路站"
    property string englishText1: "Taoyuan Road Station"
    property string chineseText2: "大南门站"
    property string englishText2: "Da Nan Men Station"
    property string chineseText3: "柳巷南站"
    property string englishText3: "Liuxiang South Station"

    Rectangle{
        id:box
        opacity:0.2
        x:720
        y:100
        width:1100
        height:250
        radius:25
    }

    //第一个站
    HorizontalText{
        x: 900
        y: 210
        mycolor: "gray"
        chineseText: chineseText1
        englishText: englishText1
        chineseFontSize: 28
        englishFontSize: 10
    }

    AnimatedImage {
        x: 1025; y: 195
        source: "Images/local_arrowr.gif"
    }

    //第二个站
    HorizontalText{
        x: 1290
        y: 200
        mycolor: "black"
        chineseText: chineseText2
        englishText: englishText2
        chineseFontSize: 50
        englishFontSize: 20
    }

    AnimatedImage {
        x: 1480; y: 195
        source: "Images/local_arrowr.gif"
    }

    //第三个站
    HorizontalText{
        x: 1675
        y: 210
        mycolor: "black"
        chineseText: chineseText3
        englishText: englishText3
        chineseFontSize: 28
        englishFontSize: 10
    }

}
