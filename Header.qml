import QtQuick 2.0

Item {
    width: 1920
    height: 80
    property int chooseIndex: 0     //选择已到站或当前站
    property string nextOrArriveCH: "大南门站"
    property string nextOrArriveEN: "Da Nan Men Station"
    property int ifBad: 0

    //提示语数组
    property var zhname: ['下一站:','已到站:']
    property var enname: ['This door open','Arrived at station:']

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
        chineseText: zhname[chooseIndex]
        englishText: enname[chooseIndex]
    }

    HorizontalText{
        id: station
        x: 1300
        y: 30
        chineseText: nextOrArriveCH
        englishText: nextOrArriveEN
    }

    //门正常
    HorizontalText{
        id: dooropen
        x: 1570
        y: 30
        visible: !ifBad
        chineseText: "本侧开门"
        englishText: "This door open"
    }

    //门故障
    HorizontalText{
        id: doorbad
        x: 1570
        y: 30
        mycolor: "red"
        visible: ifBad
        chineseText: "此门故障"
        englishText: "The door is failure"
    }

    //门正常
    AnimatedImage {
        id: opendoorl
        x: 1665; y:12
        visible: !ifBad
        source: "Images/tts-opendoorl.gif"
    }

    AnimatedImage {
        id: opendoorr
        x: 1715; y:12
        visible: !ifBad
        source: "Images/tts-opendoorr.gif"
    }

    //门故障
    AnimatedImage {
        id: opendoorbad
        x: 1665; y:12
        visible: ifBad
        source: "Images/tts-failuredoor.png"
    }

    HorizontalText{
        id: doorid
        x: 1850
        y: 30
        chineseText: "10号门"
        englishText: "No.10 Door"
    }
}
