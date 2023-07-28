import QtQuick 2.12
import "CustomControl"
import Models.User 1.0
import "CustomControl"

Item {
    id: root
    width: 1920; height: 360
    property int startingstation;         //startingStation
    property int startstation   ;
    property int ttsstartstation
    property int terminalstation
    property int ttsendstation
    property int currentstation1
    property int currentstation ;     //currentStation
    property int endstation   ;     //terminalStation
    property int nextstation1
    property int nextstation   ;     //nextStation
    property int thisidedoor       //thissidedoor
    property int opposotedoor      //opposotedoor
    property int upstream
    property int downstream
    property int just
    property int next
    property int nextdown
    property int pass
    property int passdown
    property int passstation1
    property int passstation2
    property int passstation3
    property int passstation4
    property int passstation5
    property int passstation6
    property int passstation7
    property int passstation8
    property int passstation9
    property int passstation10
    property int passstation11
    property int passstation12
    property int passstation13
    property int passstation14
    property int passstation15
    property int passstation16
    property int passstation17
    property int passstation18
    property int passstation19
    property int passstation20
    property int passstation21
    property int passstation22
    property int passstation23
    property int passstation24
    property int passstation
    property int stationid
    property int arrive
    property int leave
    property int star
    Dynamicmap{
        id:dynamicmap
        objectName:"dynamicmap"
        anchors.centerIn: parent
        property bool switchover: true
        signal sendInterfaceMetroFrame()
        onChangeColor: console.log("qwer");
        onStartingStationSignal: {console.log("asdf"+val)
        root.startingstation=val
        }
        onTerminalStationSignal: {console.log("asdf"+val)
           root.terminalstation=val}
        onCurrentStationSignal: {console.log("asdf"+val)
            root.currentstation1=val}
        onNextStationSignal: {console.log("asdf"+val)
            root.nextstation1=val}
        onFlagSwitch_UpStream: {console.log("asdf"+val)
            root.upstream=val}
        onFlagSwitch_DownStream: {console.log("asdf"+val)
            root.downstream=val}
        onSdssd:star =1
        onFlagSwitch_Oppositedoor:{console.log("asdf"+val)
            root.opposotedoor=val}
        onFlagSwitch_Thissidedoor:{console.log("asdf"+val)
            root.thisidedoor=val}
        onFlagPassStationSignal1: {console.log("asdf"+val)
            root.passstation1=val}
        onFlagPassStationSignal2: {console.log("asdf"+val)
            root.passstation2=val}
        onFlagPassStationSignal3: {console.log("asdf"+val)
            root.passstation3=val}
        onFlagPassStationSignal4: {console.log("asdf"+val)
            root.passstation4=val}
        onFlagPassStationSignal5: {console.log("asdf"+val)
            root.passstation5=val}
        onFlagPassStationSignal6: {console.log("asdf"+val)
            root.passstation6=val}
        onFlagPassStationSignal7: {console.log("asdf"+val)
            root.passstation7=val}
        onFlagPassStationSignal8: {console.log("asdf"+val)
            root.passstation8=val}
        onFlagPassStationSignal9: {console.log("asdf"+val)
            root.passstation9=val}
        onFlagPassStationSignal10: {console.log("asdf"+val)
            root.passstation10=val}
        onFlagPassStationSignal11: {console.log("asdf"+val)
            root.passstation11=val}
        onFlagPassStationSignal12: {console.log("asdf"+val)
            root.passstation12=val}
        onFlagPassStationSignal13: {console.log("asdf"+val)
            root.passstation13=val}
        onFlagPassStationSignal14: {console.log("asdf"+val)
            root.passstation14=val}
        onFlagPassStationSignal15: {console.log("asdf"+val)
            root.passstation15=val}
        onFlagPassStationSignal16: {console.log("asdf"+val)
            root.passstation16=val}
        onFlagPassStationSignal17: {console.log("asdf"+val)
            root.passstation17=val}
        onFlagPassStationSignal18: {console.log("asdf"+val)
            root.passstation18=val}
        onFlagPassStationSignal19: {console.log("asdf"+val)
            root.passstation19=val}
        onFlagPassStationSignal20: {console.log("asdf"+val)
            root.passstation20=val}
        onFlagPassStationSignal21: {console.log("asdf"+val)
            root.passstation21=val}
        onFlagPassStationSignal22: {console.log("asdf"+val)
            root.passstation22=val}
        onFlagPassStationSignal23: {console.log("asdf"+val)
            root.passstation23=val}
        onFlagPassStationSignal24: {console.log("asdf"+val)
            root.passstation24=val}
        onToQml: {
            switchover = val
        }
        onFlagTrigger_PreArrivalStation: {
            if(val==1)
            {
                if(switchover==true)
                {
                    mytimerMetroFrame.stop()
                    mytimerNextStationUi.stop()
                    mytimerMetroFrame.timerup = 0
                    mytimerNextStationUi.timerup = 0
                    mytimerMetroFrame.switchinter = false
                    mytimerNextStationUi.switchinter = false
                    sendInterfaceMetroFrame()
                    mytimerMetroFrame.start()

                }
            }
            else if(val == 0)
            {

            }
        }
        onFlagTrigger_ArrivalStation:{//到站
            if(val == 1)
            {
                mytimerMetroFrame.stop()
                mytimerMetroFrame.switchinter = true
                mytimerNextStationUi.stop()
                mytimerNextStationUi.switchinter = true
                currentstationui.visible = true
                nextstationui.visible = false
                root.visible = false

            }
            else if(val == 0)
            {

            }
        }
        onSendInterfaceMetroFrame: {
            root.visible = true
            currentstationui.visible = false
            nextstationui.visible = false
        }

    Timer{
        id:mytimerMetroFrame;
        interval: 1000; //定时周期
        repeat:true;    //
        property int timerup : 0
        property int time : 20
        triggeredOnStart: true;
        signal sendInterfaceMetroFrame()
        property bool switchinter : true
        onTriggered: {
            timerup++
            if(timerup == time)
            {
                if(time == 20)
                {
                    mytimerMetroFrame.stop()
                    sendInterfaceMetroFrame()
                    mytimerNextStationUi.start()
                    timerup = 0;
                }
            }
        }
        onSendInterfaceMetroFrame: {
            root.visible = false

            currentstationui.visible = false
            nextstationui.visible = true
        }
    }

    Timer{
        id:mytimerNextStationUi;
        interval: 1000; //定时周期
        repeat:true;    //
        property int timerup : 0
        property int time : 10
        triggeredOnStart: true;
        signal sendInterfaceNextStationUi()
        property bool switchinter : true
        onTriggered:{
            timerup++
            if(timerup == time)
            {
                if(time == 10)
                {
                    mytimerNextStationUi.stop()
                    sendInterfaceNextStationUi()
                    mytimerMetroFrame.start()
                    timerup = 0;
                }
            }
        }
        onSendInterfaceNextStationUi:{
            root.visible = true
            currentstationui.visible = false
            nextstationui.visible = false
        }
    }
    }

/**********************frame******************/

    Image {
        id: imagebackground
        source: "map_mark/bgimage.png"
        width: source.widthr
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
//        visible: downstream==1||(root.startingstation>root.terminalstation) ? true:false
//    }
//    AnimatedImage {
//        id: ttsarrowr
//        x: 680; y: 20
//        source: "map_mark/tts-arrowr.gif"
//        visible : upstream==1||(root.startingstation<root.terminalstation) ? true:false
//    }
    Image {
        x:60; y: 17
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
        x: 1595; y: 20
        source: "map_mark/tts-doorclose.png"
        visible: opposotedoor==1&&opposotedoor!==0&&thisidedoor==0 ? true:false
    }
    Image {
        id: closedoor
        x:1515; y:10
        source: "map_mark/tts-closedoor.png"
        visible:opposotedoor==1&&opposotedoor!=0&&thisidedoor===0 ? true:false
    }

    Image {
        id: gate10
        x:1790; y:23
        source: "map_mark/tts-gate10.png"
        visible: (thisidedoor==1&&thisidedoor!==0)||(opposotedoor==1&&opposotedoor!=0&&thisidedoor===0)
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
/**********************nextpic******************/

    Image {
         x: 1050; y: 22
         source: "map_mark/tts-nextpic.png"
        width:  source.width
        height: source.height
        asynchronous: true
    }
/**********************rail001******************/
    Image {
            id: sitepass001
            x: 70; y:120
            source: "globalstation/sitepass001.png"
            visible: upstream==1 ? true:false
        }
    Image {
            id: sitenext001
            x: 70; y: 120
            source: "globalstation/sitenext001.png"
            visible: upstream==1&&1>nextstation&&1<=endstation ? true:false
        }
    Image {
        id: sitepassdown001
        x: 70; y: 120
        source: "globalstation/sitepassdown024.png"
        visible: downstream==1 ? true:false
       }
    Image {
        id: sitenextdown001
        x: 70; y: 120
        source: "globalstation/sitenextdown024.png"
        visible: downstream==1&&1>nextstation&&1<=endstation ? true:false
    }
    Image {
        id: railpass001
        x: 90 ; y:80
        source: "map_mark/railpass001.png"
        visible: true
    }
    Image {
        id: railnext001
        x:90; y: 80
        source: "map_mark/railnext001.png"
        visible: (nextstation-1)<=1&&1<=endstation ? true:false
    }
    Image {
        id: statepassr01
        x: 70; y: 80
        source: "map_mark/statepassr.png"
        visible: nextstation>1&&1>=startstation ? true:false
    }
    Image {
        id: statenextr01
        x:70; y: 80
        source: "map_mark/statenextr.png"
         visible: nextstation<1&&1<=endstation ? true:false
    }
    Image {
        id: statenorun1
        x: 70; y: 80
        source: "map_mark/statenorun.png"
        visible: (1<startstation|1>endstation)||(upstream==1&&passstation1==1)||(downstream==1&&passstation30==30) ? true:false
    }



/**********************rail002******************/
    Image {
        id: sitenow002
        x:147 ; y:120
        source: "globalstation/sitenow002.png"
        visible: upstream==1&&nextstation==2&&(startstation<2<=endstation)? true:false
    }
    Image {
        id: sitenext002
        x: 147; y: 120
        source: "globalstation/sitenext002.png"
        visible: upstream==1&&(2>nextstation&&2<=endstation&&passstation2!==2) ? true:false
    }
    Image {
        id: sitepass002
        x: 147; y: 120
        source: "globalstation/sitepass002.png"
        visible: upstream==1&&(2<nextstation||2>endstation||passstation2==2) ? true:false
    }
    Image {
        id: sitenowdown002
        x: 147; y: 120
        source: "globalstation/sitenowdown023.png"
        visible: downstream==1&&nextstation1==23? true:false
    }
    Image {
        id: sitenextdown002
        x: 147; y: 120
        source: "globalstation/sitenextdown023.png"
        visible: downstream==1&&(nextstation<2&&2<=endstation&&passstation23!==23) ? true:false
    }
    Image {
        id: sitepassdown002
        x: 147; y: 120
        source: "globalstation/sitepassdown023.png"
        visible: downstream==1&&(2<nextstation||2>endstation||passstation23==23) ? true:false
    }
    Image {
        id: railnext002
        x: 167
        y: 80
        source: "map_mark/railnext002.png"
        visible: nextstation<=3&&3<=endstation ? true:false
    }
    Image {
        id: railpass002
        x: 167
        y: 80
        source: "map_mark/railpass002.png"
        visible: nextstation>3||3>endstation ? true:false
    }
    Image {
        id: statepassr02
        x: 147; y: 80
        source: "map_mark/statepassr.png"
        visible: nextstation>2&&2>=startstation? true:false
    }
    Image {
        id: statenextr02
        x: 147; y: 80
        source: "map_mark/statenextr.png"
         visible: nextstation<2&&2<=endstation ? true:false
    }
    Image {
        id: statenow002
        x: 147; y: 80
        source: "map_mark/statenow.png"
        visible: nextstation==2&&startstation<2<=endstation ? true:false
    }
    Image {
        id: statenorun2
        x: 147; y: 80
        source: "map_mark/statenorun.png"
        visible: (2<startstation||2>endstation)||(upstream==1&&passstation2==2)||(downstream==1&&passstation23==23) ? true:false
    }

/**********************rail003******************/
    Image {
        id: sitenow003
        x: 224;y: 120
        source: "globalstation/sitenow003.png"
        visible: upstream==1&&3==nextstation&&startstation<3<=endstation ? true:false
    }
    Image {
        id: sitenext003
        x: 224; y: 120
        source: "globalstation/sitenext003.png"
        visible: upstream==1&&(3>nextstation&&3<=endstation&&passstation3!==3) ? true:false
    }
    Image {
        id: sitepass003
        x: 224; y: 120
        source: "globalstation/sitepass003.png"
        visible: upstream==1&&(3<nextstation||3>endstation||passstation3==3) ? true:false
    }
    Image {
        id: sitenowdown003
        x: 224; y: 120
        source: "globalstation/sitenowdown022.png"
        visible: downstream==1&&22==nextstation1&&startstation<3<=endstation ? true:false
    }
    Image {
        id: sitenextdown003
        x: 224; y: 120
        clip: false
        source: "globalstation/sitenextdown022.png"
         visible: downstream==1&&(3>nextstation&&3<=endstation&&passstation22!==22) ? true:false
    }
    Image {
        id: sitepassdown003
        x: 224; y: 120
        clip: false
        source: "globalstation/sitepassdown022.png"
         visible: downstream==1&&(3<nextstation||3>endstation||passstation22==22) ? true:false
    }
    Image {
        id: railpass003
        x: 244
        y: 80
        source: "map_mark/railpass003.png"
        visible:  nextstation>4||4>endstation ? true:false
    }
    Image {
        id: railnext003
        x: 244
        y: 80
        source: "map_mark/railnext003.png"
        visible: nextstation<=4&&4<=endstation ? true:false
    }
     Image {
        id: statepassr03
        x: 224; y: 80
        source: "map_mark/statepassr.png"
        visible: (nextstation>3&&3>=startstation) ? true:false
    }
    Image {
        id: statenextr03
        x: 224; y: 80
        source: "map_mark/statenextr.png"
        visible: nextstation<3&&3<=endstation ? true:false
    }
    Image {
        id: statenow003
        x: 224; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==3&&(startstation<3<=endstation)? true:false
    }
    Image {
        id: statenorun3
        x: 224 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible:(3<startstation||3>endstation)||(upstream==1&&passstation3==3)||(downstream==1&&passstation22==22) ? true:false
    }

/**********************rail004******************/
    Image {
        id: sitenow004
        x: 301; y: 120
        source: "globalstation/sitenow004.png"
        visible: upstream==1&& nextstation==4&&(startstation<4<=endstation)? true:false
    }
    Image {
            id: sitenext004
            x: 301; y: 120
            source: "globalstation/sitenext004.png"
            visible: upstream==1&&(4>nextstation&&4<=endstation&&passstation4!==4) ? true:false
        }
    Image {
            id: sitepass004
            x: 301; y: 120
            source: "globalstation/sitepass004.png"
            visible: upstream==1&&(4<nextstation||4>endstation||passstation4==4) ? true:false
        }
    Image {
        id: sitenowdown004
        x: 301; y:120
        source: "globalstation/sitenowdown021.png"
        visible: downstream==1&&21==nextstation1&&(startstation<4<=endstation) ? true:false
    }
    Image {
        id: sitenextdown004
        x: 301; y: 120
        source: "globalstation/sitenextdown021.png"
        visible: downstream==1&&(4>nextstation&&4<=endstation&&passstation21!==21) ? true:false
    }
    Image {
        id: sitepassdown004
        x: 301; y: 120
        source: "globalstation/sitepassdown021.png"
        visible: downstream==1&&(4<nextstation||4>edstation||passstation21==21) ? true:false
    }
    Image {
        id: railnext004
        x: 321
        y: 80
        source: "map_mark/railnext004.png"
        visible:nextstation<=5&&5<=endstation ? true:false
    }
    Image {
        id: railpass004
        x: 321
        y: 80
        source: "map_mark/railpass004.png"
        visible: nextstation>5||5>endstation ? true:false
    }
    Image {
        id: statenextr04
        x: 301; y: 80
        source: "map_mark/statenextr.png"
        visible: (nextstation<4&&4<=endstation) ? true:false
    }
    Image {
        id: statepassr04
        x: 301; y: 80
        source: "map_mark/statepassr.png"
        visible: nextstation>4&&4>=startstation ? true:false
    }
    Image {
        id: statenow004
        x: 301; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==4&&(startstation<4&&4<=endstation)? true:false
    }
    Image {
        id: statenorun4
        x: 301 ; y: 80
        source: "map_mark/statenorun.png"
        visible:(4<startstation||4>endstation)||(upstream==1&&passstation4==4) ? true:false
    }
/**********************rail005******************/
    Image {
        id: sitenow005
        x: 378 ; y:120
        source: "globalstation/sitenow005.png"
        visible: upstream==1&&nextstation==5&&(startstation<5&&5<=endstation) ? true:false
    }
    Image {
            id: sitepass005
            x: 378; y:120
            source: "globalstation/sitepass005.png"
            visible: upstream==1&&(5<nextstation||5>endstation||passstation5==5) ? true:false
        }
    Image {
            id: sitenext005
            x: 378;y: 120
            source: "globalstation/sitenext005.png"
            visible: upstream==1&&(5>nextstation&&5<=endstation&&passstation5!==5) ? true:false
        }
    Image {
        id: sitenowdown005
        x: 368; y:120
        source: "globalstation/sitenowdown020.png"
        visible: downstream==1&&nextstation1==20&&(startstation<5&&5<=endstation) ? true:false
    }
    Image {
        id: sitenextdown005
        x: 378; y: 120
        clip: false
        source: "globalstation/sitenextdown020.png"
        visible: downstream==1&&(nextstation<5&&5<=endstation&&passstation20!==20) ? true:false
    }
    Image {
        id: sitepassdown005
        x: 378; y:120
        clip: false
        source: "globalstation/sitepassdown020.png"
       visible: downstream==1&&(5<nextstation||5>endstation||passstation20==20) ? true:false
    }
    Image {
        id: railnext005
        x: 398
        y: 80
        source: "map_mark/railnext005.png"
        visible: nextstation<=6&&6<=endstation ? true:false
    }
    Image {
        id: railpass005
        x: 398
        y: 80
        source: "map_mark/railpass005.png"
        visible: nextstation>6||6>endstation ? true:false
    }
    Image {
        id: statenextr05
        x: 378; y:80
        width: 40
        height: 40
        source: "map_mark/statenextr.png"
        visible: (nextstation<5&&5<=endstation) ? true:false
    }
    Image {
        id: statepassr05
        x:378; y: 80
        source: "map_mark/statepassr.png"
        visible: nextstation>5&&5>=startstation ? true:false
    }
    Image {
        id: statenow005
        x: 378; y:80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==5&&(startstation<5&&5<=endstation)? true:false
    }
    Image {
        id: statenorun5
        x: 378; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (5<startstation||5>endstation)||(upstream==1&&passstation5==5)||(downstream==1&&passstation20==20) ? true:false
    }

/**********************rail006******************/
    Image {
        id: sitenow006
        x :455; y:120
        source: "globalstation/sitenow006.png"
        visible: upstream==1&&nextstation==6&&(startstation<6&&6<=endstation) ? true:false
    }
    Image {
            id: sitepass006
            x: 455; y: 120
            source: "globalstation/sitepass006.png"
            visible: upstream==1&&(6<nextstation||6>endstation||passstation6==6) ? true:false
        }
    Image {
            id: sitenext006
            x: 455; y: 120
            source: "globalstation/sitenext006.png"
            visible: upstream==1&&(6>nextstation&&6<=endstation&&passstation6!==6) ? true:false
        }
    Image {
        id: sitenowdown006
        x: 455 ; y:120
        source: "globalstation/sitenowdown019.png"
        visible: downstream==1&&nextstation1==19&&(startstation<6<=endstation) ? true:false
    }
    Image {
        id: sitenextdown006
        x: 455; y: 120
        clip: false
        source: "globalstation/sitenextdown019.png"
        visible: downstream==1&&(nextstation<6&&6<=endstation&&passstation19!==19) ? true:false
    }
    Image {
        id: sitepassdown006
        x: 455; y: 120
        clip: false
        source: "globalstation/sitepassdown019.png"
        visible: downstream==1&&(6<nextstation||6>endstation||passstation19==19) ? true:false
    }
    Image {
        id: railnext006
        x: 475
        y: 80
        source: "map_mark/railnext006.png"
        visible: nextstation<=7&&7<=endstation ? true:false
    }
    Image {
        id: railpass006
        x: 475
        y: 80
        source: "map_mark/railpass006.png"
        visible: nextstation>7||7>endstation ? true:false
    }
    Image {
        id: statenextr06
        x: 455; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<6&&6<=endstation) ? true:false
    }
    Image {
        id: statepassr06
        x: 455; y:80
        source: "map_mark/statepassr.png"
         visible: nextstation>6&&6>=startstation ? true:false
    }
    Image {
        id: statenow006
        x: 455; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==6&&(startstation<6&&6<=endstation)? true:false
    }
    Image {
        id: statenorun6
        x: 455 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible:(6<startstation||6>endstation)||(upstream==1&&passstation6==6)||(downstream==1&&passstation19==19) ? true:false
    }
/**********************rail007******************/
    Image {
        id: sitenow007
        x: 532 ; y:120
        source: "globalstation/sitenow007.png"
        visible: upstream==1&&nextstation==7&&(startstation<7&&7<=endstation) ? true:false
    }
    Image {
        id: sitenowdown007
        x: 532 ; y:120
        source: "globalstation/sitenowdown018.png"
        visible: downstream==1&&nextstation1==18&&(startstation<7&&7<=endstation) ? true:false
    }
    Image {
            id: sitepass007
            x: 532; y:120
            source: "globalstation/sitepass007.png"
            visible: upstream==1&&(7<nextstation||7>endstation||passstation7==7) ? true:false
        }
    Image {
            id: sitenext007
            x: 532; y: 120
            source: "globalstation/sitenext007.png"
            visible: upstream==1&&(7>nextstation&&7<=endstation&&passstation7!==7) ? true:false
        }
    Image {
        id: sitenextdown007
        x: 532; y: 120
        clip: false
        source: "globalstation/sitenextdown018.png"
        visible: downstream==1&&(nextstation<7&&7<=endstation&&passstation18!==18) ? true:false
    }
    Image {
        id: sitepassdown007
        x: 532; y:120
        clip: false
        source: "globalstation/sitepassdown018.png"
        visible: downstream==1&&(7<nextstation||7>endstation||passstation18==18) ? true:false
    }
    Image {
        id: railnext007
        x: 552
        y: 80
        source: "map_mark/railnext007.png"
        visible: nextstation<=8&&8<=endstation ? true:false
    }
    Image {
        id: railpass007
        x: 552
        y: 80
        source: "map_mark/railpass007.png"
        visible:nextstation>8||8>endstation ? true:false
    }
    Image {
        id: statenextr07
        x: 532; y: 80
        source: "map_mark/statenextr.png"
         visible:(nextstation<7&&7<=endstation) ? true:false
    }
    Image {
        id: statepassr07
        x: 532; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>7&&7>=startstation? true:false
    }
    Image {
        id: statenow007
        x: 532; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible:nextstation==7&&(startstation<7&&7<=endstation)? true:false
    }
    Image {
        id: statenorun7
        x: 532; y:80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (7<startstation||7>endstation)||(upstream==1&&passstation7==7)||(downstream==1&&passstation18==18) ? true:false
    }
/**********************rail008******************/
    Image {
        id: sitenow008
        x: 609; y:120
        source: "globalstation/sitenow008.png"
        visible: upstream==1&&nextstation==8&&(startstation<8&&8<=endstation) ? true:false
    }
    Image {
        id: sitenowdown008
        x: 609; y:120
        source: "globalstation/sitenowdown017.png"
        visible: downstream==1&&nextstation1==17&&(startstation<8&&8<=endstation) ? true:false
    }
    Image {
            id: sitepass008
            x: 609;y: 120
            source: "globalstation/sitepass008.png"
            visible: upstream==1&&(8<nextstation||8>endstation||passstation8==8) ? true:false
        }
    Image {
            id: sitenext008
            x: 609; y: 120
            source: "globalstation/sitenext008.png"
            visible: upstream==1&&(8>nextstation&&8<=endstation&&passstation8!==8) ? true:false
        }
    Image {
        id: sitenextdown008
        x: 609; y: 120
        source: "globalstation/sitenextdown008.png"
        visible: downstream==1&&(nextstation<8&&8<=endstation&&passstation17!==17) ? true:false
    }
    Image {
        id: sitepassdown008
        x: 609; y: 120
        source: "globalstation/sitepassdown017.png"
        visible: downstream==1&&(8<nextstation||8>endstation||passstation17==17) ? true:false
    }
    Image {
        id: railnext008
        x: 629
        y: 80
        source: "map_mark/railnext008.png"
        visible: nextstation<=9&&9<=endstation ? true:false
    }
    Image {
        id: railpass008
        x: 629
        y: 80
        source: "map_mark/railpass008.png"
        visible: nextstation>9||9>endstation ? true:false
    }
    Image {
        id: statenextr08
        x: 609; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<8||8<=endstation) ? true:false
    }
    Image {
        id: statepassr08
        x: 609; y: 80
        source: "map_mark/statepassr.png"
         visible:nextstation>8&&8>=startstation ? true:false
    }
    Image {
        id: statenow008
        x: 609; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==8&&(startstation<8&&8<=endstation)? true:false
    }
    Image {
        id: statenorun8
        x: 609; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (8<startstation||8>endstation)||(upstream==1&&passstation8==8)||(downstream==1&&passstation17==17) ? true:false
    }
/**********************rail009******************/
    Image {
        id: sitenow009
        x: 686 ; y:120
        source: "globalstation/sitenow.png"
        visible: upstream==1&&nextstation==9&&(startstation<9&&9<=endstation) ? true:false
    }
    Image {
        id: sitenowdown009
        x: 686 ; y:120
        source: "globalstation/sitenowdown016.png"
        visible: downstream==1&&nextstation1==16&&(startstation<9&&9<=endstation) ? true:false
    }
    Image {
            id: sitepass009
            x: 686;y: 120
            source: "globalstation/sitepass009.png"
            visible: upstream==1&&(9<nextstation||9>endstation||passstation9==9) ? true:false
        }
    Image {
            id: sitenext009
            x: 686; y: 120
            source: "globalstation/sitenext009.png"
            visible: upstream==1&&(9>nextstation&&9<=endstation&&passstation9!==9) ? true:false
        }
    Image {
        id: sitenextdown009
        x: 686; y: 120
        clip: false
        source: "globalstation/sitenextdown016.png"
        visible: downstream==1&&(nextstation<9&&9<=endstation&&passstation16!==16) ? true:false
    }
    Image {
        id: sitepassdown009
        x: 686; y: 120
        clip: false
        source: "globalstation/sitepassdown009.png"
        visible: downstream==1&&(9<nextstation||9>endstation||passstation19==19) ? true:false
    }
    Image {
        id: railnext009
        x: 706
        y: 80
        source: "map_mark/railnext009.png"
        visible:  nextstation<=10&&10<=endstation ? true:false
    }
    Image {
        id: railpass009
        x: 706
        y: 80
        width: source.width
        height: source.height
        source: "map_mark/railpass009.png"
        visible: nextstation>10||10>endstation ? true:false
    }
    Image {
        id: statenextr09
        x: 686; y: 80
        height: source.height
        width: source.width
        source: "map_mark/statenextr.png"
         visible: (nextstation<9&&9<=endstation) ? true:false
    }
    Image {
        id: statepassr09
        x: 686; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>9&&9>=startstation ? true:false
    }
    Image {
        id: statenow009
        x: 686; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==9&&(startstation<9&&9<=endstation)? true:false
    }
    Image {
        id: statenorun9
        x: 686; y: 80
        source: "map_mark/statenorun.png"
        visible:(9<startstation||9>endstation)||(upstream==1&&passstation9==9)||(downstream==1&&passstation16==16) ? true:false
    }
/**********************rail010******************/
    Image {
        id: sitenow010
        x: 763 ; y:120
        source: "globalstation/sitenow010.png"
        visible: upstream==1&&nextstation==10&&(startstation<10&&10<=endstation) ? true:false
    }
    Image {
        id: sitenowdown010
        x: 763; y:120
        source: "globalstation/sitenowdown015.png"
        visible: downstream==1&&nextstation1==15&&(startstation<10&&10<=endstation) ? true:false
    }
    Image {
            id: sitepass010
            x: 763; y:120
            source: "globalstation/sitepass010.png"
            visible: upstream&&(10<nextstation||10>endstation||passstation10==10) ? true:false
        }
    Image {
            id: sitenext010
            x: 763; y: 120
            source: "globalstation/sitenext010.png"
            visible: upstream==1&&(10>nextstation&&10<=endstation&&passstation10!==10) ? true:false
        }
    Image {
        id: sitenextdown010
        x: 763; y: 120
        clip: false
        source: "globalstation/sitenextdown015.png"
        visible: downstream==1&&nextstation<10&&10<=endstation&&passstation15!==15 ? true:false
    }
    Image {
        id: sitepassdown010
        x: 763; y: 120
        clip: false
        source: "globalstation/sitepassdown015.png"
        visible: downstream==1&&(10<nextstation||10>endstation||passstation15==15) ? true:false
    }
   Image {
        id: railnext010
        x: 783
        y: 80
        source: "map_mark/railnext010.png"
         visible:nextstation<=11&&11<=endstation ? true:false
    }
   Image {
        id: railpass010
        x: 783
        y: 80
        source: "map_mark/railpass010.png"
         visible: nextstation>11||11>endstation ? true:false
    }
       Image {
           id: statenextr10
           x: 763; y: 80
           source: "map_mark/statenextr.png"
           visible: (nextstation<10&&10<=endstation) ? true:false
       }
       Image {
           id: statepassr10
           x: 763; y: 80
           source: "map_mark/statepassr.png"
           visible: nextstation>10&&10>=startstation ? true:false
       }
       Image {
           id: statenow010
           x: 763; y: 80
           width: 40
           height: 40
           source: "map_mark/statenow.png"
           visible: nextstation==10&&(startstation<10&&10<=endstation)? true:false
       }
       Image {
           id: statenorun10
           x: 763; y: 80
           clip: false
           source: "map_mark/statenorun.png"
           visible: (10<startstation||10>endstation)||(upstream==1&&passstation10==10)||(downstream==1&&passstation15==15) ? true:false
       }

/**********************rail011******************/
       Image {
           id: sitenow011
           x: 840; y:120
           source: "globalstation/sitenow011.png"
           visible: upstream==1&&nextstation==11&&(startstation<11&&11<=endstation) ? true:false
       }
       Image {
           id: sitenowdown011
           x: 840; y:120
           source: "globalstation/sitenowdown014.png"
           visible: downstream==1&&nextstation1==14&&(startstation<11&11<=endstation) ? true:false
       }
       Image {
               id: sitepass011
               x: 840; y: 120
               source: "globalstation/sitepass011.png"
               visible: upstream==1&&(11<nextstation||11>endstation||passstation11==11) ? true:false
           }
       Image {
               id: sitenext011
               x: 840; y: 120
               source: "globalstation/sitenext011.png"
               visible: upstream==1&&11>nextstation&&11<=endstation&&passstation11!==11 ? true:false
           }

   Image {
           id: sitepassdown011
           x: 840; y: 120
           source: "globalstation/sitepassdown014.png"
           visible: downstream==1&&(11<nextstation||11>endstation||passstation14==14) ? true:false
       }
   Image {
           id: sitenextdown011
           x: 840; y: 120
           clip: false
           source: "globalstation/sitenextdown014.png"
           visible: downstream==1&&nextstation<11&&11<=endstation&&passstation14!==14 ? true:false
       }
   Image {
        id: railnext011
        x: 860
        y: 80
        source: "map_mark/railnext011.png"
        visible: nextstation<=12&&12<=endstation ? true:false
    }
   Image {
        id: railpass011
        x: 860
        y: 80
        source: "map_mark/railpass011.png"
        visible: nextstation>12||12>endstation ? true:false
    }
    Image {
            id: statenextr11
            x: 840; y: 80
            source: "map_mark/statenextr.png"
             visible: (nextstation<11&&11<=endstation) ? true:false
        }
    Image {
            id: statepassr11
            x: 840; y: 80
            source: "map_mark/statepassr.png"
             visible: nextstation>11&&11>=startstation ? true:false
        }
    Image {
        id: statenow011
        x: 840; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible:  nextstation==11&&(startstation<11&&11<=endstation)? true:false
    }
    Image {
        id: statenorun11
        x: 840 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (11<startstation||11>endstation)||(upstream==1&&passstation11==11)||(downstream==1&&passstation14==14) ? true:false
    }

/**********************rail012******************/
    Image {
        id: sitenow012
        x: 917 ; y:120
        source: "globalstation/sitenow012.png"
        visible: upstream==1&&nextstation==12&&(startstation<12&&12<=endstation) ? true:false
    }
    Image {
        id: sitenowdown0012
        x: 917 ; y:120
        source: "globalstation/sitenowdown013.png"
        visible: downstream==1&&nextstation1==13&&(startstation<12&&12<=endstation) ? true:false
    }
    Image {
            id: sitepass012
            x: 917; y: 120
            source: "globalstation/sitepass012.png"
            visible: upstream==1&&(12<nextstation||12>endstation||passstation12==12) ? true:false
        }
    Image {
            id: sitenext012
            x: 917; y: 120
            source: "globalstation/sitenext012.png"
            visible: upstream==1&&12>nextstation&&12<=endstation&&passstation12!==12 ? true:false
        }
    Image {
        id: sitenextdown012
        x: 917; y: 120
        clip: false
        source: "globalstation/sitenextdown013.png"
        visible: downstream==1&&nextstation<12&&12<=endstation&&passstation13!==13 ? true:false
    }
    Image {
        id: sitepassdown012
        x: 917; y: 120
        clip: false
        source: "globalstation/sitepassdown013.png"
        visible: downstream==1&&(12<nextstation||12>endstation||passstation13==13) ? true:false
    }
    Image {
        id: railnext012
        x: 937
        y: 80
        source: "map_mark/railnext012.png"
       visible: nextstation<=13&&13<=endstation ? true:false
    }
    Image {
        id: railnpass012
        x: 937
        y: 80
        source: "map_mark/railpass012.png"
       visible: nextstation>13||13>endstation ? true:false
    }
    Image {
        id: statenextr12
        x: 917; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<12&&12<=endstation) ? true:false
    }
    Image {
        id: statepassr12
        x: 917; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>12&&12>=startstation? true:false
    }
    Image {
        id: statenow012
        x: 917; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==12&&(startstation<12&&12<=endstation)? true:false
    }
    Image {
        id: statenorun12
        x: 917 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (12<startstation||12>endstation)||(upstream==1&&passstation12==12)||(downstream==1&&passstation13==13) ? true:false
    }
