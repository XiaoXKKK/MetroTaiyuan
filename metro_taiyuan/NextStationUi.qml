
import QtQuick 2.12

import "CustomControl"



Item {
    id: nextstationui
    width: 1920
    height: 360
    property int startstation   ;      //startingStation
    property int ttsstartstation;
    property int currentstation ;     //currentStation
    property int endstation     ;     //terminalStation
    property int ttsendstation;
    property int nextstation    ;     //nextSta tion
    property int thisidedoor          //thissidedoor
    property int opposotedoor         //opposotedoor
    property int just
    property int stationid
    property int upstream
    property int downstream
    property int setpass
    property int  nextstation1
    property int rail01
    property int rail02
/********************************frame******************/
    Image {
        id: imagebackground
        source: "map_mark/bgimage.png"
        width: source.width
        height: source.height
        asynchronous: true
    }
    AnimatedImage {
        id: ttsarrowr
        x: 680; y: 20
        source: "map_mark/tts-arrowr.gif"
        visible: (downstream==1||(root.startingstation>root.terminalstation))||(upstream==1||(root.startingstation<root.terminalstation)) ? true:false
    }
//    AnimatedImage {
//        id: ttsarrowl
//        x: 680; y: 20
//        source: "map_mark/tts-arrowl.gif"
//        visible: downstream==1 ? true:false
//    }
//    AnimatedImage {
//        id: ttsarrowr
//        x: 680; y: 20
//        source: "map_mark/tts-arrowr.gif"
//        visible : upstream==1 ? true:false
//    }
    Image {
        x: 60; y: 17
        source: "map_mark/logo.png"
        width: source.width
        height: source.height
        asynchronous: true
    }
/**********************tts-dooropen******************/

    Image {
        id: dooropen
        x:1510; y:15
        source: "map_mark/tts-dooropen.png"
        visible:thisidedoor==1 ? true:false/*thisidedoor==1&&thisidedoor!=0 ? true:false*/
    }
    AnimatedImage {
        id: opendoor
        x: 1665; y:12
        source: "map_mark/tts-opendoor.gif"
       visible: thisidedoor==1&&thisidedoor!==0 ? true:false
    }

    Image {
        id: doorclose
        x: 1605; y: 15
        source: "map_mark/tts-doorclose.png"
        visible: opposotedoor==1&&opposotedoor!==0&&thisidedoor==0 ? true:false
    }
    Image {
        id: closedoor
        x:1515; y:12
        source: "map_mark/tts-closedoor.png"
        visible: opposotedoor==1&&opposotedoor!=0&&thisidedoor===0 ? true:false
    }

    Image {
        id: gate10
        x:1790; y:23
        source: "map_mark/tts-gate10.png"
        visible: (thisidedoor==1&&thisidedoor!==0)||(opposotedoor==1&&opposotedoor!=0&&thisidedoor===0)
    }
/********************opendoor****************************/
    AnimatedImage {
        id: opendoor1
        x:50; y:110
        source: "map_mark/opendoor.gif"
        visible: thisidedoor==1 ? true:false/*thisidedoor==1&&thisidedoor!=0 ? true:false*/
    }
    Image {
        id: dooropen1
        x:450; y:180
        source: "map_mark/dooropen.png"
        visible: thisidedoor==1&&thisidedoor!=0 ? true:false
    }
    Image {
        id: closedoor1
        x:80; y:100
        source: "map_mark/closedoor.png"
        visible: opposotedoor==1&&opposotedoor!==0&&thisidedoor==0 ? true:false
    }
    Image {
        id: doorclose1
        x:380; y:180
        source: "map_mark/doorclose.png"
        visible:  opposotedoor==1&&opposotedoor!==0&&thisidedoor==0 ? true:false
    }
/**********************nextpic******************/

     Image {
              x: 1050; y: 22
              source: "map_mark/tts-nextpic.png"
             width:  source.width
             height: source.height
             visible: true
        }
     /**********************startingStation******************/

         Image {
         x: 450; y:22
         source: "topstation/tts-startname001.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==1 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname001.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==1 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname002.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==2 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname002.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==2 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname003.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==3 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname003.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==3 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname004.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==4 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname004.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==4 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname005.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==5 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname005.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==5 ? true:false
     }
         Image {
         x: 550; y: 22
         source: "topstation/tts-startname006.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==6 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname006.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==6 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname007.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: upstream==1&&ttsstartstation==7 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname007.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==7 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname008.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==8 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname008.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==8 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname009.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==9 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname009.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==9 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname010.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==10 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname010.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==10 ? true:false
     }
         Image {
         x: 500; y: 22
         source: "topstation/tts-startname011.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==11 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname011.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==11 ? true:false
     }
         Image {
         x: 430; y: 22
         source: "topstation/tts-startname012.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==12 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname012.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==12 ? true:false
     }
         Image {
         x: 420; y: 22
         source: "topstation/tts-startname013.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==13 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname013.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==13 ? true:false
     }
         Image {
         x: 470; y: 22
         source: "topstation/tts-startname014.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==14 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname014.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==14 ? true:false
     }
         Image {
         x: 490; y: 22
         source: "topstation/tts-startname015.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==15 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname015.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==15 ? true:false
     }
         Image {
         x: 420; y: 22
         source: "topstation/tts-startname016.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==16 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname016.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==16 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname017.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==17 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname017.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==17 ? true:false
     }
         Image {
         x:480; y: 22
         source: "topstation/tts-startname018.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==18 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname018.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==18 ? true:false
     }
         Image {
         x: 440; y: 22
         source: "topstation/tts-startname019.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==19 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname019.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==19 ? true:false
     }
         Image {
         x: 440; y: 22
         source: "topstation/tts-startname020.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==20 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname020.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==20 ? true:false
     }
         Image {
         x: 520; y: 22
         source: "topstation/tts-startname021.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==21 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname021.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==21 ? true:false
     }
         Image {
         x: 480; y: 22
         source: "topstation/tts-startname022.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==22 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname022.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==22 ? true:false
     }

         Image {
         x: 450; y: 22
         source: "topstation/tts-startname023.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==23 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname023.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==23 ? true:false
     }
         Image {
         x: 480; y: 22
         source: "topstation/tts-startname024.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsstartstation==24 ? true:false
     }
         Image {
         x: 770; y:22
         source: "topstation/tts-startname024.png"
         width: source.width
         height: source.height
         asynchronous: true
         visible: downstream==1&&ttsstartstation==24 ? true:false
     }
     /**********************terminalStation******************/

     Image {
          x: 770; y: 22
         source: "topstation/tts-endname001.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==1 ? true:false
     }
     Image {
          x: 450; y: 22
         source: "topstation/tts-endname001.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==1 ? true:false
     }
     Image {
          x:770; y:22
         source: "topstation/tts-endname002.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==2 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname002.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==2 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname003.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==3 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname003.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==3 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname004.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==4 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname004.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==4 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname005.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==5 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname005.png"
         width:  source.width
         height: source.height
         asynchronous: true
        visible:downstream==1&&ttsendstation==5 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname006.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==6 ? true:false
     }
     Image {
          x: 550; y: 22
         source: "topstation/tts-endname006.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==6 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname007.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==7 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname007.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==7 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname008.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==8 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname008.png"
         width:  source.width
         height: source.height
         asynchronous: true
        visible:downstream==1&&ttsendstation==8 ? true:false
     }
     Image {
         x: 770; y: 22
         source: "topstation/tts-endname009.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==9 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname009.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==9 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname010.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==10 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname010.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==10 ? true:false
     }
     Image {
          x:770; y: 22
         source: "topstation/tts-endname011.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==11 ? true:false
     }
     Image {
          x: 500; y: 22
         source: "topstation/tts-endname011.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==11 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname012.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==12 ? true:false
     }
     Image {
          x: 430; y: 22
         source: "topstation/tts-endname012.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==12 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname013.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==13 ? true:false
     }
     Image {
          x: 420; y: 22
         source: "topstation/tts-endname013.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==13 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname014.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==14 ? true:false
     }
     Image {
          x: 470; y: 22
         source: "topstation/tts-endname014.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==14 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname015.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==15 ? true:false
     }
     Image {
          x: 490; y: 22
         source: "topstation/tts-endname015.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==15 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname016.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==16 ? true:false
     }
     Image {
          x: 420; y: 22
         source: "topstation/tts-endname016.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==16 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname017.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==17 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname017.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==17 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname018.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==18 ? true:false
     }
     Image {
          x: 480; y: 22
         source: "topstation/tts-endname018.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==18 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname019.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==19 ? true:false
     }
     Image {
          x: 440; y: 22
         source: "topstation/tts-endname019.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==19 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname020.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==20 ? true:false
     }
     Image {
          x: 440; y: 22
         source: "topstation/tts-endname020.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==20 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname021.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==21 ? true:false
     }
     Image {
          x: 520; y: 22
         source: "topstation/tts-endname021.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==21 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname022.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==22 ? true:false
     }
     Image {
          x: 480; y: 22
         source: "topstation/tts-endname022.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==22 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname023.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==23 ? true:false
     }
     Image {
          x: 450; y: 22
         source: "topstation/tts-endname023.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==23 ? true:false
     }
     Image {
          x: 770; y: 22
         source: "topstation/tts-endname024.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:upstream==1&&ttsendstation==24 ?true:false
     }
     Image {
          x: 500; y: 22
         source: "topstation/tts-endname024.png"
         width:  source.width
         height: source.height
         asynchronous: true
         visible:downstream==1&&ttsendstation==24 ? true:false
     }
/**********************tts-sitename/nextstation******************/
     Image {
         id: sitename001
         x: 1180; y: 22
         source: "topstation/tts-sitename024.png"
         visible: nextstation1==24 ? true:false
     }
     Image {
         id: sitename002
         x: 1180; y: 22
         source: "topstation/tts-sitename023.png"
         visible: nextstation1==23 ? true:false
     }
     Image {
         id: sitename003
         x: 1180; y: 22
         source: "topstation/tts-sitename022.png"
         visible: nextstation1==22 ? true:false
     }
     Image {
         id: sitename004
         x: 1180; y: 22
         source: "topstation/tts-sitename021.png"
         visible: nextstation1==21 ? true:false
     }
     Image {
         id: sitename005
         x: 1180; y: 22
         source: "topstation/tts-sitename020.png"
         visible: nextstation1==20 ? true:false
     }
     Image {
         id: sitename006
         x: 1180; y:22
         source: "topstation/tts-sitename019.png"
         visible: nextstation1==19 ? true:false
     }
     Image {
         id: sitename007
         x: 1180; y:22
         source: "topstation/tts-sitename018.png"
         visible: nextstation1==18 ? true:false
     }
     Image {
         id: sitename008
         x: 1180; y:22
         source: "topstation/tts-sitename017.png"
         visible: nextstation1==17 ? true:false
     }
     Image {
         id: sitename009
         x: 1180; y: 22
         source: "topstation/tts-sitename016.png"
         visible: nextstation1==16 ? true:false
     }
     Image {
         id: sitename010
         x: 1180; y: 22
         source: "topstation/tts-sitename015.png"
         visible: nextstation1==15 ? true:false
     }
     Image {
         id: sitename011
         x: 1180; y: 22
         source: "topstation/tts-sitename014.png"
         visible: nextstation1==14 ? true:false
     }
     Image {
         id: sitename012
         x: 1180; y:22
         source: "topstation/tts-sitename013.png"
         visible: nextstation1==13 ? true:false
     }
     Image {
         id: sitename013
         x: 1180; y: 22
         source: "topstation/tts-sitename012.png"
         visible: nextstation1==12 ? true:false
     }
     Image {
         id: sitename014
         x: 1180; y: 22
         source: "topstation/tts-sitename011.png"
         visible: nextstation1==11 ? true:false
     }
     Image {
         id: sitename015
         x: 1180; y:22
         source: "topstation/tts-sitename010.png"
         visible: nextstation1==10 ? true:false
     }
     Image {
         id: sitename016
         x: 1180; y: 22
         source: "topstation/tts-sitename009.png"
         visible: nextstation1==9 ? true:false
     }
     Image {
         id: sitename017
         x: 1180; y: 22
         source: "topstation/tts-sitename008.png"
         visible: nextstation1==8 ? true:false
     }
     Image {
         id: sitename018
         x: 1180; y: 22
         source: "topstation/tts-sitename007.png"
         visible: nextstation1==7 ? true:false
     }
     Image {
         id: sitename019
         x: 1180; y: 22
         source: "topstation/tts-sitename006.png"
         visible: nextstation1==6 ? true:false
     }
     Image {
         id: sitename020
         x: 1180; y:22
         source: "topstation/tts-sitename005.png"
         visible: nextstation1==5 ? true:false
     }
     Image {
         id: sitename021
         x: 1180; y: 22
         source: "topstation/tts-sitename004.png"
         visible: nextstation1==4 ? true:false
     }
     Image {
         id: sitename022
         x: 1180; y: 22
         source: "topstation/tts-sitename003.png"
         visible: nextstation1==3 ? true:false
     }
     Image {
         id: sitename023
         x: 1180; y:22
         source: "topstation/tts-sitename002.png"
         visible: nextstation1==2 ? true:false
     }
     Image {
         id: sitename024
         x: 1180; y:22
         source: "topstation/tts-sitename001.png"
         visible: nextstation1==1 ? true:false
     }
/********************rail001****************************/
/********************lightbg****************************/

     Image {
         id: lightbg
         x:800; y:110
         source: "map_mark/lightbg.png"
         visible: true
     }
/********************Stationname****************************/
/********************upstream****************************/
/********************setpass****************************/
     Image {
         id: sitepass001
         x:840; y:190
         source: "localstation/sitepass001.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation==3)||(nextstation<=endstation-2&&nextstation-1==1)))||((endstation-startstation)<=2&&startstation==1) ) ? true:false
     }
     Image {
         id: sitepass002
         x:870; y:190
         source: "localstation/sitepass002.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation==4)||(nextstation<=endstation-2&&nextstation-1==2)))||((endstation-startstation)<=2&&startstation==2) ) ? true:false
     }
     Image {
         id: sitepass003
         x:870; y:190
         source: "localstation/sitepass003.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==3)||(nextstation<=endstation-2&&nextstation-1==3)))||((endstation-startstation)<=2&&startstation==3) ) ? true:false
     }
     Image {
         id: sitepass004
         x:870; y:190
         source: "localstation/sitepass004.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==4)||(nextstation<=endstation-2&&nextstation-1==4)))||((endstation-startstation)<=2&&startstation==4) ) ? true:false

     }
     Image {
         id: sitepass005
         x:870 ; y:190
         source: "localstation/sitepass005.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==5)||(nextstation<=endstation-2&&nextstation-1==5)))||((endstation-startstation)<=2&&startstation==5) ) ? true:false

     }
     Image {
         id: sitenpass006
         x:900; y:190
         source: "localstation/sitepass006.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==6)||(nextstation<=endstation-2&&nextstation-1==6)))||((endstation-startstation)<=2&&startstation==6) ) ? true:false
     }
     Image {
         id: sitepass007
         x:870; y:190
         source: "localstation/sitepass007.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==7)||(nextstation<=endstation-2&&nextstation-1==7)))||((endstation-startstation)<=2&&startstation==7) ) ? true:false
     }
     Image {
         id: sitepass008
         x:870; y:190
         source: "localstation/sitepass008.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==8)||(nextstation<=endstation-2&&nextstation-1==8)))||((endstation-startstation)<=2&&startstation==8) ) ? true:false
     }
     Image {
         id: sitepass009
         x:870; y:190
         source: "localstation/sitepass009.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==9)||(nextstation<=endstation-2&&nextstation-1==9)))||((endstation-startstation)<=2&&startstation==9) ) ? true:false
     }

     Image {
         id: sitepass010
         x:870; y:190
         source: "localstation/sitepass010.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==10)||(nextstation<=endstation-2&&nextstation-1==10)))||((endstation-startstation)<=2&&startstation==10) ) ? true:false
     }
     Image {
         id: sitepass011
         x:850; y:190
         source: "localstation/sitepass011.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==11)||(nextstation<=endstation-2&&nextstation-1==11)))||((endstation-startstation)<=2&&startstation==11) ) ? true:false
     }
     Image {
         id: sitepass012
         x:830; y:190
         source: "localstation/sitepass012.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==12)||(nextstation<=endstation-2&&nextstation-1==12)))||((endstation-startstation)<=2&&startstation==12) ) ? true:false
     }
     Image {
         id: sitepass013
         x:820; y:190
         source: "localstation/sitepass13.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==13)||(nextstation<=endstation-2&&nextstation-1==13)))||((endstation-startstation)<=2&&startstation==13) ) ? true:false
     }
     Image {
         id: sitepass014
         x:830; y:190
         source: "localstation/sitepass014.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==14)||(nextstation<=endstation-2&&nextstation-1==14)))||((endstation-startstation)<=2&&startstation==14) ) ? true:false
     }
     Image {
         id: sitepass015
         x:870; y:190
         source: "localstation/sitepass015.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==15)||(nextstation<=endstation-2&&nextstation-1==15)))||((endstation-startstation)<=2&&startstation==15) ) ? true:false
     }
     Image {
         id: sitepass016
         x:830; y:190
         source: "localstation/sitepass016.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==16)||(nextstation<=endstation-2&&nextstation-1==16)))||((endstation-startstation)<=2&&startstation==16) ) ? true:false
     }
     Image {
         id: sitepass017
         x:870; y:190
         source: "localstation/sitepass017.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==17)||(nextstation<=endstation-2&&nextstation-1==17)))||((endstation-startstation)<=2&&startstation==17) ) ? true:false
     }
     Image {
         id: sitepass018
         x:850; y:190
         source: "localstation/sitepass018.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==18)||(nextstation<=endstation-2&&nextstation-1==18)))||((endstation-startstation)<=2&&startstation==18) ) ? true:false
     }
     Image {
         id: sitepass019
         x:830; y:190
         source: "localstation/sitepass019.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==19)||(nextstation<=endstation-2&&nextstation-1==19)))||((endstation-startstation)<=2&&startstation==19) ) ? true:false
     }
     Image {
         id: sitepass020
         x:850; y:190
         source: "localstation/sitepass020.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==20)||(nextstation<=endstation-2&&nextstation-1==20)))||((endstation-startstation)<=2&&startstation==20) ) ? true:false
     }
     Image {
         id: sitepass021
         x:870; y:190
         source: "localstation/sitepass021.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==21)||(nextstation<=endstation-2&&nextstation-1==21)))||((endstation-startstation)<=2&&startstation==21) ) ? true:false
     }
     Image {
         id: sitepass022
         x:850; y:190
         source: "localstation/sitepass022.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==22)||(nextstation<=endstation-2&&nextstation-1==22)))||((endstation-startstation)<=2&&startstation==22) ) ? true:false
     }
     Image {
         id: sitepass023
         x:830; y:190
         source: "localstation/sitepass023.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==23)||(nextstation<=endstation-2&&nextstation-1==23)))||((endstation-startstation)<=2&&startstation==23) ) ? true:false
     }
     Image {
         id: sitepass024
         x:850; y:190
         source: "localstation/sitepass024.png"
         visible:upstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==24)||(nextstation<=endstation-2&&nextstation-1==24)))||((endstation-startstation)<=2&&startstation==24) ) ? true:false
     }


