import QtQuick 2.0
import "CustomControl"

Item {
    width: 1920
    height: 360
    Image {
        id: bgimage
        source: "welcome/welcome.png"
        width: source.width
        height: source.height
    }
}