/**********************rail013******************/
    Image {
        id: sitenow013
        x: 994 ; y:120
        source: "globalstation/sitenow013.png"
        visible: upstream==1&&nextstation==13&&(startstation<13&&13<=endstation) ? true:false
    }
    Image {
        id: sitenowdown013
        x: 994 ; y:120
        source: "globalstation/sitenowdown012.png"
        visible: downstream==1&&nextstation1==12&&(startstation<13&&13<=endstation) ? true:false
    }
    Image {
            id: sitepass013
            x: 994; y: 120
            source: "globalstation/sitepass013.png"
            visible: upstream==1&&(13<nextstation||13>endstation||passstation13==13) ? true:false
        }
    Image {
            id: sitenext013
            x: 994; y: 120
            source: "globalstation/sitenext013.png"
            visible: upstream==1&&13>nextstation&&13<=endstation&&passstation13!==13 ? true:false
        }
    Image {
        id: sitenextdown013
        x: 994; y: 120
        clip: false
        source: "globalstation/sitenextdown012.png"
        visible: downstream==1&&nextstation<13&&13<=endstation&&passstation12!==12 ? true:false
    }
    Image {
        id: sitepassdown013
        x: 994; y: 120
        clip: false
        source: "globalstation/sitepassdown012.png"
        visible:downstream==1&&(13<nextstation||13>endstation||passstation12==12) ? true:false
    }
    Image {
        id: railnext013
        x: 1014
        y: 80
        source: "map_mark/railnext013.png"
        visible: nextstation<=14&&14<=endstation ? true:false
    }
    Image {
        id: railpass013
        x: 1014
        y: 80
        source: "map_mark/railpass013.png"
        visible: nextstation>14||14>endstation ? true:false
    }
    Image {
        id: statenextr13
        x: 994; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<13&&13<=endstation) ? true:false
        }
    Image {
        id: statepassr13
        x: 994; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>13&&13>=startstation ? true:false
        }
    Image {
        id: statenow013
        x: 994; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==13&&(startstation<13&&13<=endstation)? true:false
    }
    Image {
        id: statenorun13
        x: 994 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (13<startstation||13>endstation)||(upstream==1&&passstation13==13)||(downstream==1&&passstation12==12) ? true:false
    }

