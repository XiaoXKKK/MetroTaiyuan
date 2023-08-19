import QtQuick 2.12
import QtQuick.Window 2.12
import Controller 1.0

Window {
    id: root
    visible: true
    width: 1920
    height: 360

    property int num: 24
    property var zhname: ['西山矿务局站', '西铭路站', '客运西站', '金阳路站', '小井峪站', '下元站', '迎泽西站', '桃园路站', '大南门站', '柳巷南站', '五一广场站', '建设北路南站', '太原站东广场站', '迎泽东大街站', '朝阳街站', '南内环东街站', '东太堡站', '长风东街站', '学府街东口站', '省农科院站', '太原南站', '中心街东站', '龙城大街东站', '武宿机场站']
    property var enname: ['Xishan Mining Bureau Station', 'Xi Ming Road station', 'Passenger West Station', 'Jinyang Road Station', 'Xiaojingyu Station', 'Xiayuan Station', 'Yingze West Station', 'Taoyuan Road Station', 'Da Nan Men Station', 'Liuxiang South Station', 'WuYi Square Station', 'Jianshe North Road South Station', 'Taiyuan Station East Square Station', 'Yingze East Street Station', 'Chaoyang Street Station', 'South Inner Ring East Street Station', 'Dongtaibao Station', 'Changfeng East Street Station', 'Xuefu Street Dongkou Station', 'Provincial Academy of Agricultural Sciences Station', 'Taiyuan South Station', 'Central Street East Station', 'Longcheng Street East Station', 'Wusu Airport Station']

//    flags:  Qt.FramelessWindowHint

    Welcome{
        id: welcome
        visible: true
    }

    AllStation{
        id: allstation
        visible: false
    }

    Controller{

        onDataChanged: {
            if(welcome.visible) {
                welcome.visible=false
                allstation.visible=true
            }
            for (var i = 0; i < num; i++){
                if(i < start || i > end){
                    allstation.names[i].disable();
                    if(i < start)
                        allstation.rails[i].source = "Images/railpass.png"
                    else
                        allstation.rails[i-1].source = "Images/railpass.png"
                    allstation.sites[i].source = "Images/statenorun.png"
                    continue;
                }
                if(i < next){
                    allstation.names[i].disable();
                    allstation.rails[i].source = "Images/railpass.png"
                    allstation.sites[i].source = "Images/statepassr.png"
                }
                else {
                    if(i!==num-1)
                        allstation.rails[i].source = "Images/railnext.png"
                    allstation.sites[i].source = "Images/statenextr.png"
                    allstation.names[i].enable();
                }
                if(i === now){
                    allstation.rails[i].source = "Images/railnext.png"
                    allstation.sites[i].source = "Images/statenow.png"
                    allstation.arrow.x = i * 77 + 100;
                }
                if(pass >> i & 1){
                    allstation.sites[i].source = "Images/statenorun.png"
                    allstation.names[i].disable();
                }
            }
//            console.log(typeof pass)
            allstation.header.updateStart(start)
            allstation.header.updateEnd(end)
            allstation.header.updateNext(next)
            allstation.header.updateDoor(door)
        }

        Component.onCompleted: {
        }
    }
}
