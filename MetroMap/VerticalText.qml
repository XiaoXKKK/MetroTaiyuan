import QtQuick 2.0

Item {
    property string chineseText: "你好，世界"
    property string englishText: "Hello World"
    property int chineseFontSize: 20
    property int englishFontSize: 10

    function verticalText(text) {
        var result = "";
        for (var i = 0; i < text.length; i++) {
            result += text.charAt(i) + "\n";
        }
        return result;
    }

    Text {
        text: verticalText(chineseText)
        font.family: "Microsoft YaHei"
        font.pointSize: chineseFontSize
        lineHeightMode: Text.FixedHeight
        lineHeight: 24
        anchors.top: parent.top
        Text {
            id: entext
            width: 10
            text: englishText
            font.pointSize: englishFontSize
            rotation: 90

            anchors.right:  parent.left
            anchors.top: parent.top
        }
    }
}