/**********************rail014******************/
    Image {
        id: sitenow014
        x: 1071 ; y:120
        source: "globalstation/sitenow014.png"
        visible: upstream==1&&nextstation==14&&(startstation<14&&14<=endstation) ? true:false
    }
    Image {
        id: sitenowdown014
        x: 1071 ; y:120
        source: "globalstation/sitenowdown011.png"
        visible: downstream==1&&nextstation1==11&&(startstation<14&&14<=endstation) ? true:false
    }
    Image {
            id: sitepass014
            x: 1071; y: 120
            source: "globalstation/sitepass014.png"
            visible: upstream==1&&(14<nextstation||14>endstation||passstation14==14) ? true:false
        }
    Image {
            id: sitenext014
            x: 1071; y: 120
            source: "globalstation/sitenext014.png"
            visible: upstream==1&&14>nextstation&&14<=endstation&&passstation14!==14 ? true:false
        }
    Image {
        id: sitenextdown014
        x: 1071; y: 120
        clip: false
        source: "globalstation/sitenextdown011.png"
        visible: downstream==1&&nextstation<14&&14<=endstation&&passstation11!==11 ? true:false
    }
    Image {
        id: sitepassdown014
        x: 1071; y: 120
        clip: false
        source: "globalstation/sitepassdown011.png"
        visible: downstream==1&&(14<nextstation||14>endstation||passstation11==11) ? true:false
    }
    Image {
        id: railnext014
        x: 1091
        y: 80
        source: "map_mark/railnext014.png"
        visible: nextstation<=15&&15<=endstation ? true:false
    }
    Image {
        id: railpass014
        x: 1091
        y: 80
        source: "map_mark/railpass014.png"
        visible: nextstation>15||15>endstation ? true:false
    }
    Image {
        id: statenextr14
        x: 1071; y: 80
        source: "map_mark/statenextr.png"
        visible: (nextstation<14&&14<=endstation) ? true:false
    }
    Image {
        id: statepassr14
        x: 1071; y: 80
        source: "map_mark/statepassr.png"
        visible: nextstation>14&&14>=startstation ? true:false
    }
    Image {
        id: statenow014
        x: 1071; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==14&&(startstation<14&&14<=endstation)? true:false
    }
    Image {
        id: statenorun14
        x: 1071 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible:(14<startstation||14>endstation)||(upstream==1&&passstation14==14)||(downstream==1&&passstation11==11) ? true:false
    }
