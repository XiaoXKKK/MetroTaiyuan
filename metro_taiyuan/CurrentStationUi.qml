
import QtQuick 2.12

import "CustomControl"


Item {
    id: currentstationui
    width: 1920
    height: 360
    property int startstation         //startingStation
    property int ttsstartstation;
    property int currentstation ;     //currentStation
    property int endstation     ;     //terminalStation
    property int ttsendstation  ;
    property int nextstation    ;     //nextSta tion
    property int thisidedoor          //thissidedoor
    property int opposotedoor         //opposotedoor
    property int upstream
    property int downstream
    property int stationid
/****************Frame*******************/
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
/****************tts-doorOpen*******************/
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
       visible:/* thisidedoor==1 ? true:false*/thisidedoor==1&&thisidedoor!==0 ? true:false
    }

    Image {
        id: doorclose
        x: 1595; y: 20
        source: "map_mark/tts-doorclose.png"
        visible: opposotedoor==1&&opposotedoor!==0&&thisidedoor==0 ? true:false
    }
    Image {
        id: closedoor
        x:1515; y:10
        source: "map_mark/tts-closedoor.png"
        visible: thisidedoor==0&&opposotedoor==1 ? true:false/*opposotedoor==1&&opposotedoor!=0&&thisidedoor===0 ? true:false*/
    }

    Image {
        id: gate10
        x:1790; y:23
        source: "map_mark/tts-gate10.png"
        visible: (thisidedoor==1&&thisidedoor!==0)||(opposotedoor==1&&opposotedoor!=0&&thisidedoor===0)
    }
/****************opendoor*******************/
    AnimatedImage {
        id: opendoor1
        x:50; y:110
        source: "map_mark/opendoor.gif"
        visible:  thisidedoor==1 ? true:false/*thisidedoor==1&&thisidedoor!=0 ? true:false*/
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
        x: 1040; y: 22
        source: "map_mark/tts-nowpic.png"
        width:  source.width
        height: source.height
        visible: true
    }
/********************lightbg****************************/

    Image {
        id: lightbg
         x:900; y:110
         width: 1000; height: 220
         source: "map_mark/lightbg.png"
         visible: true
     }
/****************Sitename001*******************/

    Image {
        id: sitename001
        x: 1190; y: 22
        source: "topstation/tts-sitename001.png"
        visible:(upstream==1&&currentstation==1)||(downstream==1&&currentstation==24) ? true:false
    }
    Image {
        id: sitenow001
        x: 920; y:160
        source: "arrivedstation/sitenow001.png"
         visible: (upstream==1&&currentstation==1)||(downstream==1&&currentstation==24) ? true:false
    }
/****************Sitename002*******************/

    Image {
        id: sitename002
        x: 1190; y: 22
        source: "topstation/tts-sitename002.png"
        visible: (upstream==1&&currentstation==2)||(downstream==1&&currentstation==23) ? true:false
    }
    Image {
        id: sitenow002
        x: 950; y:160
        source: "arrivedstation/sitenow002.png"
         visible: (upstream==1&&currentstation==2)||(downstream==1&&currentstation==23) ? true:false
    }
/****************Sitename003*******************/

    Image {
        id: sitename003
        x: 1190; y: 22
        source: "topstation/tts-sitename003.png"
        visible: (upstream==1&&currentstation==3)||(downstream==1&&currentstation==22) ? true:false
    }
    Image {
        id: sitenow003
        x: 950; y:160
        source: "arrivedstation/sitenow003.png"
         visible: (upstream==1&&currentstation==3)||(downstream==1&&currentstation==22) ? true:false
    }
/****************Sitename004*******************/

    Image {
        id: sitename004
        x: 1190; y: 22
        source: "topstation/tts-sitename004.png"
        visible: (upstream==1&&currentstation==4)||(downstream==1&&currentstation==21) ? true:false
    }
    Image {
        id: sitenow004
        x: 950; y:160
        source: "arrivedstation/sitenow004.png"
         visible: (upstream==1&&currentstation==4)||(downstream==1&&currentstation==21) ? true:false
    }
/****************Sitename005*******************/

    Image {
        id: sitename005
        x: 1190; y: 22
        source: "topstation/tts-sitename005.png"
        visible: (upstream==1&&currentstation==5)||(downstream==1&&currentstation==20) ? true:false
    }
    Image {
        id: sitenow005
        x: 950; y:160
        source: "arrivedstation/sitenow005.png"
         visible: (upstream==1&&currentstation==5)||(downstream==1&&currentstation==20) ? true:false
    }
