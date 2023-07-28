#include "dynamicmap.h"
#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QQuickImageProvider>
#include <QQuickImageResponse>
#include <QImage>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QGuiApplication>

// Ipv4: 192.168.30.128

dynamicmap::dynamicmap()
{
    assert(sizeof(GQControlCommand) == 24);
    memset(&GQControlCommand, 0, sizeof(GQControlCommand));

    DynamicmapIp[0]<<"128";
    DynamicmapIp[1]<<"101";


    ReceivePort = 4001;
    ReceiveIp = "225.1.1.41";
    ReceiveSocket = new QUdpSocket(this);
    ReceiveSocket->bind(QHostAddress::AnyIPv4,ReceivePort,QUdpSocket::ShareAddress);
    QHostAddress myRcastAddr(ReceiveIp);
    ReceiveSocket->joinMulticastGroup(myRcastAddr);
    connect(ReceiveSocket,&QUdpSocket::readyRead,this, &dynamicmap::ReadReceive);

    LocalAddress = Localaddress();
    qDebug()<<"localhost="<<LocalAddress;
}

void dynamicmap::clearChart()
{
    emit changeColor();
}

void dynamicmap::ReadReceive()
{
    emit sdssd();
    QByteArray array;qDebug()<<"ReadReceive";
    QHostAddress add;
    array.resize(ReceiveSocket->pendingDatagramSize());
    ReceiveSocket->readDatagram(array.data(),array.size(),&add,&ReceivePort);
    qDebug()<<"data:"<<array;
    qDebug()<<"array.size()="<<array.length();

    if(array.size() != SEND_GQDATA_SIZE)
    {
        qDebug()<<"数据错误！";
        return;
    }
    else
    {
        GQControlCommand.frameHeader = array[0];//qDebug()<<"GQControlCommand.frameHeader="<<GQControlCommand.frameHeader;
        GQControlCommand.packetLength = array[1];//qDebug()<<"GQControlCommand.packetLength="<<GQControlCommand.packetLength;
        GQControlCommand.dataSegment.flagTrigger = array[2];//qDebug()<<"GQControlCommand.dataSegment.flagTrigger="<<GQControlCommand.dataSegment.flagTrigger;
        GQControlCommand.dataSegment.startingStation = array[3];//qDebug()<<"GQControlCommand.dataSegment.startingStation="<<GQControlCommand.dataSegment.startingStation;
        GQControlCommand.dataSegment.terminalStation = array[4];//qDebug()<<"GQControlCommand.dataSegment.terminalStation="<<GQControlCommand.dataSegment.terminalStation;
        GQControlCommand.dataSegment.currentStation = array[5];//qDebug()<<"GQControlCommand.dataSegment.currentStation="<<GQControlCommand.dataSegment.currentStation;
        GQControlCommand.dataSegment.nextStation = array[6];//qDebug()<<"GQControlCommand.dataSegment.nextStation="<<GQControlCommand.dataSegment.nextStation;
        GQControlCommand.dataSegment.reserve1 = array[7];//qDebug()<<"GQControlCommand.dataSegment.reserve1="<<GQControlCommand.dataSegment.reserve1;
        GQControlCommand.dataSegment.emergencyAnnouncing = array[8];//qDebug()<<"GQControlCommand.dataSegment.emergencyAnnouncing="<<GQControlCommand.dataSegment.emergencyAnnouncing;
        GQControlCommand.dataSegment.flagSwitch = array[9];//qDebug()<<"GQControlCommand.dataSegment.flagSwitch="<<GQControlCommand.dataSegment.flagSwitch;
        GQControlCommand.dataSegment.activeTC = array[10];//qDebug()<<"GQControlCommand.dataSegment.activeTC="<<GQControlCommand.dataSegment.activeTC;
        GQControlCommand.dataSegment.reserve3 = array[11];//qDebug()<<"GQControlCommand.dataSegment.reserve3="<<GQControlCommand.dataSegment.reserve3;
        GQControlCommand.dataSegment.reserve4 = array[12];//qDebug()<<"GQControlCommand.dataSegment.reserve4="<<GQControlCommand.dataSegment.reserve4;
        GQControlCommand.dataSegment.flagControl = array[13];//qDebug()<<"GQControlCommand.dataSegment.flagControl="<<GQControlCommand.dataSegment.flagControl;
        GQControlCommand.dataSegment.dynamicMapVolume = array[14];//qDebug()<<"GQControlCommand.dataSegment.dynamicMapVolume="<<GQControlCommand.dataSegment.dynamicMapVolume;
        GQControlCommand.dataSegment.reserve5 = array[15];//qDebug()<<"GQControlCommand.dataSegment.reserve5="<<GQControlCommand.dataSegment.reserve5;
        GQControlCommand.dataSegment.dynamicMapLuminance = array[16];//qDebug()<<"GQControlCommand.dataSegment.dynamicMapLuminance="<<GQControlCommand.dataSegment.dynamicMapLuminance;
        GQControlCommand.dataSegment.flagPassStation[0] = array[17];//qDebug()<<"GQControlCommand.dataSegment.flagPassStation[0]="<<GQControlCommand.dataSegment.flagPassStation[0];
        GQControlCommand.dataSegment.flagPassStation[1] = array[18];//qDebug()<<"GQControlCommand.dataSegment.flagPassStation[1]="<<GQControlCommand.dataSegment.flagPassStation[1];
        GQControlCommand.dataSegment.flagPassStation[2] = array[19];//qDebug()<<"GQControlCommand.dataSegment.flagPassStation[2]="<<GQControlCommand.dataSegment.flagPassStation[2];
        GQControlCommand.dataSegment.flagPassStation[3] = array[20];//qDebug()<<"GQControlCommand.dataSegment.flagPassStation[3]="<<GQControlCommand.dataSegment.flagPassStation[3];
        GQControlCommand.dataSegment.flagPassStation[4] = array[21];//qDebug()<<"GQControlCommand.dataSegment.flagPassStation[4]="<<GQControlCommand.dataSegment.flagPassStation[4];
        GQControlCommand.dataSegment.flagPassStation[5] = array[22];//qDebug()<<"GQControlCommand.dataSegment.flagPassStation[5]="<<GQControlCommand.dataSegment.flagPassStation[5];
        GQControlCommand.frameTail = array[23];//qDebug()<<"GQControlCommand.frameTail="<<GQControlCommand.frameTail;

       /* if((QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt()<QString::number(GQControlCommand.dataSegment.currentStation,10).toInt()) && QString::number(GQControlCommand.dataSegment.startingStation,10).toInt()<(QString::number(GQControlCommand.dataSegment.currentStation,10).toInt())
                ||(QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt()>QString::number(GQControlCommand.dataSegment.currentStation,10).toInt()) && QString::number(GQControlCommand.dataSegment.startingStation,10).toInt()>(QString::number(GQControlCommand.dataSegment.currentStation,10).toInt()))
            return;*/
        if((QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt()<QString::number(GQControlCommand.dataSegment.nextStation,10).toInt()) && (QString::number(GQControlCommand.dataSegment.startingStation,10).toInt())<(QString::number(GQControlCommand.dataSegment.nextStation,10).toInt())
                ||(QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt()>QString::number(GQControlCommand.dataSegment.nextStation,10).toInt() && QString::number(GQControlCommand.dataSegment.startingStation,10).toInt()>(QString::number(GQControlCommand.dataSegment.nextStation,10).toInt())))
            return;
        if((QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt()==0)||(QString::number(GQControlCommand.dataSegment.startingStation,10).toInt()==0)||QString::number(GQControlCommand.dataSegment.nextStation,10).toInt()==0)
            return;
       /* int Flagbit4 = (1 << 4);
        int Flagbit5 = (1 << 5);
        if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit4) != Flagbit4 &&
                (QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit5) != Flagbit5)
            return;*/
        //if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit5 == 0)&&(QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit4) == 0))
        //return;
        qDebug()<<"------------------";
        FlagTriggerJudge();
        StartingStationJudge();
        TerminalStationJudge();
        CurrentStationJudge();
        NextStationJudge();
        EmergencyAnnouncingJudge();
        FlagSwitchJudge();
        ActiveTCJudge();
        FlagControlJudge();
        DynamicMapVolumeJudge();
        DynamicMapLuminanceJudge();

        FlagPassStation1_Judge();
        FlagPassStation2_Judge();
        FlagPassStation3_Judge();
        FlagPassStation4_Judge();
        FlagPassStation5_Judge();
        FlagPassStation6_Judge();

        emit toQml(GQControlCommand);
    }

}

