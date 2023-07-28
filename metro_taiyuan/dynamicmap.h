#ifndef DYNAMICMAP_H
#define DYNAMICMAP_H

#include <QObject>
#include <QQuickItem>

#include "Common.h"

class dynamicmap : public QQuickItem
{
    Q_OBJECT
public:
    dynamicmap();

    Q_INVOKABLE void clearChart();

private:
    QString LocalAddress;

    QStringList DynamicmapIp[2];

    QUdpSocket *ReceiveSocket;

    quint16 ReceivePort;

    QString ReceiveIp;

    GQPISSendData GQControlCommand;  //控制高清设备结构

public:
    QString Localaddress();//本地ip

    Q_INVOKABLE void FlagTriggerJudge();//触发标识

    Q_INVOKABLE void StartingStationJudge();//起点站

    Q_INVOKABLE void TerminalStationJudge();//终点站

    Q_INVOKABLE void CurrentStationJudge();//当前站

    Q_INVOKABLE void NextStationJudge();//下一站

    Q_INVOKABLE void EmergencyAnnouncingJudge();//紧急广播

    Q_INVOKABLE void FlagSwitchJudge();//开关表示

    Q_INVOKABLE void ActiveTCJudge();//激活车头

    Q_INVOKABLE void FlagControlJudge();//控制标识

    Q_INVOKABLE void DynamicMapVolumeJudge();//动态地图音量

    Q_INVOKABLE void DynamicMapLuminanceJudge();//动态地图亮度

    Q_INVOKABLE void FlagPassStation1_Judge();//越战标志1

    Q_INVOKABLE void FlagPassStation2_Judge();//越战标志2

    Q_INVOKABLE void FlagPassStation3_Judge();//越战标志3

    Q_INVOKABLE void FlagPassStation4_Judge();//越战标志4

    Q_INVOKABLE void FlagPassStation5_Judge();//越战标志5

    Q_INVOKABLE void FlagPassStation6_Judge();//越战标志6

signals:
    void toQml(GQPISSendData );

    void changeColor();

    void sdssd();


    void flagTrigger_PreArrivalStation(int val);//预到站触发

    void flagTrigger_ArrivalStation(int val);//到站触发

    void startingStationSignal(int val);//*起点站

    void terminalStationSignal(int val);//*终点站

    void currentStationSignal(int val);//*当前站

    void nextStationSignal(int val);//*下一站

    void emergencyAnnouncingSignal(int val);//*紧急广播

    void flagSwitch_CrossingStation(int val);//越站有效

    void flagSwitch_UpDownStream(int val);//上下行有效

    void flagSwitch_UpStream(int val);//上行

    void flagSwitch_DownStream(int val);//下行

    void flagSwitch_Oppositedoor(int val);//对侧开门

    void flagSwitch_Thissidedoor(int val);//本侧开门

    void activeTCSignal(int val);//*激活车头

    void flagControl_LCDbrightness(int val);//LCD亮度控制  0

    void flagControl_Antisintering(int val);//防烧结控制

    void flagControl_LCDvolume(int val);//LCD音量控制

    void dynamicMapVolumeSignal(int val);//*动态地图音量

    void dynamicMapLuminanceSignal(int val);//*动态地图亮度

    void flagPassStation1Signal(int val);//越战标志1

    void flagPassStation2Signal(int val);//越战标志2

    void flagPassStation3Signal(int val);//越战标志3

    void flagPassStation4Signal(int val);//越战标志4

    void flagPassStation5Signal(int val);//越战标志5

    void flagPassStation6Signal(int val);//越战标志6
    void flagPassStationSignal1(int val);
    void flagPassStationSignal2(int val);
    void flagPassStationSignal3(int val);
    void flagPassStationSignal4(int val);
    void flagPassStationSignal5(int val);
    void flagPassStationSignal6(int val);
    void flagPassStationSignal7(int val);
    void flagPassStationSignal8(int val);
    void flagPassStationSignal9(int val);
    void flagPassStationSignal10(int val);
    void flagPassStationSignal11(int val);
    void flagPassStationSignal12(int val);
    void flagPassStationSignal13(int val);
    void flagPassStationSignal14(int val);
    void flagPassStationSignal15(int val);
    void flagPassStationSignal16(int val);
    void flagPassStationSignal17(int val);
    void flagPassStationSignal18(int val);
    void flagPassStationSignal19(int val);
    void flagPassStationSignal20(int val);
    void flagPassStationSignal21(int val);
    void flagPassStationSignal22(int val);
    void flagPassStationSignal23(int val);
    void flagPassStationSignal24(int val);
    void flagPassStationSignal25(int val);
    void flagPassStationSignal26(int val);
    void flagPassStationSignal27(int val);
    void flagPassStationSignal28(int val);
    void flagPassStationSignal29(int val);
    void flagPassStationSignal30(int val);
private slots:
     void ReadReceive();

public slots:
};

#endif // DYNAMICMAP_H