Image {
    id: sitenext001
    x:840; y:190
    source: "localstation/sitenext001.png"
    visible:downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==25)||(endstation==nextstation+1&&endstation==24))) ? true:false
}
Image {
    id: sitenext002
    x:870; y:190
    source: "localstation/sitenext002.png"
    visible:downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==24)||(endstation==nextstation+1&&endstation==23))) ? true:false
}
Image {
    id: sitenext003
    x:870; y:190
    source: "localstation/sitenext003.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==23)||(endstation==nextstation+1&&endstation==22))) ? true:false
}
Image {
    id: sitenext004
    x:870; y:190
    source: "localstation/sitenext004.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==22)||(endstation==nextstation+1&&endstation==21))) ? true:false
}
Image {
    id: sitenext005
    x:870; y:190
    source: "localstation/sitenext005.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==21)||(endstation==nextstation+1&&endstation==20))) ? true:false
}
Image {
    id: sitenext006
    x:900; y:190
    source: "localstation/sitenext006.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==20)||(endstation==nextstation+1&&endstation==19))) ? true:false
}
Image {
    id: sitenext007
    x:870; y:190
    source: "localstation/sitenext007.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==19)||(endstation==nextstation+1&&endstation==18))) ? true:false
}
Image {
    id: sitenext008
    x:870; y:190
    source: "localstation/sitenext008.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==18)||(endstation==nextstation+1&&endstation==17))) ? true:false
}
Image {
    id: sitenext009
    x:870; y:190
    source: "localstation/sitenext009.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==17)||(endstation==nextstation+1&&endstation==16))) ? true:false
}
Image {
    id: sitenext010
    x:870; y:190
    source: "localstation/sitenext010.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==16)||(endstation==nextstation+1&&endstation==15))) ? true:false
}
Image {
    id: sitenext011
    x:850; y:190
    source: "localstation/sitenext011.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==15)||(endstation==nextstation+1&&endstation==14))) ? true:false
}
Image {
    id: sitenext012
    x:830; y:190
    source: "localstation/sitenext012.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==14)||(endstation==nextstation+1&&endstation==13))) ? true:false
}
Image {
    id: sitenext013
    x:820; y:190
    source: "localstation/sitenext013.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==13)||(endstation==nextstation+1&&endstation==12))) ? true:false
}
Image {
    id: sitenext014
    x:830; y:190
    source: "localstation/sitenext014.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==12)||(endstation==nextstation+1&&endstation==11))) ? true:false
}
Image {
    id: sitenext015
    x:870; y:190
    source: "localstation/sitenext015.png"
    visible:downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==11)||(endstation==nextstation+1&&endstation==10))) ? true:false
}
Image {
    id: sitenext016
    x:830; y:190
    source: "localstation/sitenext016.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==10)||(endstation==nextstation+1&&endstation==9))) ? true:false
}
Image {
    id: sitenext017
    x:870; y:190
    source: "localstation/sitenext017.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==9)||(endstation==nextstation+1&&endstation==8))) ? true:false
}
Image {
    id: sitenext018
    x:850; y:190
    source: "localstation/sitenext018.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==8)||(endstation==nextstation+1&&endstation==7))) ? true:false
}
Image {
    id: sitenext019
    x:830; y:190
    source: "localstation/sitenext019.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==7)||(endstation==nextstation+1&&endstation==6))) ? true:false
}
Image {
    id: sitenext020
    x:850; y:190
    source: "localstation/sitenext020.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==6)||(endstation==nextstation+1&&endstation==5))) ? true:false
}
Image {
    id: sitenext021
    x:870; y:190
    source: "localstation/sitenext021.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==5)||(endstation==nextstation+1&&endstation==4))) ? true:false
}
Image {
    id: sitenext022
    x:850; y:190
    source: "localstation/sitenext022.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==4)||(endstation==nextstation+1&&endstation==3))) ? true:false
}
Image {
    id: sitenext023
    x:830; y:190
    source: "localstation/sitenext023.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==3)||(endstation==nextstation+1&&endstation==2))) ? true:false
}
Image {
    id: sitenext024
    x:850; y:190
    source: "localstation/sitenext024.png"
    visible: downstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+2==2)||(endstation==nextstation+1&&endstation==1))) ? true:false
}