/**********************rail015******************/
    Image {
        id: sitenow015
        x: 1148 ; y:120
        source: "globalstation/sitenow015.png"
        visible: upstream==1&&nextstation==15&&(startstation<15&&15<=endstation) ? true:false
    }
    Image {
        id: sitenowdown015
        x: 1148 ; y:120
        source: "globalstation/sitenowdown010.png"
        visible: downstream==1&&nextstation1==10&&(startstation<15&&15<=endstation) ? true:false
    }
    Image {
            id: sitepass015
            x: 1148; y: 120
            source: "globalstation/sitepass015.png"
            visible: upstream==1&&(15<nextstation||15>endstation||passstation15==15) ? true:false
        }
    Image {
            id: sitenext015
            x: 1148; y: 120
            source: "globalstation/sitenext015.png"
            visible: upstream==1&&15>nextstation&&15<=endstation&&passstation15!==15 ? true:false
        }
    Image {
        id: sitenextdown015
        x: 1148 ; y: 120
        clip: false
        source: "globalstation/sitenextdown010.png"
        visible: downstream==1&&nextstation<15&&15<=endstation&&passstation10!==10 ? true:false
    }
    Image {
        id: sitepassdown015
        x: 1148 ; y: 120
        clip: false
        source: "globalstation/sitepassdown010.png"
        visible:downstream==1&&(15<nextstation||15>endstation||passstation10==10) ? true:false
    }
    Image {
        id: railnext015
        x: 1168
        y: 80
        source: "map_mark/railnext015.png"
        visible: nextstation<=16&&16<=endstation ? true:false
    }
    Image {
        id: railpass015
        x: 1168
        y: 80
        source: "map_mark/railpass015.png"
        visible:  nextstation>16||16>endstation ? true:false
    }
    Image {
        id: statenextr15
        x: 1148; y: 80
        source: "map_mark/statenextr.png"
        visible:(nextstation<15&&15<=endstation) ? true:false
    }
    Image {
        id: statepassr15
        x: 1148; y: 80
        source: "map_mark/statepassr.png"
        visible: nextstation>15&&15>=startstation ? true:false
    }
    Image {
        id: statenow015
        x: 1148; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==15&&(startstation<15&&15<=endstation)? true:false
    }
    Image {
        id: statenorun15
        x: 1148; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (15<startstation||15>endstation)||(upstream==1&&passstation15==15)||(downstream==1&&passstation10==10) ? true:false
    }