QString dynamicmap::Localaddress()//本地ip
{
    QList<QHostAddress> list = QNetworkInterface::allAddresses();
    foreach (QHostAddress address, list)
    {
        if(address.protocol() == QAbstractSocket::IPv4Protocol)
        {
            if (address.toString().contains("127.0."))
            {
                continue;
            }
            else
            {
                QString ip4 = address.toString().split('.')[3];
                return ip4;
            }
        }
    }
}

void dynamicmap::FlagTriggerJudge()//bit0:预报站触发 bit1:到站触发
{
//    clearChart();
    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagTrigger,10).toInt() & Flagbit0) == Flagbit0)
    {
        //预报站触发=1
        qDebug()<<"预报站触发=1";
        emit flagTrigger_PreArrivalStation(CONTROL_TRUE);
    }
    else
    {
        //预报站触发=0
        qDebug()<<"预报站触发=0";
        emit flagTrigger_PreArrivalStation(CONTROL_FALSE);
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagTrigger,10).toInt() & Flagbit1) == Flagbit1)
    {
        //到站触发=1
        qDebug()<<"到站触发=1";
        emit flagTrigger_ArrivalStation(CONTROL_TRUE);
    }
    else
    {
        //到站触发=0
        qDebug()<<"到站触发=0";
        emit flagTrigger_ArrivalStation(CONTROL_FALSE);
    }
}

