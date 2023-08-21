import QtQuick 2.12
import QtQuick.Window 2.12

//预到站和跳站都可以使用

Window {
    visible: true
    width: 1920
    height: 360
//    flags:  Qt.FramelessWindowHint

    Image{
        source: "Images/bgimage.png"
        asynchronous: true
    }

    Header{
        chooseIndex: 0
        nextOrArriveCH:"大南门站"
        nextOrArriveEN: "Da Nan Men Station"
        ifBad:0
    }

    //调用组件
    OpenDoor{
        ifBad: 0;
    }

    ThreeStation{
        chineseText1: "桃园路站"
        englishText1: "Taoyuan Road Station"
        chineseText2: "大南门站"
        englishText2: "Da Nan Men Station"
        chineseText3: "柳巷南站"
        englishText3: "Liuxiang South Station"

    }
}
