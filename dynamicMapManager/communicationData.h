#ifndef COMMUNICATIONDATA_H
#define COMMUNICATIONDATA_H

#include <qglobal.h>
#include <QString>

//
//1.网络通讯协议【协议名称：N10V6、版本号：V1.0】
//
#define MULTICAST_SEND_IP   "225.1.1.41"
#define MULTICAST_SEND_PORT 4001

#define MULTICAST_RECV_IP   "225.1.1.45"
#define MULTICAST_RECV_PORT 4005

//
//（1）动态地图，客视屏接收
//

//数据段
typedef struct tagSendData
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
} SendData;

//接收数据结构体 “帧结构 【帧头】【包长】【数据段】【帧尾】”
typedef struct tagPISSendData
{
    quint8      frameHeader;    //帧头    8bit
    quint8      packetLength;   //包长    8bit 标识【数据段】字节总数
    SendData	dataSegment;    //数据段  21*8bit
    quint8      frameTail;      //帧尾    8bit
} PISSendData;

//
//（2）动态地图，客室屏发送
//

// 数据段
typedef struct tagRecvData
{
    quint8 deviceID;			//设备编号ID
    quint8 runStatus;			//运行状态
    quint8 luminance;           //亮度
    quint8 volume;              //音量
    quint8 versionInfo[4];		//版本信息
} RecvData;


//发送数据结构体
typedef struct tagPISRecvData
{
    quint8		frameHeader;    //帧头   8bit
    quint8		packetLength;   //包长   8bit 标识【数据段】字节总数
    RecvData	dataSegment;    //数据段 64bit
    quint8		frameTail;	    //帧尾   8bit
} PISRecvData;

typedef struct  tagStationInfo
{
    quint8 id;
    QString major;
}StationInfo;

#endif // COMMUNICATIONDATA_H