void dynamicmap::StartingStationJudge()//起点站
{
    emit startingStationSignal(QString::number(GQControlCommand.dataSegment.startingStation,10).toInt());

    switch(QString::number(GQControlCommand.dataSegment.startingStation,10).toInt())
    {
    case 1://西山矿务局站
        qDebug()<<"起点站：西山矿务局站";
        break;
    case 2://西铭路站
        qDebug()<<"起点站：西铭路站";
        break;
    case 3://客运西站
        qDebug()<<"起点站：客运西站";
        break;
    case 4://金阳路站
        qDebug()<<"起点站：金阳路站";
        break;
    case 5://小井裕站
        qDebug()<<"起点站：小井裕站";
        break;
    case 6://下元站
        qDebug()<<"起点站：下元站";
        break;
    case 7://迎泽西站
        qDebug()<<"起点站：迎泽西站";
        break;
    case 8://桃园路站
        qDebug()<<"起点站：桃园路站";
        break;
    case 9://大南门站
        qDebug()<<"起点站：大南门站";
        break;
    case 10://柳巷南站
        qDebug()<<"起点站：柳巷南站";
        break;
    case 11://五一广场站
        qDebug()<<"起点站：五一广场站";
        break;
    case 12://建设北路南站
        qDebug()<<"起点站：建设北路南站";
        break;
    case 13://太原站东广场站
        qDebug()<<"起点站：太原站东广场站";
        break;
    case 14://迎泽东大街站
        qDebug()<<"起点站：迎泽东大街站";
        break;
    case 15://朝阳街站
        qDebug()<<"起点站：朝阳街站";
        break;
    case 16://南内环东街站
        qDebug()<<"起点站：南内环东街站";
        break;
    case 17://东太堡站
        qDebug()<<"起点站：东太堡站";
        break;
    case 18://长风东街站
        qDebug()<<"起点站：长风东街站";
        break;
    case 19://学府街东口站
        qDebug()<<"起点站：学府街东口站";
        break;
    case 20://省农科院站
        qDebug()<<"起点站：省农科院站";
        break;
    case 21://太原南站
        qDebug()<<"起点站：太原南站";
        break;
    case 22://中心街东站
        qDebug()<<"起点站：中心街东站";
        break;
    case 23://龙城大街东站
        qDebug()<<"起点站：龙城大街东站";
        break;
    case 24://武宿机场站
        qDebug()<<"起点站：武宿机场站";
        break;
    default:

        break;
    }
}

void dynamicmap::CurrentStationJudge()//当前站
{
    emit currentStationSignal(QString::number(GQControlCommand.dataSegment.currentStation,10).toInt());
    switch(QString::number(GQControlCommand.dataSegment.currentStation,10).toInt())
    {
    case 1://西山矿务局站
        qDebug()<<"起点站：西山矿务局站";
        break;
    case 2://西铭路站
        qDebug()<<"起点站：西铭路站";
        break;
    case 3://客运西站
        qDebug()<<"起点站：客运西站";
        break;
    case 4://金阳路站
        qDebug()<<"起点站：金阳路站";
        break;
    case 5://小井裕站
        qDebug()<<"起点站：小井裕站";
        break;
    case 6://下元站
        qDebug()<<"起点站：下元站";
        break;
    case 7://迎泽西站
        qDebug()<<"起点站：迎泽西站";
        break;
    case 8://桃园路站
        qDebug()<<"起点站：桃园路站";
        break;
    case 9://大南门站
        qDebug()<<"起点站：大南门站";
        break;
    case 10://柳巷南站
        qDebug()<<"起点站：柳巷南站";
        break;
    case 11://五一广场站
        qDebug()<<"起点站：五一广场站";
        break;
    case 12://建设北路南站
        qDebug()<<"起点站：建设北路南站";
        break;
    case 13://太原站东广场站
        qDebug()<<"起点站：太原站东广场站";
        break;
    case 14://迎泽东大街站
        qDebug()<<"起点站：迎泽东大街站";
        break;
    case 15://朝阳街站
        qDebug()<<"起点站：朝阳街站";
        break;
    case 16://南内环东街站
        qDebug()<<"起点站：南内环东街站";
        break;
    case 17://东太堡站
        qDebug()<<"起点站：东太堡站";
        break;
    case 18://长风东街站
        qDebug()<<"起点站：长风东街站";
        break;
    case 19://学府街东口站
        qDebug()<<"起点站：学府街东口站";
        break;
    case 20://省农科院站
        qDebug()<<"起点站：省农科院站";
        break;
    case 21://太原南站
        qDebug()<<"起点站：太原南站";
        break;
    case 22://中心街东站
        qDebug()<<"起点站：中心街东站";
        break;
    case 23://龙城大街东站
        qDebug()<<"起点站：龙城大街东站";
        break;
    case 24://武宿机场站
        qDebug()<<"起点站：武宿机场站";
        break;
    default:

        break;
    }
}

