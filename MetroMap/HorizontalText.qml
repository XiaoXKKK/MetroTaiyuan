import QtQuick 2.0

Item {
    property string chineseText: "你好"
    property string englishText: "Hello"
    property int chineseFontSize: 20
    property int englishFontSize: 10

    Text {
        text: chineseText
        font.family: "Microsoft YaHei"
        font.pointSize: chineseFontSize
        anchors.centerIn: parent
        Text {
            text: englishText
            font.pointSize: englishFontSize
            anchors.top: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
