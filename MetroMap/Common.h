#ifndef COMMON_H
#define COMMON_H

#include <QDebug>
#include <QString>
#include <QUdpSocket>
#include <QHostAddress>
#include <QTcpSocket>
#include <unistd.h>
#include <QList>
#include <QNetworkInterface>
#include <QTimer>

#define RECV_GQDATA_SIZE 11
#define SEND_GQDATA_SIZE 24
#define MULTICAST_CZGQ_SEND_IP   "225.1.1.45"
#define MULTICAST_CZGQ_SEND_PORT 4005
#define MULTICAST_CZGQ_RECV_IP   "225.1.1.41"
#define MULTICAST_CZGQ_RECV_PORT 4001
#define CONTROL_TRUE 1
#define CONTROL_FALSE 0

//数据段
typedef struct tagGQSendData
{
    quint8 flagTrigger;			//触发标识
    quint8 startingStation;		//起点站【0x01 - 0x48】
    quint8 terminalStation;		//终点站【0x01 - 0x48】
    quint8 currentStation;		//当前站
    quint8 nextStation;			//下一站
    quint8 reserve1;			//保留
    quint8 emergencyAnnouncing;	//紧急广播
    quint8 flagSwitch;			//开关标识【变量待考虑】
    quint8 activeTC;			//激活车头
    quint8 reserve3;			//保留
    quint8 reserve4;			//保留
    quint8 flagControl;			//控制标识
    quint8 dynamicMapVolume;	//动态地图音量
    quint8 reserve5;			//保留
    quint8 dynamicMapLuminance;	//动态地图亮度
    quint8 flagPassStation[6];	//越站标志
} GQSendData;

//接收数据结构体 “帧结构 【帧头】【包长】【数据段】【帧尾】”
typedef struct tagGQPISSendData
{
    quint8      frameHeader;    //帧头    8bit
    quint8      packetLength;   //包长    8bit 标识【数据段】字节总数
    GQSendData	dataSegment;    //数据段  21*8bit
    quint8      frameTail;      //帧尾    8bit
} GQPISSendData;

Q_DECLARE_METATYPE(GQPISSendData);
// 数据段
typedef struct tagFromGQData
{
    quint8 deviceID;            //设备编号ID
    quint8 runStatus;           //运行状态
    quint8 luminance;           //亮度
    quint8 volume;              //音量
    quint8 versionInfo[4];		//版本信息
} FromGQData;

//发送数据结构体
typedef struct tagFromGQDatagram
{
    quint8		frameHeader;    //帧头   8bit
    quint8		packetLength;   //包长   8bit 标识【数据段】字节总数
    FromGQData	dataSegment;    //数据段 64bit
    quint8		frameTail;	    //帧尾   8bit
} FromGQDatagram;

#endif // COMMON_H