void dynamicmap::TerminalStationJudge()//终点站
{
    emit terminalStationSignal(QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt());

    switch(QString::number(GQControlCommand.dataSegment.terminalStation,10).toInt())
    {
    case 1://西山矿务局站
        qDebug()<<"起点站：西山矿务局站";
        break;
    case 2://西铭路站
        qDebug()<<"起点站：西铭路站";
        break;
    case 3://客运西站
        qDebug()<<"起点站：客运西站";
        break;
    case 4://金阳路站
        qDebug()<<"起点站：金阳路站";
        break;
    case 5://小井裕站
        qDebug()<<"起点站：小井裕站";
        break;
    case 6://下元站
        qDebug()<<"起点站：下元站";
        break;
    case 7://迎泽西站
        qDebug()<<"起点站：迎泽西站";
        break;
    case 8://桃园路站
        qDebug()<<"起点站：桃园路站";
        break;
    case 9://大南门站
        qDebug()<<"起点站：大南门站";
        break;
    case 10://柳巷南站
        qDebug()<<"起点站：柳巷南站";
        break;
    case 11://五一广场站
        qDebug()<<"起点站：五一广场站";
        break;
    case 12://建设北路南站
        qDebug()<<"起点站：建设北路南站";
        break;
    case 13://太原站东广场站
        qDebug()<<"起点站：太原站东广场站";
        break;
    case 14://迎泽东大街站
        qDebug()<<"起点站：迎泽东大街站";
        break;
    case 15://朝阳街站
        qDebug()<<"起点站：朝阳街站";
        break;
    case 16://南内环东街站
        qDebug()<<"起点站：南内环东街站";
        break;
    case 17://东太堡站
        qDebug()<<"起点站：东太堡站";
        break;
    case 18://长风东街站
        qDebug()<<"起点站：长风东街站";
        break;
    case 19://学府街东口站
        qDebug()<<"起点站：学府街东口站";
        break;
    case 20://省农科院站
        qDebug()<<"起点站：省农科院站";
        break;
    case 21://太原南站
        qDebug()<<"起点站：太原南站";
        break;
    case 22://中心街东站
        qDebug()<<"起点站：中心街东站";
        break;
    case 23://龙城大街东站
        qDebug()<<"起点站：龙城大街东站";
        break;
    case 24://武宿机场站
        qDebug()<<"起点站：武宿机场站";
        break;
    default:

        break;
    }
}

void dynamicmap::NextStationJudge()//下一站
{
    emit nextStationSignal(QString::number(GQControlCommand.dataSegment.nextStation,10).toInt());
    switch(QString::number(GQControlCommand.dataSegment.nextStation,10).toInt())
    {
    case 1://西山矿务局站
        qDebug()<<"起点站：西山矿务局站";
        break;
    case 2://西铭路站
        qDebug()<<"起点站：西铭路站";
        break;
    case 3://客运西站
        qDebug()<<"起点站：客运西站";
        break;
    case 4://金阳路站
        qDebug()<<"起点站：金阳路站";
        break;
    case 5://小井裕站
        qDebug()<<"起点站：小井裕站";
        break;
    case 6://下元站
        qDebug()<<"起点站：下元站";
        break;
    case 7://迎泽西站
        qDebug()<<"起点站：迎泽西站";
        break;
    case 8://桃园路站
        qDebug()<<"起点站：桃园路站";
        break;
    case 9://大南门站
        qDebug()<<"起点站：大南门站";
        break;
    case 10://柳巷南站
        qDebug()<<"起点站：柳巷南站";
        break;
    case 11://五一广场站
        qDebug()<<"起点站：五一广场站";
        break;
    case 12://建设北路南站
        qDebug()<<"起点站：建设北路南站";
        break;
    case 13://太原站东广场站
        qDebug()<<"起点站：太原站东广场站";
        break;
    case 14://迎泽东大街站
        qDebug()<<"起点站：迎泽东大街站";
        break;
    case 15://朝阳街站
        qDebug()<<"起点站：朝阳街站";
        break;
    case 16://南内环东街站
        qDebug()<<"起点站：南内环东街站";
        break;
    case 17://东太堡站
        qDebug()<<"起点站：东太堡站";
        break;
    case 18://长风东街站
        qDebug()<<"起点站：长风东街站";
        break;
    case 19://学府街东口站
        qDebug()<<"起点站：学府街东口站";
        break;
    case 20://省农科院站
        qDebug()<<"起点站：省农科院站";
        break;
    case 21://太原南站
        qDebug()<<"起点站：太原南站";
        break;
    case 22://中心街东站
        qDebug()<<"起点站：中心街东站";
        break;
    case 23://龙城大街东站
        qDebug()<<"起点站：龙城大街东站";
        break;
    case 24://武宿机场站
        qDebug()<<"起点站：武宿机场站";
        break;
    default:

        break;
    }
}

void dynamicmap::EmergencyAnnouncingJudge()//紧急广播
{
    if(QString::number(GQControlCommand.dataSegment.emergencyAnnouncing,10).toInt() >0 &&
            QString::number(GQControlCommand.dataSegment.emergencyAnnouncing,10).toInt() <51)
    {
        //全屏显示对应的紧急广播图片
        qDebug()<<"全屏显示对应的紧急广播图片";
        emit emergencyAnnouncingSignal(CONTROL_TRUE);
    }
    else
    {
        //显示正常报站界面
        qDebug()<<"显示正常报站界面";
        emit emergencyAnnouncingSignal(CONTROL_FALSE);
    }
}

