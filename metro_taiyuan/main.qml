import QtQuick 2.12
import QtQuick.Window 2.12
import Models.User 1.0

Window {
    visible: true
    width: 1920
    height: 360

WelcomeUi{
        id:welcomeui
        visible: true
    }

MetroFrame{
    id:root
    ttsstartstation: root.startingstation>=root.terminalstation ? root.terminalstation:root.startingstation
    ttsendstation: root.startingstation>=root.terminalstation ? root.startingstation:root.terminalstation
    startstation: root.startingstation>=root.terminalstation ? (25-root.startingstation):root.startingstation
    endstation: root.startingstation>=root.terminalstation ? (25-root.terminalstation):root.terminalstation
    currentstation: root.startingstation>=root.terminalstation? (25-root.currentstation1):root.currentstation1
    nextstation: root.startingstation>=root.terminalstation ? (25-root.nextstation1):root.nextstation1
    visible:false
}
CurrentStationUi{
    id:currentstationui
    startstation:root.ttsstartstation
    ttsstartstation:root.ttsstartstation
    currentstation:root.currentstation
    endstation:root.ttsendstation
    ttsendstation:root.ttsendstation
    nextstation:root.nextstation
    thisidedoor:root.thisidedoor
    opposotedoor: root.opposotedoor
    upstream: root.upstream
    downstream: root.downstream
    visible: false
}
NextStationUi{
    id:nextstationui
    startstation:root.startstation
    ttsstartstation:root.ttsstartstation
    currentstation:root.currentstation
    endstation:root.endstation
    ttsendstation:root.ttsendstation
    nextstation:root.nextstation
    thisidedoor:root.thisidedoor
    opposotedoor: root.opposotedoor
    upstream: root.upstream
    downstream: root.downstream
    nextstation1: root.nextstation1
    setpass:nextstation<=(endstation-2) ? nextstation:(endstation-2)
    rail01:endstation-startstation==1 ? startstation:0
    rail02:endstation-startstation==2 ? startstation:0
    visible:false
}
}
