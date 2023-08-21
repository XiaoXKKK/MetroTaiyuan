import QtQuick 2.12
import QtQuick.Window 2.12

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
        chooseIndex: 1
        nextOrArriveCH:'大南门站'
        nextOrArriveEN: "Da Nan Men Station"
        ifBad: 0
    }

    OpenDoor{
        ifBad: 0
    }

    //到站界面1
    ArriveStation1{

    }

    //到站界面2，仅需要一个图片

}
