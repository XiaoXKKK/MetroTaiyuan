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

    property var zhname: ['西山矿务局站', '西铭路站', '客运西站', '金阳路站', '小井峪站', '下元站', '迎泽西站', '桃园路站', '大南门站', '柳巷南站', '五一广场站', '建设北路南站', '太原站东广场站', '迎泽东大街站', '朝阳街站', '南内环东街站', '东太堡站', '长风东街站', '学府街东口站', '省农科院站', '太原南站', '中心街东站', '龙城大街东站', '武宿机场站']
    property var enname: ['Xishan Mining Bureau Station', 'Xi Ming Road station', 'Passenger West Station', 'Jinyang Road Station', 'Xiaojingyu Station', 'Xiayuan Station', 'Yingze West Station', 'Taoyuan Road Station', 'Da Nan Men Station', 'Liuxiang South Station', 'WuYi Square Station', 'Jianshe North Road South Station', 'Taiyuan Station East Square Station', 'Yingze East Street Station', 'Chaoyang Street Station', 'South Inner Ring East Street Station', 'Dongtaibao Station', 'Changfeng East Street Station', 'Xuefu Street Dongkou Station', 'Provincial Academy of Agricultural Sciences Station', 'Taiyuan South Station', 'Central Street East Station', 'Longcheng Street East Station', 'Wusu Airport Station']

    Header {

    }

    Item {
        Component.onCompleted: {
            for (var i = 0; i < 24; i++) {
                var VerticalText = Qt.createQmlObject(
                            'VerticalText { }'
                            , parent
                            , "staion" + i);
                VerticalText.x = i * 77 + 70;
                VerticalText.y = 120;
                VerticalText.chineseText = zhname[i]
                VerticalText.englishText = enname[i]
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