void dynamicmap::FlagSwitchJudge()//开关表示 bit0:越站有效 bit3:上下行有效 bit4:开右侧门 bit5:开左侧门 bit6:下行 bit7:上行
{
    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit0) == Flagbit0)
    {
        //越站有效=1
        qDebug()<<"越站有效=1";
        emit flagSwitch_CrossingStation(CONTROL_TRUE);
    }
    else
    {
        //越站有效=0
        qDebug()<<"越站有效=0";
        emit flagSwitch_CrossingStation(CONTROL_FALSE);
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit3) == Flagbit3)
    {
        //上下行有效=1
        qDebug()<<"上下行有效=1";
        emit flagSwitch_UpDownStream(CONTROL_TRUE);
    }
    else
    {
        //上下行有效=0
        qDebug()<<"上下行有效=0";
        emit flagSwitch_UpDownStream(CONTROL_FALSE);
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit6) == Flagbit6)
    {
        //下行=1
        qDebug()<<"下行=1";
        emit flagSwitch_DownStream(CONTROL_TRUE);
    }
    else
    {
        //下行=0
        qDebug()<<"下行=0";
        emit flagSwitch_DownStream(CONTROL_FALSE);
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit7) == Flagbit7)
    {
        //上行=1
        qDebug()<<"上行=1";
        emit flagSwitch_UpStream(CONTROL_TRUE);
    }
    else
    {
        //上行=0
        qDebug()<<"上行=0";
        emit flagSwitch_UpStream(CONTROL_FALSE);
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit4) == Flagbit4)
    {
        //开右侧门=1
        qDebug()<<"开右侧门=1";
        if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit7) == Flagbit7)//上行
        {
            if(DynamicmapIp[0].contains(LocalAddress))
            {
                //对侧开门
                qDebug()<<"对侧开门";
                emit flagSwitch_Oppositedoor(CONTROL_TRUE);
            }
            else
            {
                emit flagSwitch_Oppositedoor(CONTROL_FALSE);
            }
            if(DynamicmapIp[1].contains(LocalAddress))
            {
                //本侧开门
                qDebug()<<"本侧开门";
                emit flagSwitch_Thissidedoor(CONTROL_TRUE);
            }
            else
            {
              emit flagSwitch_Thissidedoor(CONTROL_FALSE);
            }
        }
        if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit6) == Flagbit6)//下行
        {
            if(DynamicmapIp[0].contains(LocalAddress))
            {
                //本侧开门
                qDebug()<<"本侧开门";
                emit flagSwitch_Thissidedoor(CONTROL_TRUE);
            }
            else
            {
                emit flagSwitch_Thissidedoor(CONTROL_FALSE);
            }
            if(DynamicmapIp[1].contains(LocalAddress))
            {
                //对侧开门
                qDebug()<<"对侧开门";
                emit flagSwitch_Oppositedoor(CONTROL_TRUE);
            }
            else
            {
                emit flagSwitch_Oppositedoor(CONTROL_FALSE);
            }
        }
    }
    else
    {
        //开右侧门=0
        qDebug()<<"开右侧门=0";
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit5) == Flagbit5)
    {
        //开左侧门=1
        qDebug()<<"开左侧门=1";
        if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit7) == Flagbit7)//上行
        {
            if(DynamicmapIp[0].contains(LocalAddress))
            {
                //本侧开门
                qDebug()<<"本侧开门";
                emit flagSwitch_Thissidedoor(CONTROL_TRUE);
            }
            else
            {
                emit flagSwitch_Thissidedoor(CONTROL_FALSE);
            }
            if(DynamicmapIp[1].contains(LocalAddress))
            {
                //对侧开门
                qDebug()<<"对侧开门";
                emit flagSwitch_Oppositedoor(CONTROL_TRUE);
            }
            else
            {
                emit flagSwitch_Oppositedoor(CONTROL_FALSE);
            }
        }
        if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit6) == Flagbit6)//下行
        {
            if(DynamicmapIp[0].contains(LocalAddress))
            {
                //对侧开门
                qDebug()<<"对侧开门";
                emit flagSwitch_Oppositedoor(CONTROL_TRUE);
            }
            else
            {
              emit flagSwitch_Oppositedoor(CONTROL_FALSE);
            }
            if(DynamicmapIp[1].contains(LocalAddress))
            {
                //本侧开门
                qDebug()<<"本侧开门";
                emit flagSwitch_Thissidedoor(CONTROL_TRUE);
            }
            else
            {
               emit flagSwitch_Thissidedoor(CONTROL_FALSE);
            }
        }
    }
    else
    {
        //开左侧门=0
        qDebug()<<"开左侧门=0";
    }
}

void dynamicmap::ActiveTCJudge()//激活车头 bit6:TC2激活 bit7:TC1激活
{
    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.activeTC,10).toInt() & Flagbit6) == Flagbit6)
    {
        //TC2激活=1
        qDebug()<<"TC2激活=1";
        emit activeTCSignal(1);
    }
    else
    {
        //TC2激活=0
        qDebug()<<"TC2激活=0";
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagSwitch,10).toInt() & Flagbit7) == Flagbit7)
    {
        //TC1激活=1
        qDebug()<<"TC1激活=1";
        emit activeTCSignal(2);
    }
    else
    {
        //TC1激活=0
        qDebug()<<"TC1激活=0";
    }
}

