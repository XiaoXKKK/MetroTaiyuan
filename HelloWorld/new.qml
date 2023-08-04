
import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 400
    height: 400
    title: "中文纵向排版"

    Text {
        id: text
        text: "中文纵向排版"
        font.pixelSize: 20
    }

    Rectangle {
        id: rect
        color: "transparent"
        border.color: "black"
        border.width: 1
        width: text.height
        height: text.width
        x: 100
        y: 100

        Component.onCompleted: {
            var layout = new QTextLayout(text.text, text.font);
            layout.beginLayout();
            var line = layout.createLine();
            line.setLineWidth(rect.height);
            line.setPosition(new QPointF(0, 0));
            layout.endLayout();
            var painter = new QPainter(rect);
            painter.rotate(-90);
            painter.translate(-rect.height, 0);
            layout.draw(painter,new QPointF(0, 0));
        }
    }
}