/****************Sitename006*******************/

    Image {
        id: sitename006
        x: 1190; y: 22
        source: "topstation/tts-sitename006.png"
        visible: (upstream==1&&currentstation==6)||(downstream==1&&currentstation==19) ? true:false
    }
    Image {
        id: sitenow006
        x: 980; y:160
        source: "arrivedstation/sitenow006.png"
         visible: (upstream==1&&currentstation==6)||(downstream==1&&currentstation==19) ? true:false
    }
/****************Sitename007*******************/

    Image {
        id: sitename007
        x: 1190; y: 22
        source: "topstation/tts-sitename007.png"
        visible: (upstream==1&&currentstation==7)||(downstream==1&&currentstation==18) ? true:false
    }
    Image {
        id: sitenow007
        x: 950; y:160
        source: "arrivedstation/sitenow007.png"
         visible: (upstream==1&&currentstation==7)||(downstream==1&&currentstation==18) ? true:false
    }
/****************Sitename008*******************/

    Image {
        id: sitename008
        x: 1190; y: 22
        source: "topstation/tts-sitename008.png"
        visible: (upstream==1&&currentstation==8)||(downstream==1&&currentstation==17) ? true:false
    }
    Image {
        id: sitenow008
        x: 950; y:160
        source: "arrivedstation/sitenow008.png"
         visible: (upstream==1&&currentstation==8)||(downstream==1&&currentstation==17) ? true:false
    }
/****************Sitename009*******************/

    Image {
        id: sitename009
        x: 1190; y: 22
        source: "topstation/tts-sitename009.png"
        visible: (upstream==1&&currentstation==9)||(downstream==1&&currentstation==16) ? true:false
    }
    Image {
        id: sitenow009
        x: 950; y:160
        source: "arrivedstation/sitenow009.png"
         visible:(upstream==1&&currentstation==9)||(downstream==1&&currentstation==16) ? true:false
    }
    Image {
        id: changepic
        x:1500 ; y:190
        source: "map_mark/changepic.png"
        visible: (upstream==1&&currentstation==9)||(downstream==1&&currentstation==16) ? true:false
    }
    Image {
        id: changepicline2
        x:1660 ; y:170
        source: "map_mark/changeline2.png"
        visible: (upstream==1&&currentstation==9)||(downstream==1&&currentstation==16) ? true:false
    }
/****************Sitename010*******************/

    Image {
        id: sitename010
        x: 1190; y: 22
        source: "topstation/tts-sitename010.png"
        visible: (upstream==1&&currentstation==10)||(downstream==1&&currentstation==15) ? true:false
    }
    Image {
        id: sitenow010
        x: 950; y:160
        source: "arrivedstation/sitenow010.png"
         visible: (upstream==1&&currentstation==10)||(downstream==1&&currentstation==15) ? true:false
    }
/****************Sitename011*******************/

    Image {
        id: sitename011
        x: 1190; y: 22
        source: "topstation/tts-sitename011.png"
        visible: (upstream==1&&currentstation==11)||(downstream==1&&currentstation==14) ? true:false
    }
    Image {
        id: sitenow011
        x: 920; y:160
        source: "arrivedstation/sitenow011.png"
         visible: (upstream==1&&currentstation==11)||(downstream==1&&currentstation==14) ? true:false
    }
/****************Sitename012*******************/

    Image {
        id: sitename012
        x: 1190; y: 22
        source: "topstation/tts-sitename012.png"
        visible: (upstream==1&&currentstation==12)||(downstream==1&&currentstation==13) ? true:false
    }
    Image {
        id: sitenow012
        x: 920; y:160
        source: "arrivedstation/sitenow012.png"
         visible: (upstream==1&&currentstation==12)||(downstream==1&&currentstation==13) ? true:false
    }
/****************Sitename013*******************/

    Image {
        id: sitename013
        x: 1190; y: 22
        source: "topstation/tts-sitename013.png"
        visible: (upstream==1&&currentstation==13)||(downstream==1&&currentstation==12) ? true:false
    }
    Image {
        id: sitenow013
        x:910; y:160
        source: "arrivedstation/sitenow013.png"
         visible: (upstream==1&&currentstation==13)||(downstream==1&&currentstation==12) ? true:false
    }
/****************Sitename014*******************/

    Image {
        id: sitename014
        x: 1190; y: 22
        source: "topstation/tts-sitename014.png"
        visible: (upstream==1&&currentstation==14)||(downstream==1&&currentstation==11) ? true:false
    }
    Image {
        id: sitenow014
        x: 930; y:160
        source: "arrivedstation/sitenow014.png"
         visible: (upstream==1&&currentstation==14)||(downstream==1&&currentstation==11) ? true:false
    }