/**********************rail016******************/
    Image {
        id: sitenow016
        x: 1225; y:120
        source: "globalstation/sitenow016.png"
        visible: upstream==1&&nextstation==16&&(startstation<16&&16<=endstation) ? true:false
    }
    Image {
        id: sitenowdown016
        x: 1225; y:120
        source: "globalstation/sitenowdown009.png"
        visible: downstream==1&&nextstation1==9&&(startstation<16&&16<=endstation) ? true:false
    }
    Image {
            id: sitepass016
            x: 1225; y: 120
            source: "globalstation/sitepass016.png"
            visible: upstream==1&&(16<nextstation||16>endstation||passstation16==16) ? true:false
        }
    Image {
            id: sitenext016
            x: 1225; y: 120
            source: "globalstation/sitenext016.png"
            visible: upstream==1&&16>nextstation&&16<=endstation&&passstation16!==16 ? true:false
        }
    Image {
        id: sitenextdown016
        x: 1225; y: 120
        clip: false
        source: "globalstation/sitenextdown009.png"
        visible: downstream==1&&nextstation<16&&16<=endstation&&passstation9!==9 ? true:false
    }
    Image {
        id: sitepassdown016
        x: 1225; y: 120
        clip: false
        source: "globalstation/sitepass009.png"
        visible: downstream==1&&(16<nextstation||16>endstation||passstation9==9) ? true:false
    }
    Image {
        id: railnext016
        x: 1245
        y: 80
        source: "map_mark/railnext016.png"
        visible:  nextstation<=17&&17<=endstation ? true:false
    }
    Image {
        id: railpass016
        x: 1245
        y: 80
        source: "map_mark/railpass016.png"
        visible: nextstation>17||17>endstation ? true:false
    }
    Image {
        id: statenextr16
        x: 1225; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<16&&16<=endstation) ? true:false
    }
    Image {
        id: statepassr16
        x: 1225; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>16&&16>+startstation ? true:false
    }
    Image {
        id: statenow016
        x: 1225; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==16&&(startstation<16&&16<=endstation)? true:false
    }
    Image {
        id: statenorun16
        x: 1225 ; y: 80
        source: "map_mark/statenorun.png"
        visible:(16<startstation||16>endstation)||(upstream==1&&passstation16==16)||(downstream==1&&passstation9==9) ? true:false
    }