AnimatedImage {
    id: arrowl001
    x: 1090; y:190
    source: "map_mark/local_arrowl.gif"
    visible: downstream==1/*&&(endstation>startstation+2)&&nextstation==endstation ? true:false*/
}
AnimatedImage {
    id: arrowr001
    x: 1090; y:190
    source: "map_mark/local_arrowr.gif"
    visible:upstream==1/*&&((endstation==startstation+1)||(endstation==startstation+2&&endstation==nextstation+1)||(endstation>startstation+2&&endstation>nextstation+1)) ? true:false*/
}



AnimatedImage {
    id: arrowl002
    x: 1516; y:190
    source: "map_mark/local_arrowl.gif"
    visible: downstream==1/*&&(endstation>startstation+2)&&nextstation==endstation ? true:false*/
}
AnimatedImage {
    id: arrowr002
    x: 1516; y:190
    source: "map_mark/local_arrowr.gif"
    visible:upstream==1/*&&((endstation==startstation+1)||(endstation==startstation+2&&endstation==nextstation+1)||(endstation>startstation+2&&endstation>nextstation+1)) ? true:false*/
}






Image {
    id: sitenow001
    x:840; y:190
    source: "localstation/sitenow001.png"
    visible:downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==24) ? true:false
}
Image {
    id: sitenow002
    x:870; y:190
    source: "localstation/sitenow002.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==23) ? true:false
}
Image {
    id: sitenow003
    x:870; y:190
    source: "localstation/sitenow003.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==22) ? true:false
}
Image {
    id: sitenow004
    x:870; y:190
    source: "localstation/sitenow004.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==21) ? true:false
}
Image {
    id: sitenow005
    x:870; y:190
    source: "localstation/sitenow005.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==20) ? true:false
}
Image {
    id: sitenow006
    x:900; y:190
    source: "localstation/sitenow006.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==19) ? true:false
}
Image {
    id: sitenow007
    x:870; y:190
    source: "localstation/sitenow007.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==18) ? true:false
}
Image {
    id: sitenow008
    x:870; y:190
    source: "localstation/sitenow008.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==17) ? true:false
}
Image {
    id: sitenow009
    x:870; y:190
    source: "localstation/sitenow009.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==16) ? true:false
}
Image {
    id: sitenow010
    x:870; y:190
    source: "localstation/sitenow010.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==15) ? true:false
}
Image {
    id: sitenow011
    x:850; y:190
    source: "localstation/sitenow011.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==14) ? true:false
}
Image {
    id: sitenow012
    x:830; y:190
    source: "localstation/sitenow012.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==13) ? true:false
}
Image {
    id: sitenow013
    x:820; y:190
    source: "localstation/sitenow013.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==12) ? true:false
}
Image {
    id: sitenow014
    x:830; y:190
    source: "localstation/sitenow014.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==11) ? true:false
}
Image {
    id: sitenow015
    x:870; y:190
    source: "localstation/sitenow015.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==10) ? true:false
}
Image {
    id: sitenow016
    x:830; y:190
    source: "localstation/sitenow016.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==9) ? true:false
}
Image {
    id: sitenow017
    x:870; y:190
    source: "localstation/sitenow017.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==8) ? true:false
}
Image {
    id: sitenow018
    x:850; y:190
    source: "localstation/sitenow018.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==7) ? true:false
}
Image {
    id: sitenow019
    x:830; y:190
    source: "localstation/sitenow019.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==6) ? true:false
}
Image {
    id: sitenow020
    x:850; y:190
    source: "localstation/sitenow020.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==5) ? true:false
}
Image {
    id: sitenow021
    x:870; y:190
    source: "localstation/sitenow021.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==4) ? true:false
}
Image {
    id: sitenow022
    x:850; y:190
    source: "localstation/sitenow022.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==3) ? true:false
}
Image {
    id: sitenow023
    x:830; y:190
    source: "localstation/sitenow023.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==2) ? true:false
}
Image {
    id: sitenow024
    x:850; y:190
    source: "localstation/sitenow024.png"
    visible: downstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==1) ? true:false
}

