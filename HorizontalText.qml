import QtQuick 2.0

Item {
    property string chineseText: "你好"
    property string englishText: "Hello"
    property int chineseFontSize: 20
    property int englishFontSize: 10
    property string mycolor: "black"

    Text {
        text: chineseText
        font.family: "Microsoft YaHei"
        font.pointSize: chineseFontSize
        anchors.centerIn: parent
        color: mycolor
        //font.bold: true       //如果对横排中文粗细需要更改可以加一个接口
        Text {
            text: englishText
            font.pointSize: englishFontSize
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.bold: true
            color: mycolor
        }
    }
}