/**********************rail017******************/
    Image {
        id: sitenow017
        x: 1302 ; y:120
        source: "globalstation/sitenow017.png"
        visible: upstream==1&&nextstation==17&&(startstation<17&&17<=endstation) ? true:false
    }
    Image {
        id: sitenowdown017
        x: 1302 ; y:120
        source: "globalstation/sitenowdown008.png"
        visible: downstream==1&&nextstation1==8&&(startstation<17&&17<=endstation) ? true:false
    }
    Image {
            id: sitepass017
            x: 1302; y: 120
            source: "globalstation/sitepass017.png"
            visible: upstream==1&&(17<nextstation||17>endstation||passstation17==17) ? true:false
        }
    Image {
            id: sitenext017
            x: 1302; y: 120
            source: "globalstation/sitenext017.png"
            visible: upstream==1&&17>nextstation&&17<=endstation&&passstation17!==17 ? true:false
        }
    Image {
      id: sitenextdown017
      x: 1302; y: 120
      clip: false
      source: "globalstation/sitenextdown008.png"
      visible:downstream==1&&nextstation<17&&17<=endstation&&passstation8!==8 ? true:false
    }
    Image {
      id: sitepassdown017
      x: 1302; y: 120
      clip: false
      source: "globalstation/sitepassdown008.png"
      visible: downstream==1&&(17<nextstation||17>endstation||passstation8==8) ? true:false
    }
    Image {
        id: railnext017
        x: 1322
        y: 80
        source: "map_mark/railnext017.png"
        visible: nextstation<=18&&18<=endstation ? true:false
    }
    Image {
        id: railpass017
        x: 1322
        y: 80
        source: "map_mark/railpass017.png"
        visible: nextstation>18||18>endstation ? true:false
    }
    Image {
        id: statenextr17
        x: 1302; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<17&&17<=endstation) ? true:false
    }
    Image {
        id: statepassr17
        x: 1302; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>17&&17>=startstation ? true:false
    }
    Image {
        id: statenow017
        x: 1302; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==17&&(startstation<17&&17<=endstation)? true:false
    }
    Image {
        id: statenorun17
        x: 1302; y: 80
        source: "map_mark/statenorun.png"
        visible:(17<startstation||17>endstation)||(upstream==1&&passstation17==17)||(downstream==1&&passstation8==8) ? true:false
    }
/**********************rail018******************/
    Image {
        id: sitenow018
        x: 1379; y:120
        source: "globalstation/sitenow018.png"
        visible: upstream==1&&nextstation==18&&(startstation<18&&18<=endstation)? true:false
    }
    Image {
        id: sitenowdown018
        x: 1379; y:120
        source: "globalstation/sitenowdown007.png"
        visible: downstream==1&&nextstation1==7&&(startstation<18&&18<=endstation) ? true:false
    }
    Image {
            id: sitepass018
            x: 1379; y: 120
            source: "globalstation/sitepass018.png"
            visible: upstream==1&&(18<nextstation||18>endstation||passstation18==18) ? true:false
        }
    Image {
            id: sitenext018
            x: 1379; y: 120
            source: "globalstation/sitenext018.png"
            visible: upstream==1&&18>nextstation&&18<=endstation&&passstation18!==18 ? true:false
        }
    Image {
        id: sitenextdown018
        x: 1379; y: 120
        clip: false
        source: "globalstation/sitenextdown007.png"
        visible: downstream==1&&nextstation<18&&18<=endstation&&passstation7!==7 ? true:false
    }
    Image {
        id: sitepassdown018
        x: 1379; y: 120
        clip: false
        source: "globalstation/sitepassdown007.png"
        visible: downstream==1&&(18<nextstation||18>endstation||passstation7==7) ? true:false
    }
    Image {
        id: railnext018
        x: 1399
        y: 80
        source: "map_mark/railnext018.png"
        visible: nextstation<=19&&19<=endstation ? true:false
    }
    Image {
        id: railpass018
        x: 1399
        y: 80
        source: "map_mark/railpass018.png"
        visible: nextstation>19||19>endstation ? true:false
    }
    Image {
        id: statenextr18
        x: 1379; y: 80
        source: "map_mark/statenextr.png"
         visible: (nextstation<18&&18<=endstation) ? true:false
    }
    Image {
        id: statepassr18
        x: 1379; y: 80
        source: "map_mark/statepassr.png"
         visible: nextstation>18&&18>=startstation ? true:false
    }
    Image {
        id: statenow018
        x: 1379; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==18&&(startstation<18&&18<=endstation) ? true:false
    }
    Image {
        id: statenorun18
        x: 1379; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (18<startstation||18>endstation)||(upstream==1&&passstation18==18)||(downstream==1&&passstation7==7) ? true:false
    }