/********************setpass1****************************/
Image {
    id: sitenext1001
    x:1250; y:180
    source: "localstation/sitenow001.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==24)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==24)) ? true:false
}
Image {
    id: sitenext1002
    x:1250; y: 180
    source:  "localstation/sitenow002.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==23)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==23)) ? true:false
}
Image {
    id: sitenext1003
    x:1250; y: 180
    source:  "localstation/sitenow003.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==22)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==22)) ? true:false
}
Image {
    id: sitenext1004
    x:1250 ; y: 180
    source:  "localstation/sitenow004.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==21)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==21)) ? true:false
}
Image {
    id: sitenext1005
    x:1250; y: 180
    source:  "localstation/sitenow005.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==20)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==20)) ? true:false
}
Image {
    id: sitenext1006
    x:1270 ; y: 180
    source:  "localstation/sitenow006.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==19)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==19)) ? true:false
}
Image {
    id: sitenext1007
    x:1250; y: 180
    source:  "localstation/sitenow007.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==18)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==18)) ? true:false
}
Image {
    id: sitenext1008
    x:1250 ; y: 180
    source:  "localstation/sitenow008.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==17)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==17)) ? true:false
}
Image {
    id: sitenext1009
    x:1250 ; y: 180
    source:  "localstation/sitenow009.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==16)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==16)) ? true:false
}
Image {
    id: sitenext1010
    x:1250 ; y: 180
    source:  "localstation/sitenow010.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==15)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==15)) ? true:false
}
Image {
    id: sitenext1011
    x:1230; y: 180
    source:  "localstation/sitenow011.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==14)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==14)) ? true:false
}
Image {
    id: sitenext1012
    x:1200 ; y: 180
    source:  "localstation/sitenow012.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==13)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==13)) ? true:false
}
Image {
    id: sitenext1013
    x:1180 ; y: 180
    source:  "localstation/sitenow013.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==12)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==12)) ? true:false
}
Image {
    id: sitenext1014
    x:1200 ; y: 180
    source: "localstation/sitenow014.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==11)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==11)) ? true:false
}
Image {
    id: sitenext1015
    x:1250; y: 180
    source:  "localstation/sitenow015.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==10)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==10)) ? true:false
}
Image {
    id: sitenext1016
    x:1200 ; y: 180
    source:  "localstation/sitenow016.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==9)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==9)) ? true:false
}
Image {
    id: sitenext1017
    x:1250 ; y: 180
    source:  "localstation/sitenow017.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==8)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==8)) ? true:false
}
Image {
    id: sitenext1018
    x:1210 ; y: 180
    source:  "localstation/sitenow018.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==7)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==7)) ? true:false
}
Image {
    id: sitenext1019
    x:1200 ; y: 180
    source:  "localstation/sitenow019.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==6)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==6)) ? true:false
}
Image {
    id: sitenext1020
    x:1220; y: 180
    source:  "localstation/sitenow020.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==5)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==5)) ? true:false
}
Image {
    id: sitenext1021
    x:1250 ; y: 180
    source:  "localstation/sitenow021.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==4)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==4)) ? true:false
}
Image {
    id: sitenext1022
    x:1230 ; y: 180
    source:  "localstation/sitenow022.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==3)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==3)) ? true:false
}
Image {
    id: sitenext1023
    x:1200; y: 180
    source:  "localstation/sitenow023.png"
    visible:downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==2)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==2)) ? true:false
}
Image {
    id: sitenext1024
    x:1230 ; y: 180
    source:  "localstation/sitenow024.png"
    visible: false /*downstream==1&&((endstation==startstation+2&&endstation==nextstation+1&&endstation==1)||(endstation>startstation+2&&endstation>nextstation+1&&nextstation==6)) ? true:false*/
}


