import QtQuick 2.0

Item {
    width: 1920
    height: 80
    Image {
        x: 60
        y: 17
        source: "Images/logo.png"
        asynchronous: true
    }

    HorizontalText{
        id: start
        x: 550
        y: 30
        chineseText: "西山矿务局站"
        englishText: "XiShan Mining Bureau Station"
    }


    AnimatedImage {
        id: arrow
        x: 680; y: 20
        source: "Images/tts-arrowr.gif"
    }


    HorizontalText{
        id: end
        x: 900
        y: 30
        chineseText: "武宿机场站"
        englishText: "Wusu Airport Station"
    }


    HorizontalText{
        id: next
        x: 1100
        y: 30
        chineseText: "下一站:"
        englishText: "Next Station:"
    }

    HorizontalText{
        id: station
        x: 1300
        y: 30
        chineseText: "柳巷南站"
        englishText: "Liuxiang South Station"
    }

    HorizontalText{
        id: dooropen
        x: 1570
        y: 30
        chineseText: "本侧开门"
        englishText: "This door open"
    }

    AnimatedImage {
        id: opendoor
        x: 1665; y:12
        source: "Images/tts-opendoor.gif"
    }

    HorizontalText{
        id: doorid
        x: 1850
        y: 30
        chineseText: "10号门"
        englishText: "No.10 Door"
    }
}