/**********************rail019******************/
    Image {
        id: sitenow019
        x: 1456; y:120
        source: "globalstation/sitenow019.png"
        visible: upstream==1&&nextstation==19&&(startstation<19&&19<=endstation) ? true:false
    }
    Image {
        id: sitenowdown019
        x: 1456; y:120
        source: "globalstation/sitenowdown006.png"
        visible: downstream==1&&nextstation1==6&&(startstation<19&&19<=endstation) ? true:false
    }
    Image {
            id: sitepass019
            x: 1456; y:120
            source: "globalstation/sitepass019.png"
            visible: upstream==1&&(19<nextstation||19>endstation||passstation19==19) ? true:false
        }
    Image {
            id: sitenext019
            x: 1456; y: 120
            source: "globalstation/sitenext019.png"
            visible: upstream==1&&19>nextstation&&19<=endstation&&passstation19!==19 ? true:false
        }
    Image {
        id: sitenextdown019
        x: 1456; y: 120
        clip: false
        source: "globalstation/sitenextdown006.png"
        visible:downstream==1&&nextstation<19&&19<=endstation&&passstation6!==6 ? true:false
    }
    Image {
        id: sitepassdown019
        x: 1456; y: 120
        clip: false
        source: "globalstation/sitepassdown006.png"
        visible: downstream==1&&(19<nextstation||19>endstation||passstation6==6) ? true:false
    }
    Image {
        id: railnext019
        x: 1476
        y: 80
        source: "map_mark/railnext019.png"
        visible: nextstation<=20&&20<=endstation ? true:false
    }
    Image {
        id: railpass019
        x: 1476
        y: 80
        source: "map_mark/railpass019.png"
        visible: nextstation>20||20>endstation ? true:false
    }
    Image {
        id: statenextr19
        x: 1456; y:80
        source: "map_mark/statenextr.png"
         visible:(nextstation<19&&19<=endstation) ? true:false
    }
    Image {
        id: statepassr19
        x: 1456; y: 80
        source: "map_mark/statepassr.png"
         visible:nextstation>19&&19>=startstation ? true:false
    }
    Image {
        id: statenow019
        x: 1456; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==19&&(startstation<19&&19<=endstation) ? true:false
    }
    Image {
        id: statenorun19
        x: 1456; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (19<startstation||19>endstation)||(upstream==1&&passstation19==19)||(downstream==1&&passstation6==6) ? true:false
    }
/**********************rail020******************/
    Image {
        id: sitenow020
        x: 1520; y:120
        source: "globalstation/sitenow020.png"
        visible: upstream==1&&nextstation==20&&(startstation<20&&20<=endstation) ? true:false
    }
    Image {
        id: sitenowdown020
        x: 1520; y:120
        source: "globalstation/sitenowdown005.png"
        visible: downstream==1&&nextstation1==5&&(startstation<20&&20<=endstation) ? true:false
    }
    Image {
            id: sitepass020
            x: 1533; y: 120
            source: "globalstation/sitepass020.png"
            visible: upstream==1&&(20<nextstation||20>endstation||passstation20==20) ? true:false
        }
    Image {
            id: sitenext020
            x: 1533; y: 120
            source: "globalstation/sitenext020.png"
            visible: upstream==1&&20>nextstation&&20<=endstation&&passstation20!==20 ? true:false
        }
    Image {
        id: sitenextdown020
        x: 1533; y: 120
        clip: false
        source: "globalstation/sitenextdown005.png"
        visible:downstream==1&&nextstation<20&&20<=endstation&&passstation5!==5 ? true:false
            }
    Image {
        id: sitepassdown020
        x: 1533; y: 120
        clip: false
        source: "globalstation/sitepassdown005.png"
        visible:downstream==1&&(20<nextstation||20>endstation||passstation5==5) ? true:false
            }
    Image {
        id: railnext020
        x: 1553
        y: 80
        source: "map_mark/railnext020.png"
        visible: nextstation<=21&&21<=endstation ? true:false
    }
    Image {
        id: railpass020
        x: 1553
        y: 80
        source: "map_mark/railpass020.png"
        visible: nextstation>21||21>endstation ? true:false
    }
    Image {
       id: statenextr20
       x: 1533; y: 80
       source: "map_mark/statenextr.png"
       visible:(nextstation<20&&20<=endstation) ? true:false
        }
    Image {
       id: statepassr20
       x: 1533; y: 80
       source: "map_mark/statepassr.png"
       visible:nextstation>20&&20>=startstation ? true:false
        }
    Image {
        id: statenow020
        x: 1533; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==20&&(startstation<20&&20<=endstation) ? true:false
    }
    Image {
        id: statenorun20
        x: 1533 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (20<startstation||20>endstation)||(upstream==1&&passstation20==20)||(downstream==1&&passstation5==5) ? true:false
    }
/**********************rail021******************/
    Image {
        id: sitenow021
        x: 1610 ; y:120
        source: "globalstation/sitenow021.png"
        visible: upstream==1&&nextstation==21&&(startstation<21&&21<=endstation) ? true:false
    }
    Image {
        id: sitenowdown021
        x: 1610; y:120
        source: "globalstation/sitenowdown004.png"
        visible: downstream==1&&nextstation1==4&&(startstation<21&&21<=endstation) ? true:false
    }
    Image {
            id: sitepass021
            x: 1610; y: 120
            source: "globalstation/sitepass021.png"
            visible: upstream==1&&((21<nextstation||21>endstation)||passstation21==21) ? true:false
        }
    Image {
            id: sitenext021
            x: 1610; y: 120
            source: "globalstation/sitenext021.png"
            visible: upstream==1&&21>nextstation&&21<=endstation&&passstation21!==21 ? true:false
        }
    Image {
        id: sitenextdown021
        x: 1610; y:120
        clip: false
        source: "globalstation/sitenextdown004.png"
        visible: downstream==1&&nextstation<21&&21<=endstation&&passstation4!==4 ? true:false
    }
    Image {
        id: sitepassdown021
        x: 1610; y:120
        clip: false
        source: "globalstation/sitepassdown004.png"
        visible:downstream==1&&(21<nextstation||21>endstation||passstation4==4) ? true:false
    }
    Image {
        id: railnext021
        x: 1630
        y: 80
        source: "map_mark/railnext021.png"
        visible: nextstation<=22&&22<=endstation ? true:false
    }
    Image {
        id: railpass021
        x: 1630
        y: 80
        source: "map_mark/railpass021.png"
        visible: nextstation>22||22>endstation ? true:false
    }
    Image {
        id: statenextr21
        x: 1610; y: 80
        source: "map_mark/statenextr.png"
         visible:(nextstation<21&&21<=endstation) ? true:false
    }
    Image {
        id: statepassr21
        x: 1610; y: 80
        source: "map_mark/statepassr.png"
         visible:nextstation>21&&21>=startstation ? true:false
    }
    Image {
        id: statenow021
        x: 1610; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==21&&(startstation<21&&21<=endstation) ? true:false
    }
    Image {
        id: statenorun21
        x: 1610; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (21<startstation||21>endstation)||(upstream==1&&passstation21==21)||(downstream==1&&passstation4==4) ? true:false
    }
