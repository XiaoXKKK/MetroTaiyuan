#include "multicastsocket.h"
#include "dialog.h"

#include <QDebug>
#include <QMessageBox>
#include <QTextStream>


MulticastSocket::MulticastSocket(QUdpSocket *parent) : QUdpSocket(parent)
{
    // 采用ShareAddress模式(即允许其它的服务连接到相同的地址和端口，特别是用在多客户端监听同一个服务器端口等时特别有效)，和ReuseAddressHint模式(重新连接服务器)
    if(!this->bind(MULTICAST_RECV_PORT, QUdpSocket::ShareAddress | QUdpSocket::ReuseAddressHint))
    {
        qDebug() << "绑定失败！" << error();
    }

    if(!this->joinMulticastGroup(QHostAddress(MULTICAST_RECV_IP)))
    {
        qDebug() << "加入组播失败！" << error();
    }



    // 信号与槽关联
    connect(this, SIGNAL(readyRead()), this, SLOT(dataReceive()));
}

MulticastSocket::~MulticastSocket()
{

}

//
void MulticastSocket::dataReceive()
{
    qint64 recvDataLen = pendingDatagramSize();
    QByteArray datagram;
    datagram.resize(recvDataLen);
    readDatagram(datagram.data(), recvDataLen);

    memcpy(&recvData, datagram.data(), recvDataLen);
    QString strOutput("设备" + QString("%1").arg(QString::number(recvData.dataSegment.deviceID), 3, QLatin1Char('0')) + " 处在");
    switch(recvData.dataSegment.runStatus)
    {
    case 0x01:
        strOutput += "运行";
        break;
    case 0x02:
        strOutput += "升级";
        break;
    case 0x03:
        strOutput += "维护";
        break;
    case 0x04:
        strOutput += "保护";
        break;
    case 0xFF:
        strOutput += "故障";
        break;
    default:
        break;
    }
    strOutput += "状态";
    strOutput += " 亮度" + QString::number(recvData.dataSegment.luminance) +
                 " 声音" + QString::number(recvData.dataSegment.volume);

    strOutput += " 版本号" + QString("%1%2%3%4").arg(
                QString::number(recvData.dataSegment.versionInfo[0], 16), 2, QLatin1Char('0')).arg(
                QString::number(recvData.dataSegment.versionInfo[1], 16), 2, QLatin1Char('0')).arg(
                QString::number(recvData.dataSegment.versionInfo[2], 16), 2, QLatin1Char('0')).arg(
                QString::number(recvData.dataSegment.versionInfo[3], 16), 2, QLatin1Char('0'));
    qDebug() << strOutput;
}

//
qint64 MulticastSocket::sendTo(QByteArray &datagram)
{
    PISSendData *pisSendData = (PISSendData*)datagram.data();

//    qDebug() << "帧头：" << pisSendData->frameHeader;
//    qDebug() << "包长：" << pisSendData->packetLength;

//    qDebug() << "起点站：" << pisSendData->dataSegment.startingStation;
//    qDebug() << "终点站：" << pisSendData->dataSegment.terminalStation;
//    qDebug() << "当前站：" << pisSendData->dataSegment.currentStation;
//    qDebug() << "下一站：" << pisSendData->dataSegment.nextStation;

//    qDebug() << "紧急广播：" << pisSendData->dataSegment.emergencyAnnouncing;
//    qDebug() << "9Byte：" << pisSendData->dataSegment.flagSwitch;
//    qDebug() << "TC激活：" << pisSendData->dataSegment.activeTC;
//    qDebug() << "13Byte：" << pisSendData->dataSegment.flagControl;
//    qDebug() << "客室屏音量：" << pisSendData->dataSegment.dynamicMapVolume;
//    qDebug() << "客室屏亮度：" << pisSendData->dataSegment.dynamicMapLuminance;
//    qDebug() << "帧尾：" << pisSendData->frameTail;

    qDebug() << datagram.toHex();
    return sendSocket.writeDatagram(datagram, QHostAddress(MULTICAST_SEND_IP), MULTICAST_SEND_PORT);
}