void dynamicmap::FlagControlJudge()//控制标识 bit2:LCD亮度控制 bit3:防烧结控制 bit4:LCD音量控制
{
    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagControl,10).toInt() & Flagbit2) == Flagbit2)
    {
        //LCD亮度控制=1
        qDebug()<<"LCD亮度控制=1";
        emit flagControl_LCDbrightness(CONTROL_TRUE);
    }
    else
    {
        //LCD亮度控制=0
        qDebug()<<"LCD亮度控制=0";
        emit flagControl_LCDbrightness(CONTROL_FALSE);
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagControl,10).toInt() & Flagbit3) == Flagbit3)
    {
        //防烧结控制=1
        qDebug()<<"防烧结控制=1";
        emit flagControl_Antisintering(CONTROL_TRUE);
    }
    else
    {
        //防烧结控制=0
        qDebug()<<"防烧结控制=0";
        emit flagControl_Antisintering(CONTROL_FALSE);
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagControl,10).toInt() & Flagbit4) == Flagbit4)
    {
        //LCD音量控制=1
        qDebug()<<"LCD音量控制=1";
        emit flagControl_LCDvolume(CONTROL_TRUE);
    }
    else
    {
        //LCD音量控制=0
        qDebug()<<"LCD音量控制=0";
        emit flagControl_LCDvolume(CONTROL_FALSE);
    }
}

void dynamicmap::DynamicMapVolumeJudge()//动态地图音量
{
    emit dynamicMapVolumeSignal(QString::number(GQControlCommand.dataSegment.dynamicMapVolume,10).toInt());

    if(QString::number(GQControlCommand.dataSegment.dynamicMapVolume,10).toInt() > 0 &&
            QString::number(GQControlCommand.dataSegment.dynamicMapVolume,10).toInt() <= 100)
    {
        //音量1～100
        qDebug()<<"音量1～100";
    }
    else if(QString::number(GQControlCommand.dataSegment.dynamicMapVolume,10).toInt() <= 0)
    {
        //音量<1
    }
    else
    {
        //音量>100
    }
}

void dynamicmap::DynamicMapLuminanceJudge()//动态地图亮度
{
    emit dynamicMapLuminanceSignal(QString::number(GQControlCommand.dataSegment.dynamicMapLuminance,10).toInt());

    if(QString::number(GQControlCommand.dataSegment.dynamicMapLuminance,10).toInt() > 0 &&
            QString::number(GQControlCommand.dataSegment.dynamicMapLuminance,10).toInt() <= 100)
    {
        //亮度1～100
        qDebug()<<"亮度1～100";
    }
    else if(QString::number(GQControlCommand.dataSegment.dynamicMapLuminance,10).toInt() <= 0)
    {
        //亮度<1
    }
    else
    {
        //亮度>100
    }
}

void dynamicmap::FlagPassStation1_Judge()//越站标志1
{
    emit flagPassStation1Signal(QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt());

    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit0) == Flagbit0)
    {
        //站点1越站
        qDebug()<<"站点1越站";
        emit flagPassStationSignal1(1);
    }
    else
    {
        //站点1不越站
        qDebug()<<"站点1不越站";
        emit flagPassStationSignal1(0);
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit1) == Flagbit1)
    {
        //站点2越站
        qDebug()<<"站点2越站";
       emit flagPassStationSignal2(2);
    }
    else
    {
        //站点2不越站
        qDebug()<<"站点2不越站";
        emit flagPassStationSignal2(0);
    }

    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit2) == Flagbit2)
    {
        //站点3越站
        qDebug()<<"站点3越站";
        emit flagPassStationSignal3(3);
    }
    else
    {
        //站点3不越站
        qDebug()<<"站点3不越站";
        emit flagPassStationSignal3(0);
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit3) == Flagbit3)
    {
        //站点4越站
        qDebug()<<"站点4越站";
        emit flagPassStationSignal4(4);
    }
    else
    {
        //站点4不越站
        qDebug()<<"站点4不越站";
        emit flagPassStationSignal4(0);
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit4) == Flagbit4)
    {
        //站点5越站
        qDebug()<<"站点5越站";
        emit flagPassStationSignal5(5);
    }
    else
    {
        //站点5不越站
        qDebug()<<"站点5不越站";
        emit flagPassStationSignal5(0);
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit5) == Flagbit5)
    {
        //站点6越站
        qDebug()<<"站点6越站";
        emit flagPassStationSignal6(6);
    }
    else
    {
        //站点6不越站
        qDebug()<<"站点6不越站";
        emit flagPassStationSignal6(0);
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit6) == Flagbit6)
    {
        //站点7越站
        qDebug()<<"站点7越站";
        emit flagPassStationSignal7(7);
    }
    else
    {
        //站点7不越站
        qDebug()<<"站点7不越站";
        emit flagPassStationSignal7(0);
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[0],10).toInt() & Flagbit7) == Flagbit7)
    {
        //站点8越站
        qDebug()<<"站点8越站";
        emit  flagPassStationSignal8(8);
    }
    else
    {
        //站点8不越站
        qDebug()<<"站点8不越站";
        emit  flagPassStationSignal8(0);
    }
}

