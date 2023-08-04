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

    Header {

    }
}