/**********************rail022******************/
    Image {
        id: sitenow022
        x: 1687 ; y:120
        source: "globalstation/sitenow022.png"
        visible: upstream==1&&nextstation==22&&(startstation<22&&22<=endstation) ? true:false
    }
    Image {
        id: sitenowdown022
        x: 1687; y:120
        source: "globalstation/sitenowdown003.png"
        visible: downstream==1&&nextstation1==3&&(startstation<22&&22<=endstation) ? true:false
    }
    Image {
            id: sitepass022
            x: 1687; y: 120
            source: "globalstation/sitepass022.png"
            visible: upstream==1&&(22<nextstation||22>endstation||passstation22==22) ? true:false
        }
    Image {
            id: sitenext022
            x: 1687; y: 120
            source: "globalstation/sitenext022.png"
            visible: upstream==1&&22>nextstation&&22<=endstation&&passstation22!==22 ? true:false
        }
    Image {
            id: sitenextdown022
            x: 1687; y: 120
            clip: false
            source: "globalstation/sitenextdown003.png"
            visible:downstream==1&&nextstation<22&&22<=endstation&&passstation3!==3 ? true:false
        }
    Image {
            id: sitepassdown022
            x: 1687; y: 120
            clip: false
            source: "globalstation/sitepassdown003.png"
            visible:downstream==1&&(22<nextstation||22>endstation||passstation3==3) ? true:false
        }
    Image {
        id: railnext022
        x: 1707
        y: 80
        source: "map_mark/railnext022.png"
        visible: nextstation<=23&&23<=endstation ? true:false
    }
    Image {
        id: railpass022
        x: 1707
        y: 80
        source: "map_mark/railpass022.png"
        visible: nextstation>23||23>endstation ? true:false
    }
    Image {
        id: statenextr22
        x: 1687; y: 80
        source: "map_mark/statenextr.png"
        visible: (nextstation<22&&22<=endstation) ? true:false
    }
    Image {
        id: statepassr22
        x: 1687; y: 80
        source: "map_mark/statepassr.png"
        visible:nextstation>22&&22>=startstation ? true:false
    }
    Image {
        id: statenow022
        x: 1687; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==22&&(startstation<22&&22<=endstation) ? true:false
    }
    Image {
        id: statenorun22
        x: 1687 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (22<startstation||22>endstation)||(upstream==1&&passstation22==22)||(downstream==1&&passstation3==3) ? true:false
    }
/**********************rail023******************/
    Image {
        id: sitenow023
        x: 1764 ; y:120
        source: "globalstation/sitenow023.png"
        visible: upstream==1&&nextstation==23&&(startstation<23&&23<=endstation) ? true:false
    }
    Image {
        id: sitenowdown023
        x: 1764; y:120
        source: "globalstation/sitenowdown002.png"
        visible: downstream==1&&nextstation1==2&&(startstation<23&&23<=endstation) ? true:false
    }
    Image {
            id: sitepass023
            x: 1764; y: 120
            source: "globalstation/sitepass023.png"
            visible: upstream==1&&(23<nextstation||23>endstation||passstation23==23) ? true:false
        }
    Image {
            id: sitenext023
            x: 1764; y: 120
            source: "globalstation/sitenextdown023.png"
            visible: upstream==1&&23>nextstation&&23<=endstation&&passstation23!==23 ? true:false
        }
    Image {
            id: sitenextdown023
            x: 1764; y: 120
            clip: false
            source: "globalstation/sitenextdown002.png"
            visible:downstream==1&&nextstation<23&&23<=endstation&&passstation2!=2 ? true:false
        }
    Image {
            id: sitepassdown023
            x: 1764; y: 120
            clip: false
            source: "globalstation/sitepassdown002.png"
            visible: downstream==1&&(23<nextstation||23>endstation||passstation2==2) ? true:false
        }
    Image {
        id: railnext023
        x: 1784
        y: 80
        source: "map_mark/railnext023.png"
        visible: nextstation<=24&&24<=endstation ? true:false
    }
    Image {
        id: railpass023
        x: 1784
        y: 80
        source: "map_mark/railpass023.png"
        visible: nextstation>24||24>endstation ? true:false
    }
    Image {
        id: statenextr23
        x: 1764; y: 80
        source: "map_mark/statenextr.png"
         visible:(nextstation<23&&23<=endstation) ? true:false
    }
    Image {
        id: statepassr23
        x: 1764; y: 80
        source: "map_mark/statepassr.png"
         visible:nextstation>23&&23>=startstation ? true:false
    }
    Image {
        id: statenow023
        x: 1764; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==23&&(startstation<23&&23<=endstation) ? true:false
    }
    Image {
        id: statenorun23
        x: 1764 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (23<startstation||23>endstation)||(upstream==1&&passstation23==23)||(downstream==1&&passstation2==2) ? true:false
    }
/**********************rail024******************/
    Image {
        id: sitenow024
        x: 1841 ; y:120
        source: "globalstation/sitenow024.png"
        visible: upstream==1&&nextstation==24 ? true:false
    }
    Image {
        id: sitenowdown024
        x: 1841 ; y:120
        source: "globalstation/sitenowdown001.png"
        visible: downstream==1&&nextstation==24 ? true:false
    }
    Image {
            id: sitepass024
            x: 1841; y: 120
            source: "globalstation/sitepass024.png"
            visible: upstream==1&&(24<nextstation||24>endstation||passstation24==24) ? true:false
        }
    Image {
            id: sitenext024
            x: 1841; y: 120
            source: "globalstation/sitenext024.png"
           visible: upstream==1&&24>nextstation&&24<=endstation ? true:false
        }
    Image {
        id: sitenextdown024
        x: 1841; y: 120
        source: "globalstation/sitenextdown001.png"
        visible:downstream==1&&nextstation<24&&24<=endstation ? true:false
    }
    Image {
        id: sitepassdown024
        x: 1841; y:120
        source: "globalstation/sitepassdown001.png"
        visible:downstream==1&&(24>endstation) ? true:false
    }
    Image {
        id: statenextr24
        x: 1841; y: 80
        source: "map_mark/statenextr.png"
         visible:nextstation!==24&&currentstation<=24&&24<=endstation ? true:false
    }
    Image {
        id: statepassr24
        x: 1841; y: 80
        source: "map_mark/statepassr.png"
        visible:nextstation>24&&24>=startstation ? true:false
    }
    Image {
        id: statenow024
        x: 1841; y: 80
        width: 40
        height: 40
        source: "map_mark/statenow.png"
        visible: nextstation==24 ? true:false
    }
    Image {
        id: statenorun24
        x: 1841 ; y: 80
        clip: false
        source: "map_mark/statenorun.png"
        visible: (24<startstation||24>endstation)||(upstream==1&&passstation24==24)||(downstream==1&&passstation1==1) ? true:false
    }
/**********************tts-sitename/nextstation******************/
    Image {
        id: sitename001
        x: 1150; y:5
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
        x: 1180; y: 22
        source: "topstation/tts-sitename001.png"
        visible: nextstation1==1 ? true:false
    }
//***********************************flicker**************************************//
    AnimatedImage {
        id: ttsarrowr001
        x: 105; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==2 ? true:false
    }
     AnimatedImage {
        id: ttsarrowr002
        x: 182; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==3 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr003
        x: 259; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==4 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr004
        x: 336; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==5 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr005
        x:413; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==6 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr006
        x: 490; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==7 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr007
        x: 567; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==8 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr008
        x: 644; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==9 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr009
        x: 721; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==10 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr010
        x: 798; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==11 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr011
        x: 875; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==12 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr012
        x: 952; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==13 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr013
        x: 1029; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==14 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr014
        x: 1106; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==15 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr015
        x: 1183; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==16 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr016
        x: 1260; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==17 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr017
        x: 1337; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==18 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr018
        x: 1414; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==19 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr019
        x: 1491; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==20 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr020
        x: 1568; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==21 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr021
        x: 1645; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==22 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr022
        x: 1722; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==23 ? true:false
    }
    AnimatedImage {
        id: ttsarrowr023
        x: 1799; y:90
        width: 40
        height: 20
        source: "map_mark/global_arrowr.gif"
        visible:nextstation==24 ? true:false
    }

}