//Image {
//    id: sitepass1001
//    x:1250 ; y: 180
//    source: "localstation/sitepass001.png"
//    visible: false
//}
//Image {
//    id: sitepass1002
//    x:1230 ; y: 180
//    source: "localstation/sitepass002.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==4))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==3))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==24)) ?true:false
//}

//Image {
//    id: sitepass1003
//    x:1230 ; y: 180
//    source: "localstation/sitepass003.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==5))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==4))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==23)) ?true:false
//}
//Image {
//    id: sitepass1004
//    x:1230 ; y: 180
//    source: "localstation/sitepass004.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==6))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==5))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==22)) ?true:false
//}

//Image {
//    id: sitepass1005
//    x:1230 ; y: 180
//    source: "localstation/sitepass005.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==7))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==6))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==21)) ?true:false
//}
//Image {
//    id: sitepass1006
//    x:1250 ; y: 180
//    source: "localstation/sitepass006.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==8))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==7))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==20)) ?true:false
//}
//Image {
//    id: sitepass1007
//    x:1230 ; y: 180
//    source: "localstation/sitepass007.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==9))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==8))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==19)) ?true:false
//}
//Image {
//    id: sitepass1008
//    x:1230 ; y: 180
//    source: "localstation/sitepass008.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==10))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==9))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==18)) ?true:false
//}
//Image {
//    id: sitepass1009
//    x:1230 ; y: 180
//    source: "localstation/sitepass009.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==11))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==10))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==17)) ?true:false
//}
//Image {
//    id: sitepass1010
//    x:1230 ; y: 180
//    source: "localstation/sitepass010.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==12))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==11))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==16)) ?true:false
//}
//Image {
//    id: sitepass1011
//    x:1195 ; y: 180
//    source: "localstation/sitepass011.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==13))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==12))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==15)) ?true:false
//}
//Image {
//    id: sitepass1012
//    x:1180 ; y: 180
//    source: "localstation/sitepass012.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==14))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==13))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==14)) ?true:false
//}
//Image {
//    id: sitepass1013
//    x:1170 ; y: 180
//    source: "localstation/sitepass013.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==15))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==14))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==13)) ?true:false
//}
//Image {
//    id: sitepass1014
//    x:1180 ; y: 180
//    source: "localstation/sitepass014.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==16))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==15))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==12)) ?true:false
//}
//Image {
//    id: sitepass1015
//    x:1230 ; y: 180
//    source: "localstation/sitepass015.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==17))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==16))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==11)) ?true:false
//}
//Image {
//    id: sitepass1016
//    x:1180 ; y: 180
//    source: "localstation/sitepass016.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==18))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==17))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==10)) ?true:false
//}
//Image {
//    id: sitepass1017
//    x:1230 ; y: 180
//    source: "localstation/sitepass017.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==19))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==18))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==9)) ?true:false
//}
//Image {
//    id: sitepass1018
//    x:1190 ; y: 180
//    source: "localstation/sitepass018.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==20))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==19))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==8)) ?true:false
//}
//Image {
//    id: sitepass1019
//    x:1180 ; y: 180
//    source: "localstation/sitepass019.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==21))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==20))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==7)) ?true:false
//}
//Image {
//    id: sitepass1020
//    x:1190 ; y: 180
//    source: "localstation/sitepass020.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==22))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==21))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==6)) ?true:false
//}
//Image {
//    id: sitepass1021
//    x:1230 ; y: 180
//    source: "localstation/sitepass021.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==23))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==22))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==5)) ?true:false
//}
//Image {
//    id: sitepass1022
//    x:1200 ; y: 180
//    source: "localstation/sitepass022.png"
//    visible:(upstream==1&&((endstation>(startstation+2)&&(endstation<nextstation+2)&&(endstation==24))||((endstation==(startstation+2)&&(nextstation==endstation)&&nextstation==23))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==4)) ?true:false
//}

