Item {
    property string chineseText: "中文"
    property string englishText: "English"

    Row {
        Text {
            text: chineseText
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
        }
    }

    Row {
        Text {
            text: englishText
            font.pixelSize: 16
            horizontalAlignment: Text.AlignHCenter
        }
    }
    function verticalText(text) {
        var result = "";
        for (var i = 0; i < text.length; i++) {
            result += text.charAt(i) + "\n";
        }
        return result;
    }

}