/****************Sitename015*******************/

    Image {
        id: sitename015
        x: 1190; y: 22
        source: "topstation/tts-sitename015.png"
        visible: (upstream==1&&currentstation==15)||(downstream==1&&currentstation==10) ? true:false
    }
    Image {
        id: sitenow015
        x: 950; y:160
        source: "arrivedstation/sitenow015.png"
         visible: (upstream==1&&currentstation==15)||(downstream==1&&currentstation==10) ? true:false
    }
/****************Sitename016*******************/

    Image {
        id: sitename016
        x: 1190; y: 22
        source: "topstation/tts-sitename016.png"
        visible: (upstream==1&&currentstation==16)||(downstream==1&&currentstation==9) ? true:false
    }
    Image {
        id: sitenow016
        x: 920; y:160
        source: "arrivedstation/sitenow016.png"
         visible: (upstream==1&&currentstation==16)||(downstream==1&&currentstation==9) ? true:false
    }
/****************Sitename017*******************/

    Image {
        id: sitename017
        x: 1190; y: 22
        source: "topstation/tts-sitename017.png"
        visible: (upstream==1&&currentstation==17)||(downstream==1&&currentstation==8)? true:false
    }
    Image {
        id: sitenow017
        x: 950; y:160
        source: "arrivedstation/sitenow017.png"
         visible: (upstream==1&&currentstation==17)||(downstream==1&&currentstation==8)? true:false
    }
/****************Sitename018*******************/

    Image {
        id: sitename018
        x: 1190; y: 22
        source: "topstation/tts-sitename018.png"
        visible: (upstream==1&&currentstation==18)||(downstream==1&&currentstation==7) ? true:false
    }
    Image {
        id: sitenow018
        x: 920; y:160
        source: "arrivedstation/sitenow018.png"
         visible: (upstream==1&&currentstation==18)||(downstream==1&&currentstation==7) ? true:false
    }
/****************Sitename019*******************/

    Image {
        id: sitename019
        x: 1190; y: 22
        source: "topstation/tts-sitename019.png"
        visible: (upstream==1&&currentstation==19)||(downstream==1&&currentstation==6) ? true:false
    }
    Image {
        id: sitenow019
        x:930; y:160
        source: "arrivedstation/sitenow019.png"
         visible: (upstream==1&&currentstation==19)||(downstream==1&&currentstation==6) ? true:false
    }
/****************Sitename020*******************/

    Image {
        id: sitename020
        x: 1190; y: 22
        source: "topstation/tts-sitename020.png"
        visible: (upstream==1&&currentstation==20)||(downstream==1&&currentstation==5) ? true:false
    }
    Image {
        id: sitenow020
        x: 920; y:160
        source: "arrivedstation/sitenow020.png"
         visible: (upstream==1&&currentstation==20)||(downstream==1&&currentstation==5) ? true:false
    }
/****************Sitename021*******************/

    Image {
        id: sitename021
        x: 1190; y: 22
        source: "topstation/tts-sitename021.png"
        visible: (upstream==1&&currentstation==21)||(downstream==1&&currentstation==4) ? true:false
    }
    Image {
        id: sitenow021
        x: 950; y:160
        source: "arrivedstation/sitenow021.png"
         visible: (upstream==1&&currentstation==21)||(downstream==1&&currentstation==4) ? true:false
    }
/****************Sitename022*******************/

    Image {
        id: sitename022
        x: 1190; y: 22
        source: "topstation/tts-sitename022.png"
        visible: (upstream==1&&currentstation==22)||(downstream==1&&currentstation==3) ? true:false
    }
    Image {
        id: sitenow022
        x: 930; y:160
        source: "arrivedstation/sitenow022.png"
         visible: (upstream==1&&currentstation==22)||(downstream==1&&currentstation==3) ? true:false
    }
/****************Sitename023*******************/

    Image {
        id: sitename023
        x: 1190; y: 22
        source: "topstation/tts-sitename023.png"
        visible: (upstream==1&&currentstation==23)||(downstream==1&&currentstation==2) ? true:false
    }
    Image {
        id: sitenow023
        x: 930; y:160
        source: "arrivedstation/sitenow023.png"
         visible: (upstream==1&&currentstation==23)||(downstream==1&&currentstation==2) ? true:false
    }
/****************Sitename024*******************/

    Image {
        id: sitename024
        x: 1190; y: 22
        source: "topstation/tts-sitename024.png"
        visible:(upstream==1&&currentstation==24)||(downstream==1&&currentstation==1) ? true:false
    }
    Image {
        id: sitenow024
        x: 920; y:160
        source: "arrivedstation/sitenow024.png"
         visible: (upstream==1&&currentstation==24)||(downstream==1&&currentstation==1)? true:false
    }
}