void dynamicmap::FlagPassStation2_Judge()//越站标志2
{
    emit flagPassStation2Signal(QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt());

    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit0) == Flagbit0)
    {
        //站点9越站
        qDebug()<<"站点9越站";
        emit  flagPassStationSignal9(9);
    }
    else
    {
        //站点9不越站
        qDebug()<<"站点9不越站";
        emit  flagPassStationSignal9(0);
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit1) == Flagbit1)
    {
        //站点10越站
        qDebug()<<"站点10越站";
        emit flagPassStationSignal10(10);
    }
    else
    {
        //站点10不越站
        qDebug()<<"站点10不越站";
        emit flagPassStationSignal10(0);
    }

    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit2) == Flagbit2)
    {
        //站点11越站
        qDebug()<<"站点11越站";
        emit flagPassStationSignal11(11);
    }
    else
    {
        //站点11不越站
        qDebug()<<"站点11不越站";
        emit flagPassStationSignal11(0);
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit3) == Flagbit3)
    {
        //站点12越站
        qDebug()<<"站点12越站";
        emit flagPassStationSignal12(12);
    }
    else
    {
        //站点12不越站
        qDebug()<<"站点12不越站";
        emit flagPassStationSignal12(0);
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit4) == Flagbit4)
    {
        //站点13越站
        qDebug()<<"站点13越站";
        emit flagPassStationSignal13(13);
    }
    else
    {
        //站点13不越站
        qDebug()<<"站点13不越站";
        emit flagPassStationSignal13(0);
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit5) == Flagbit5)
    {
        //站点14越站
        qDebug()<<"站点14越站";
        emit flagPassStationSignal14(14);
    }
    else
    {
        //站点14不越站
        qDebug()<<"站点14不越站";
        emit flagPassStationSignal14(0);
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit6) == Flagbit6)
    {
        //站点15越站
        qDebug()<<"站点15越站";
        emit flagPassStationSignal15(15);
    }
    else
    {
        //站点15不越站
        qDebug()<<"站点15不越站";
        emit flagPassStationSignal15(0);
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[1],10).toInt() & Flagbit7) == Flagbit7)
    {
        //站点16越站
        qDebug()<<"站点16越站";
        emit flagPassStationSignal16(16);
    }
    else
    {
        //站点16不越站
        qDebug()<<"站点16不越站";
        emit flagPassStationSignal16(0);
    }
}

void dynamicmap::FlagPassStation3_Judge()//越站标志3
{
    emit flagPassStation3Signal(QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt());

    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit0) == Flagbit0)
    {
        //站点17越站
        qDebug()<<"站点17越站";
        emit flagPassStationSignal17(17);
    }
    else
    {
        //站点17不越站
        qDebug()<<"站点17不越站";
        emit flagPassStationSignal17(0);
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit1) == Flagbit1)
    {
        //站点18越站
        qDebug()<<"站点18越站";
        emit flagPassStationSignal18(18);
    }
    else
    {
        //站点18不越站
        qDebug()<<"站点18不越站";
        emit flagPassStationSignal18(0);
    }

    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit2) == Flagbit2)
    {
        //站点19越站
        qDebug()<<"站点19越站";
        emit flagPassStationSignal19(19);
    }
    else
    {
        //站点19不越站
        qDebug()<<"站点19不越站";
        emit flagPassStationSignal19(0);
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit3) == Flagbit3)
    {
        //站点20越站
        qDebug()<<"站点20越站";
        emit flagPassStationSignal20(20);
    }
    else
    {
        //站点20不越站
        qDebug()<<"站点20不越站";
        emit flagPassStationSignal20(0);
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit4) == Flagbit4)
    {
        //站点21越站
        qDebug()<<"站点21越站";
        emit flagPassStationSignal21(21);
    }
    else
    {
        //站点21不越站
        qDebug()<<"站点21不越站";
        emit flagPassStationSignal21(0);
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit5) == Flagbit5)
    {
        //站点22越站
        qDebug()<<"站点22越站";
        emit flagPassStationSignal22(22);
    }
    else
    {
        //站点22不越站
        qDebug()<<"站点22不越站";
        emit flagPassStationSignal22(0);
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit6) == Flagbit6)
    {
        //站点23越站
        qDebug()<<"站点23越站";
        emit flagPassStationSignal23(23);
    }
    else
    {
        //站点23不越站
        qDebug()<<"站点23不越站";
         emit flagPassStationSignal23(0);
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[2],10).toInt() & Flagbit7) == Flagbit7)
    {
        //站点24越站
        qDebug()<<"站点24越站";
        emit flagPassStationSignal24(24);
    }
    else
    {
        //站点24不越站
        qDebug()<<"站点24不越站";
         emit flagPassStationSignal24(0);
    }
}