//Image {
//    id: sitepass1023
//    x:1180 ; y: 180
//    source: "localstation/sitepass023.png"
//    visible:(upstream==1&&(endstation==(startstation+2)&&nextstation==24)) ?true:false
//}
//Image {
//    id: sitepass1024
//    x:1200 ; y: 180
//    source: "localstation/sitepass024.png"
//    visible:false
//}

Image {
    id: sitenow1001
    x:1250; y: 180
    source: "localstation/sitenow001.png"
    visible: upstream==1&&(endstation==(startstation+1)&&(nextstation==24)) ? true:false
}

Image {
    id: sitenow1002
    x:1250; y: 180
    source: "localstation/sitenow002.png"
    visible:(upstream==1&&(nextstation==2))||(downstream==1&&((endstation==startstation+2&&endstation==nextstation&&nextstation==23)||(endstation>(startstation+2)&&endstation>nextstation&&nextstation==23))) ? true:false
}

Image {
    id: sitenow1003
    x:1250 ; y: 180
    source: "localstation/sitenow003.png"
    visible:(upstream==1&&nextstation==3&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==22&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1004
    x:1250 ; y: 180
    source: "localstation/sitenow004.png"
    visible:(upstream==1&&nextstation==4&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==21&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1005
    x:1250 ; y: 180
    source: "localstation/sitenow005.png"
    visible:(upstream==1&&nextstation==5&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==20&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
    //( upstream==1&&((endstation>(startstation+2)&&(endstation==7))||((endstation==(startstation+2)&&nextstation==6))))||(downstream==1&&(endstation>(startstation+2)&&(endstation==nextstation)&&nextstation==25)) ?true:false
}
Image {
    id: sitenow1006
    x:1270 ; y: 180
    source: "localstation/sitenow006.png"
    visible:(upstream==1&&nextstation==6&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==19&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1007
    x:1250 ; y: 180
    source: "localstation/sitenow007.png"
    visible:(upstream==1&&nextstation==7&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==18&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1008
    x:1250 ; y: 180
    source: "localstation/sitenow008.png"
    visible:(upstream==1&&nextstation==8&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==17&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1009
    x:1250 ; y: 180
    source: "localstation/sitenow009.png"
    visible:(upstream==1&&nextstation==9&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==16&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1010
    x:1250 ; y: 180
    source: "localstation/sitenow010.png"
    visible:(upstream==1&&nextstation==10&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==15&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1011
    x:1230 ; y: 180
    source: "localstation/sitenow011.png"
    visible:(upstream==1&&nextstation==11&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==14&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1012
    x:1200 ; y: 180
    source: "localstation/sitenow012.png"
    visible:(upstream==1&&nextstation==12&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==13&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1013
    x:1180 ; y: 190
    source: "localstation/sitenow013.png"
    visible:(upstream==1&&nextstation==13&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==12&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1014
    x:1200 ; y: 180
    source: "localstation/sitenow014.png"
    visible:(upstream==1&&nextstation==14&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==11&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1015
    x:1250; y: 180
    source: "localstation/sitenow015.png"
    visible:(upstream==1&&nextstation==15&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==10&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1016
    x:1200 ; y: 180
    source: "localstation/sitenow016.png"
    visible:(upstream==1&&nextstation==16&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==9&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1017
    x:1250 ; y: 180
    source: "localstation/sitenow017.png"
    visible:(upstream==1&&nextstation==17&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==8&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1018
    x:1210 ; y: 180
    source: "localstation/sitenow018.png"
    visible:(upstream==1&&nextstation==18&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==7&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1019
    x:1200 ; y: 180
    source: "localstation/sitenow019.png"
    visible:(upstream==1&&nextstation==19&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==6&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1020
    x:1220 ; y: 180
    source: "localstation/sitenow020.png"
    visible:(upstream==1&&nextstation==20&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==5&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1021
    x:1250 ; y: 180
    source: "localstation/sitenow021.png"
    visible:(upstream==1&&nextstation==21&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==4&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1022
    x:1230 ; y: 180
    source: "localstation/sitenow022.png"
    visible:(upstream==1&&nextstation==22&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2)||(endstation>startstation+2&&nextstation+2<=endstation)))||(downstream==1&&nextstation==3&&((endstation==startstation+2&&nextstation==endstation)||(endstation>startstation+2&&endstation==nextstation+1))) ? true:false
}
Image {
    id: sitenow1023
    x:1200 ; y: 180
    source: "localstation/sitenow023.png"
    visible:(upstream==1&&nextstation==23/*&&((endstation==startstation+1)||(endstation==startstation+1&&endstation==nextstation+2))*/) ? true:false
}
Image {
    id: sitenow1024
    x:1230 ; y: 180
    source: "localstation/sitenow024.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==24) ? true:false
}
/********************setpass2****************************/
Image {
    id: sitenext3001
    x: 1620 ; y:190
    source: "localstation/sitenext001.png"
    visible:upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==1)||(endstation==nextstation+1&&endstation==1))) ? true:false
}
Image {
    id: sitenext3002
    x: 1650 ; y:190
    source:  "localstation/sitenext002.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==2)||(endstation==nextstation+1&&endstation==2)))) ? true:false
}
Image {
    id: sitenext3003
    x: 1650; y:190
    source:  "localstation/sitenext003.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==3)||(endstation==nextstation+1&&endstation==3)))) ? true:false
}
Image {
    id: sitenext3004
    x: 1650; y:190
    source:  "localstation/sitenext004.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==4)||(endstation==nextstation+1&&endstation==4)))) ? true:false
}
Image {
    id: sitenext3005
    x: 1650; y:190
    source:  "localstation/sitenext005.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==5)||(endstation==nextstation+1&&endstation==5)))) ? true:false
}
Image {
    id: sitenext3006
    x: 1670; y:190
    source:  "localstation/sitenext006.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==6)||(endstation==nextstation+1&&endstation==6)))) ? true:false
}
Image {
    id: sitenext3007
    x: 1650; y:190
    source: "localstation/sitenext007.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==7)||(endstation==nextstation+1&&endstation==7))))? true:false
}
Image {
    id: sitenext3008
    x: 1650; y:190
    source:  "localstation/sitenext008.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==8)||(endstation==nextstation+1&&endstation==8)))) ? true:false
}
Image {
    id: sitenext3009
    x: 1650; y:190
    source:  "localstation/sitenext009.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==9)||(endstation==nextstation+1&&endstation==9)))) ? true:false
}
Image {
    id: sitenext3010
    x: 1650; y:190
    source: "localstation/sitenext010.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==10)||(endstation==nextstation+1&&endstation==10)))) ? true:false
}
Image {
    id: sitenext3011
    x: 1630; y:190
    source:  "localstation/sitenext011.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==11)||(endstation==nextstation+1&&endstation==11)))) ? true:false
}
Image {
    id: sitenext3012
    x: 1630; y:190
    source:  "localstation/sitenext012.png"
    visible: (upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==12)||(endstation==nextstation+1&&endstation==12)))) ? true:false
}
Image {
    id: sitenext3013
    x: 1610; y:190
    source:  "localstation/sitenext013.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==13)||(endstation==nextstation+1&&endstation==13)))) ? true:false
}
Image {
    id: sitenext3014
    x: 1630; y:190
    source: "localstation/sitenext014.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==14)||(endstation==nextstation+1&&endstation==14)))) ? true:false
}
Image {
    id: sitenext3015
    x: 1650; y:190
    source: "localstation/sitenext015.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==15)||(endstation==nextstation+1&&endstation==15)))) ? true:false
}
Image {
    id: sitenext3016
    x: 1630; y:190
    source:  "localstation/sitenext016.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==16)||(endstation==nextstation+1&&endstation==16)))) ? true:false
}
Image {
    id: sitenext3017
    x: 1650; y:190
    source:  "localstation/sitenext017.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==17)||(endstation==nextstation+1&&endstation==17)))) ? true:false
}
Image {
    id: sitenext3018
    x: 1630; y:190
    source:  "localstation/sitenext018.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==18)||(endstation==nextstation+1&&endstation==18)))) ? true:false
}
Image {
    id: sitenext3019
    x: 1630; y:190
    source:  "localstation/sitenext019.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==19)||(endstation==nextstation+1&&endstation==19)))) ? true:false
}
Image {
    id: sitenext3020
    x: 1630; y:190
    source:  "localstation/sitenext020.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==20)||(endstation==nextstation+1&&endstation==20)))) ? true:false
}
Image {
    id: sitenext3021
    x: 1650; y:190
    source: "localstation/sitenext021.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==21)||(endstation==nextstation+1&&endstation==21)))) ? true:false
}
Image {
    id: sitenext3022
    x: 1640; y:190
    source: "localstation/sitenext022.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==22)||(endstation==nextstation+1&&endstation==22)))) ? true:false
}
Image {
    id: sitenext3023
    x: 1630; y:190
    source: "localstation/sitenext023.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==23)||(endstation==nextstation+1&&endstation==23)))) ? true:false
}
Image {
    id: sitenext3024
    x: 1640; y:190
    source:  "localstation/sitenext024.png"
    visible:(upstream==1&&((endstation-startstation)>2&&((endstation>nextstation+1&&nextstation+1==24)||(endstation==nextstation+1&&endstation==24)))) ? true:false
}

Image {
    id: sitepass3001
    x: 1620; y:190
    source: "localstation/sitepass001.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==24)||(nextstation<=endstation-2&&nextstation-1==24)))||((endstation-startstation)<=2&&startstation==24) ) ? true:false
}
Image {
    id: sitepass3002
    x: 1650; y:190
    source: "localstation/sitepass002.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==23)||(nextstation<=endstation-2&&nextstation-1==23)))||((endstation-startstation)<=2&&startstation==23) ) ? true:false
}
Image {
    id: sitepass3003
    x: 1650; y:190
    source: "localstation/sitepass003.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==22)||(nextstation<=endstation-2&&nextstation-1==22)))||((endstation-startstation)<=2&&startstation==22) ) ? true:false
}
Image {
    id: sitepass3004
    x: 1650; y:190
    source: "localstation/sitepass004.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==21)||(nextstation<=endstation-2&&nextstation-1==21)))||((endstation-startstation)<=2&&startstation==21) ) ? true:false
}
Image {
    id: sitepass3005
    x: 1650; y:190
    source:"localstation/sitepass005.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==20)||(nextstation<=endstation-2&&nextstation-1==20)))||((endstation-startstation)<=2&&startstation==20) ) ? true:false
}
Image {
    id: sitepass3006
    x: 1670; y:190
    source: "localstation/sitepass006.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==19)||(nextstation<=endstation-2&&nextstation-1==19)))||((endstation-startstation)<=2&&startstation==19) ) ? true:false
}
Image {
    id: sitepass3007
    x: 1650; y:190
    source:"localstation/sitepass007.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==18)||(nextstation<=endstation-2&&nextstation-1==18)))||((endstation-startstation)<=2&&startstation==18) ) ? true:false
}
Image {
    id: sitepass3008
    x: 1650; y:190
    source: "localstation/sitepass008.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==17)||(nextstation<=endstation-2&&nextstation-1==17)))||((endstation-startstation)<=2&&startstation==17) ) ? true:false
}
Image {
    id: sitepass3009
    x: 1650; y:190
    source: "localstation/sitepass009.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==16)||(nextstation<=endstation-2&&nextstation-1==16)))||((endstation-startstation)<=2&&startstation==16) ) ? true:false
}
Image {
    id: sitepass3010
    x: 1650; y:190
    source: "localstation/sitepass010.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==15)||(nextstation<=endstation-2&&nextstation-1==15)))||((endstation-startstation)<=2&&startstation==15) ) ? true:false
}
Image {
    id: sitepass3011
    x: 1630; y:190
    source: "localstation/sitepass011.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==14)||(nextstation<=endstation-2&&nextstation-1==14)))||((endstation-startstation)<=2&&startstation==14) ) ? true:false
}
Image {
    id: sitepass3012
    x: 1630; y:190
    source: "localstation/sitepass012.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==13)||(nextstation<=endstation-2&&nextstation-1==13)))||((endstation-startstation)<=2&&startstation==13) ) ? true:false
}
Image {
    id: sitepass3013
    x: 1610; y:190
    source: "localstation/sitepass013.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==12)||(nextstation<=endstation-2&&nextstation-1==12)))||((endstation-startstation)<=2&&startstation==12) ) ? true:false
}
Image {
    id: sitepass3014
    x: 1630; y:190
    source:"localstation/sitepass014.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==11)||(nextstation<=endstation-2&&nextstation-1==11)))||((endstation-startstation)<=2&&startstation==11) ) ? true:false
}
Image {
    id: sitepass3015
    x: 1650; y:190
    source: "localstation/sitepass015.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==10)||(nextstation<=endstation-2&&nextstation-1==10)))||((endstation-startstation)<=2&&startstation==10) ) ? true:false
}
Image {
    id: sitepass3016
    x: 1630; y:190
    source: "localstation/sitepass016.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==9)||(nextstation<=endstation-2&&nextstation-1==9)))||((endstation-startstation)<=2&&startstation==9) ) ? true:false
}
Image {
    id: sitepass3017
    x: 1650; y:190
    source: "localstation/sitepass017.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==8)||(nextstation<=endstation-2&&nextstation-1==8)))||((endstation-startstation)<=2&&startstation==8) ) ? true:false
}
Image {
    id: sitepass3018
    x: 1630; y:190
    source:"localstation/sitepass018.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==7)||(nextstation<=endstation-2&&nextstation-1==7)))||((endstation-startstation)<=2&&startstation==7) ) ? true:false
}
Image {
    id: sitepass3019
    x: 1630; y:190
    source: "localstation/sitepass019.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==6)||(nextstation<=endstation-2&&nextstation-1==6)))||((endstation-startstation)<=2&&startstation==6) ) ? true:false
}
Image {
    id: sitepass3020
    x:1630; y:190
    source: "localstation/sitepass020.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==5)||(nextstation<=endstation-2&&nextstation-1==5)))||((endstation-startstation)<=2&&startstation==5) ) ? true:false
}
Image {
    id: sitepass3021
    x: 1650 ; y:190
    source:"localstation/sitepass021.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==4)||(nextstation<=endstation-2&&nextstation-1==4)))||((endstation-startstation)<=2&&startstation==4) ) ? true:false
}
Image {
    id: sitepass3022
    x: 1640; y:190
    source:"localstation/sitepass022.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==3)||(nextstation<=endstation-2&&nextstation-1==3)))||((endstation-startstation)<=2&&startstation==3) ) ? true:false
}
Image {
    id: sitepass3023
    x: 1630; y:190
    source: "localstation/sitepass023.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==2)||(nextstation<=endstation-2&&nextstation-1==2)))||((endstation-startstation)<=2&&startstation==2) ) ? true:false
}
Image {
    id: sitepass3024
    x: 1640; y:190
    source: "localstation/sitepass024.png"
    visible: downstream==1&&(((endstation-startstation)>2&&((nextstation>endstation-2&&endstation-2==1)||(nextstation<=endstation-2&&nextstation-1==1)))||((endstation-startstation)<=2&&startstation==1) ) ? true:false
}

Image {
    id: sitenow3001
    x: 1620; y:190
    source: "localstation/sitenow001.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==1) ? true:false
}
Image {
    id: sitenow3002
    x: 1650; y:190
    source: "localstation/sitenow002.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==2) ? true:false
}
Image {
    id: sitenow3003
    x: 1650; y:190
    source:  "localstation/sitenow003.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==3) ? true:false
}
Image {
    id: sitenow3004
    x: 1650; y:190
    source:  "localstation/sitenow004.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==4) ? true:false
}
Image {
    id: sitenow3005
    x: 1650; y:190
    source:  "localstation/sitenow005.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==5) ? true:false
}
Image {
    id: sitenow3006
    x: 1670; y:190
    source:  "localstation/sitenow006.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==6) ? true:false
}
Image {
    id: sitenow3007
    x: 1650; y:190
    source:  "localstation/sitenow007.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==7) ? true:false
}
Image {
    id: sitenow3008
    x: 1650; y:190
    source:  "localstation/sitenow008.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==8) ? true:false
}
Image {
    id: sitenow3009
    x: 1650; y:190
    source:  "localstation/sitenow009.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==9) ? true:false
}
Image {
    id: sitenow3010
    x: 1650; y:190
    source: "localstation/sitenow010.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==10) ? true:false
}
Image {
    id: sitenow3011
    x: 1630; y:190
    source:  "localstation/sitenow011.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==11) ? true:false
}
Image {
    id: sitenow3012
    x:1630; y:190
    source: "localstation/sitenow012.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==12) ? true:false
}
Image {
    id: sitenow3013
    x: 1610; y:190
    source:  "localstation/sitenow013.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==13) ? true:false
}
Image {
    id: sitenow3014
    x: 1630; y:190
    source:  "localstation/sitenow014.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==14) ? true:false
}
Image {
    id: sitenow3015
    x: 1650; y:190
    source:  "localstation/sitenow015.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==15) ? true:false
}
Image {
    id: sitenow3016
    x: 1630; y:190
    source:  "localstation/sitenow016.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==16) ? true:false
}
Image {
    id: sitenow3017
    x: 1650; y:190
    source: "localstation/sitenow017.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==17) ? true:false
}
Image {
    id: sitenow3018
    x: 1630; y:190
    source:  "localstation/sitenow018.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==18) ? true:false
}
Image {
    id: sitenow3019
    x: 1630; y:190
    source: "localstation/sitenow019.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==19) ? true:false
}
Image {
    id: sitenow3020
    x: 1630; y:190
    source:  "localstation/sitenow020.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==20) ? true:false
}
Image {
    id: sitenow3021
    x: 1650; y:190
    source: "localstation/sitenow021.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==21) ? true:false
}
Image {
    id: sitenow3022
    x: 1640; y:190
    source:  "localstation/sitenow022.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==22) ? true:false
}
Image {
    id: sitenow3023
    x: 1630; y:190
    source: "localstation/sitenow023.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==23) ? true:false
}
Image {
    id: sitenow303024
    x:1640; y:190
    source: "localstation/sitenow024.png"
    visible:upstream==1&&((endstation-startstation)>2&&endstation==nextstation&&nextstation==24) ? true:false
}
}

