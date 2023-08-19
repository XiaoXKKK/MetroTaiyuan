import QtQuick 2.0

Item {
    Image{
        source: "Images/bgimage.png"
        asynchronous: true
    }

    property Header header: _header
    Header {
        id: _header
    }

    property var names: []
    property var rails: []
    property var sites: []

    Component.onCompleted: {
        for (var i = 0; i < root.num; i++) {
            names.push(Qt.createQmlObject(
                        'VerticalText { }'
                        , this
                        , "staion" + i));
            names[i].x = i * 77 + 70;
            names[i].y = 120;
            names[i].chineseText = root.zhname[i]
            names[i].englishText = root.enname[i]
        }
        for (i = 0; i < 23; i++) {
            rails.push(Qt.createQmlObject(
                        'import QtQuick 2.0; Image { source: "Images/railnext.png"; }'
                        , this
                        , "rail" + i));
            rails[i].x = i * 77 + 90;
            rails[i].y = 80;
        }
        for (i = 0; i < 24; i++) {
            sites.push(Qt.createQmlObject(
                        'import QtQuick 2.0; Image { source: "Images/statenextr.png"; }'
                        , this
                        , "site" + i));
            sites[i].x = i * 77 + 70;
            sites[i].y = 80;
            sites[i].z = 100;
        }
    }
}