void dynamicmap::FlagPassStation4_Judge()//越站标志4
{
    emit flagPassStation4Signal(QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt());

    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit0) == Flagbit0)
    {
        //站点25越站
        qDebug()<<"站点25越站";
        emit flagPassStationSignal25(25);
    }
    else
    {
        //站点25不越站
        qDebug()<<"站点25不越站";
        emit flagPassStationSignal25(0);
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit1) == Flagbit1)
    {
        //站点26越站
        qDebug()<<"站点26越站";
        emit flagPassStationSignal26(26);
    }
    else
    {
        //站点26不越站
        qDebug()<<"站点26不越站";
        emit flagPassStationSignal26(0);
    }

    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit2) == Flagbit2)
    {
        //站点27越站
        qDebug()<<"站点27越站";
        emit flagPassStationSignal27(27);
    }
    else
    {
        //站点27不越站
        qDebug()<<"站点27不越站";
        emit flagPassStationSignal27(0);
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit3) == Flagbit3)
    {
        //站点28越站
        qDebug()<<"站点28越站";
        emit flagPassStationSignal28(28);
    }
    else
    {
        //站点28不越站
        qDebug()<<"站点28不越站";
        emit flagPassStationSignal28(0);
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit4) == Flagbit4)
    {
        //站点29越站
        qDebug()<<"站点29越站";
        emit flagPassStation4Signal(2);
    }
    else
    {
        //站点29不越站
        qDebug()<<"站点29不越站";
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit5) == Flagbit5)
    {
        //站点30越站
        qDebug()<<"站点30越站";
    }
    else
    {
        //站点30不越站
        qDebug()<<"站点30不越站";
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit6) == Flagbit6)
    {
        //站点31越站
        qDebug()<<"站点31越站";
    }
    else
    {
        //站点31不越站
        qDebug()<<"站点31不越站";
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[3],10).toInt() & Flagbit7) == Flagbit7)
    {
        //站点32越站
        qDebug()<<"站点32越站";
    }
    else
    {
        //站点32不越站
        qDebug()<<"站点32不越站";
    }
}

void dynamicmap::FlagPassStation5_Judge()//越站标志5
{
    emit flagPassStation5Signal(QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt());

    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit0) == Flagbit0)
    {
        //站点33越站
        qDebug()<<"站点33越站";
    }
    else
    {
        //站点33不越站
        qDebug()<<"站点33不越站";
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit1) == Flagbit1)
    {
        //站点34越站
        qDebug()<<"站点34越站";
    }
    else
    {
        //站点34不越站
        qDebug()<<"站点34不越站";
    }

    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit2) == Flagbit2)
    {
        //站点35越站
        qDebug()<<"站点35越站";
    }
    else
    {
        //站点35不越站
        qDebug()<<"站点35不越站";
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit3) == Flagbit3)
    {
        //站点36越站
        qDebug()<<"站点36越站";
    }
    else
    {
        //站点36不越站
        qDebug()<<"站点36不越站";
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit4) == Flagbit4)
    {
        //站点37越站
        qDebug()<<"站点37越站";
    }
    else
    {
        //站点37不越站
        qDebug()<<"站点37不越站";
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit5) == Flagbit5)
    {
        //站点38越站
        qDebug()<<"站点38越站";
    }
    else
    {
        //站点38不越站
        qDebug()<<"站点38不越站";
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit6) == Flagbit6)
    {
        //站点39越站
        qDebug()<<"站点39越站";
    }
    else
    {
        //站点39不越站
        qDebug()<<"站点39不越站";
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[4],10).toInt() & Flagbit7) == Flagbit7)
    {
        //站点40越站
        qDebug()<<"站点40越站";
    }
    else
    {
        //站点40不越站
        qDebug()<<"站点40不越站";
    }
}

void dynamicmap::FlagPassStation6_Judge()//越站标志6
{
    emit flagPassStation6Signal(QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt());

    int Flagbit0 = (1 << 0);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit0) == Flagbit0)
    {
        //站点41越站
        qDebug()<<"站点41越站";
    }
    else
    {
        //站点41不越站
        qDebug()<<"站点41不越站";
    }

    int Flagbit1 = (1 << 1);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit1) == Flagbit1)
    {
        //站点42越站
        qDebug()<<"站点42越站";
    }
    else
    {
        //站点42不越站
        qDebug()<<"站点42不越站";
    }

    int Flagbit2 = (1 << 2);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit2) == Flagbit2)
    {
        //站点43越站
        qDebug()<<"站点43越站";
    }
    else
    {
        //站点43不越站
        qDebug()<<"站点43不越站";
    }

    int Flagbit3 = (1 << 3);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit3) == Flagbit3)
    {
        //站点44越站
        qDebug()<<"站点44越站";
    }
    else
    {
        //站点44不越站
        qDebug()<<"站点44不越站";
    }

    int Flagbit4 = (1 << 4);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit4) == Flagbit4)
    {
        //站点45越站
        qDebug()<<"站点45越站";
    }
    else
    {
        //站点45不越站
        qDebug()<<"站点45不越站";
    }

    int Flagbit5 = (1 << 5);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit5) == Flagbit5)
    {
        //站点46越站
        qDebug()<<"站点46越站";
    }
    else
    {
        //站点46不越站
        qDebug()<<"站点46不越站";
    }

    int Flagbit6 = (1 << 6);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit6) == Flagbit6)
    {
        //站点47越站
        qDebug()<<"站点47越站";
    }
    else
    {
        //站点47不越站
        qDebug()<<"站点47不越站";
    }

    int Flagbit7 = (1 << 7);
    if((QString::number(GQControlCommand.dataSegment.flagPassStation[5],10).toInt() & Flagbit7) == Flagbit7)
    {
        //站点48越站
        qDebug()<<"站点48越站";
    }
    else
    {
        //站点48不越站
        qDebug()<<"站点48不越站";
    }
}
