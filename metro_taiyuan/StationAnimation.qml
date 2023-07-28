import QtQuick 2.12
import "CustomControl"
import Models.User 1.0

Item {
    id: root
    width: 1920; height: 360
    property int startstation: 1
    property int currentstation: 1
    property int endstation: 20
    property int nextstation: 2
    property bool just: false
    property int stationid
     property bool xray: true
    Image {
        id: imagebackground
        source: "map_mark/bgimage.png"
        width: source.widthr
        height: source.height
        asynchronous: true
    }
    Image {
        id: ttsarrowl
        x: 680; y: 20
        source: "map_mark/tts-arrowl.gif"
        rotation: root.just ? 0 : 180
    }
    Image {
        x: 60; y: 17
        source: "map_mark/logo.png"
        width: source.width
        height: source.height
        asynchronous: true
    }
        Image {
        x: 420; y: 22
        source: "topstation/tts-startname001.png"
        width: source.width
        height: source.height
        asynchronous: true
    }

    Image {
         x: 770; y: 22
        source: "topstation/tts-endname024.png"
        width:  source.width
        height: source.height
        asynchronous: true
    }
    Image {
         x: 1040; y: 22
        source: "map_mark/tts-nowpic.png"
        width:  source.width
        height: source.height
        asynchronous: true
    }
    Image {
         x: 1050; y: 22
        source: "map_mark/tts-nextpic.png"
        width:  source.width
        height: source.height
        asynchronous: true
    }Image {
        id: ttsarrowl1
        x: 680; y: 20
        source: "map_mark/tts-arrowl.gif"
        rotation: root.just ? 0 : 180
    }

    Image {
        id: railnext001

        x: 90; y: 80

        source: "map_mark/railnext001.png"


    }
    Image {
        id: railnext002
        x: 167
        y: 80

        source: "map_mark/railnext002.png"
    }
    Image {
        id: railnext003
        x: 244
        y: 80

        source: "map_mark/railnext003.png"
    }
    Image {
        id: railnext004
        x: 321
        y: 80

        source: "map_mark/railnext004.png"
    }
    Image {
        id: railnext005
        x: 398
        y: 80

        source: "map_mark/railnext005.png"
    }
    Image {
        id: railnext006
        x: 475
        y: 80

        source: "map_mark/railnext006.png"
    }
    Image {
        id: railnext007
        x: 552
        y: 80

        source: "map_mark/railnext007.png"
    }
    Image {
        id: railnext008
        x: 629
        y: 80

        source: "map_mark/railnext008.png"
    }
    Image {
        id: railnext009
        x: 706
        y: 80
        source: "map_mark/railnext009.png"
    }
    Image {
        id: railnext010
        x: 783
        y: 80

        source: "map_mark/railnext010.png"
    }
    Image {
        id: railnext011
        x: 860
        y: 80

        source: "map_mark/railnext011.png"
    }
    Image {
        id: railnext012
        x: 937
        y: 80

        source: "map_mark/railnext012.png"
    }
    Image {
        id: railnext013
        x: 1014
        y: 80

        source: "map_mark/railnext013.png"
    }
    Image {
        id: railnext014
        x: 1091
        y: 80

        source: "map_mark/railnext014.png"
    }
    Image {
        id: railnext015
        x: 1168
        y: 80

        source: "map_mark/railnext015.png"
    }
    Image {
        id: railnext016
        x: 1245
        y: 80

        source: "map_mark/railnext016.png"
    }
    Image {
        id: railnext017
        x: 1322
        y: 80

        source: "map_mark/railnext017.png"
    }
    Image {
        id: railnext018
        x: 1399
        y: 80

        source: "map_mark/railnext018.png"
    }
    Image {
        id: railnext019
        x: 1476
        y: 80

        source: "map_mark/railnext019.png"
    }
    Image {
        id: railnext020
        x: 1553
        y: 80

        source: "map_mark/railnext020.png"
    }
    Image {
        id: railnext021
        x: 1630
        y: 80

        source: "map_mark/railnext021.png"
    }
    Image {
        id: railnext022
        x: 1707
        y: 80

        source: "map_mark/railnext022.png"
    }
    Image {
        id: railnext023
        x: 1784
        y: 80

        source: "map_mark/railnext023.png"
    }
    Image {
        id: railnext024
        x: 1861
        y: 80

        source: "map_mark/railnext024.png"
    }
    Image {
        id: sitenextdown001
        x: 70; y: 120
        width: 280
        height: 90
        source: "globalstation/sitenextdown001.png"
    }
    Image {
        id: sitenextdown002
        x: 147 ; y:120
        clip: false
        source: "globalstation/sitenextdown002.png"
    }
    Image {
        id: sitenextdown003
        x: 224 ; y: 120
        clip: false
        source: "globalstation/sitenextdown003.png"
    }
    Image {
        id: sitenextdown004
        x: 301 ; y: 120
        clip: false
        source: "globalstation/sitenextdown004.png"
    }
    Image {
        id: sitenextdown005
        x: 378; y: 120
        clip: false
        source: "globalstation/sitenextdown005.png"
    }Image {
        id: sitenextdown006
        x: 455; y: 120
        clip: false
        source: "globalstation/sitenextdown006.png"
    }Image {
        id: sitenextdown007
        x: 532; y: 120
        clip: false
        source: "globalstation/sitenextdown007.png"
    }
    Image {
        id: sitenextdown008
        x: 609; y:120
        clip: false
        source: "globalstation/sitenextdown008.png"
    }
    Image {
        id: sitenextdown009
        x: 686; y: 120
        clip: false
        source: "globalstation/sitenextdown009.png"
            }
    Image {
        id: sitenextdown010
        x: 763; y: 120
        clip: false
        source: "globalstation/sitenextdown010.png"
    }
    Image {
        id: sitenextdown011
        x:840; y: 120
        clip: false
        source: "globalstation/sitenextdown011.png"
    }

  Image {
    id: sitenextdown012
    x: 917; y: 120
    clip: false
    source: "globalstation/sitenextdown012.png"
}
Image {
    id: sitenextdown013
    x: 994; y: 120
    clip: false
    source: "globalstation/sitenextdown013.png"
}
Image {
    id: sitenextdown014
    x: 1071; y: 120
    clip: false
    source: "globalstation/sitenextdown014.png"
}
Image {
    id: sitenextdown015
    x: 1148; y: 120
    clip: false
    source: "globalstation/sitenextdown015.png"
}
Image {
    id: sitenextdown016
    x: 1225; y: 120
    clip: false
    source: "globalstation/sitenextdown016.png"
}
Image {
    id: sitenextdown017
    x: 1302; y: 120
    clip: false
    source: "globalstation/sitenextdown017.png"
}
Image {
    id: sitenextdown018
    x: 1379; y: 120
    clip: false
    source: "globalstation/sitenextdown018.png"
}
Image {
    id: sitenextdown019
    x: 1456; y: 120
    clip: false
    source: "globalstation/sitenextdown019.png"
}
Image {
    id: sitenextdown020
    x: 1533; y: 120
    clip: false
    source: "globalstation/sitenextdown020.png"
}
Image {
    id: sitenextdown021
    x: 1610; y: 120
    clip: false
    source: "globalstation/sitenextdown021.png"
}
Image {
    id: sitenextdown022
    x: 1687; y: 120
    clip: false
    source: "globalstation/sitenextdown022.png"
}Image {
    id: sitenextdown023
    x: 1764; y: 120
    clip: false
    source: "globalstation/sitenextdown023.png"
}
Image {
    id: sitenextdown024
    x: 1841; y: 120
    clip: false
    source: "globalstation/sitenextdown024.png"
}



Image {
    id: statenextr01
    x: 70; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}Image {
    id: statenextr02
    x: 147; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr03
    x: 224; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr04
    x: 301; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr05
    x: 378; y: 80
    source: "map_mark/statenextr.png"
    rotation: root.just ? 0 : 180
}
Image {
    id: statenextr06
    x: 455; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}

Image {
    id: statenextr07
    x: 532; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}

Image {
    id: statenextr08
    x: 609; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr09
    x: 686; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr10
    x: 763; y: 80
    source:"map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr11
    x: 840; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr12
    x: 917; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr13
    x: 994; y: 80
    source:"map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
    }
Image {
    id: statenextr14
    x: 1071; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr15
    x: 1148; y: 80
    source:"map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr16
    x: 1225; y: 80
    source:"map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}Image {
    id: statenextr17
    x: 1302; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr18
    x: 1379; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr19
    x: 1456; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr20
    x: 1533; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr21
    x: 1610; y: 80
    source:"map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr22
    x: 1687; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}
Image {
    id: statenextr23
    x: 1764; y: 80
    source: "map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}

Image {
    id: statenextr24
    x: 1841; y: 80
    source:"map_mark/statenextr.png"
     rotation: root.just ? 0 : 180
}

Image {
    id: dooropen
    x: 1645; y: -22
    source: "map_mark/tts-opendoor.gif"
    visible: false
}
Image {
    id: doorclose
    x: 1515; y: 22
    source: "map_mark/tts-failuredoor.png"
}
Image {
    id: arrowl
    x:  1090 ; y:  190
    source: "map_mark/local_arrowr.png"

    PropertyAnimation on x
    {
        to:135
        duration: 5000
       }
   }
Dynamicmap{
    id:dynamicmap
    objectName:"dynamicmap"
    anchors.centerIn: parent
    onChangeColor: console.log("qwer")
    onStartingStationSignal: console.log("asdf"+val)
}
}
