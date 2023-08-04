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

//    VerticalText{
//        x:70
//        y:120
//        chineseText: "西山矿务局站"
//        englishText: "XiShan Mining Bureau Station"
//    }
    Item {
        Component.onCompleted: {
            for (var i = 0; i < 24; i++) {
                var VerticalText = Qt.createQmlObject(
                            'VerticalText { }'
                            , parent
                            , "staion" + i);
                VerticalText.x = i * 77 + 70;
                VerticalText.y = 120;
            }
        }
    }
    Item{
        Component.onCompleted: {
            for (var i = 0; i < 23; i++) {
                var rail = Qt.createQmlObject(
                            'import QtQuick 2.0; Image { source: "Images/railnext.png"; }'
                            , parent
                            , "rail" + i);
                rail.x = i * 77 + 90;
                rail.y = 80;
            }
        }
    }
    Item{
        Component.onCompleted: {
            for (var i = 0; i < 24; i++) {
                var site = Qt.createQmlObject(
                            'import QtQuick 2.0; Image { source: "Images/statenextr.png"; }'
                            , parent
                            , "rail" + i);
                site.x = i * 77 + 70;
                site.y = 80;
                site.z = 100;
            }
        }
    }
}
