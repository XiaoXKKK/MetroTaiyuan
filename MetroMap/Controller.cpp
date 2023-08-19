#include <QQmlApplicationEngine>
#include <QQuickView>
#include <QQmlContext>
#include <QQuickImageProvider>
#include <QQuickImageResponse>
#include <QImage>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QGuiApplication>

#include "Controller.h"

Controller::Controller(){
    assert(sizeof(_packet) == 24);
    memset(&_packet, 0, sizeof(_packet));

    DynamicmapIp[0]<<"128";
    DynamicmapIp[1]<<"101";


    quint16 ReceivePort = MULTICAST_CZGQ_RECV_PORT;
    QString ReceiveIp = MULTICAST_CZGQ_RECV_IP;
    ReceiveSocket = new QUdpSocket(this);
    ReceiveSocket->bind(QHostAddress::AnyIPv4,ReceivePort,QUdpSocket::ShareAddress);
    QHostAddress myRcastAddr(ReceiveIp);
    ReceiveSocket->joinMulticastGroup(myRcastAddr);
    connect(ReceiveSocket, &QUdpSocket::readyRead, this, &Controller::ReadReceive);

    LocalAddress = Localaddress();
    qDebug()<<"localhost="<<LocalAddress;
}

QString Controller::Localaddress()//本地ip
{
    QList<QHostAddress> list = QNetworkInterface::allAddresses();
    foreach (QHostAddress address, list)
    {
        if(address.protocol() == QAbstractSocket::IPv4Protocol)
        {
            if (address.toString().contains("127.0."))
                continue;
            else
            {
                QString ip4 = address.toString().split('.')[3];
                qDebug() << address;
                return ip4;
            }
        }
    }
}

void Controller::ReadReceive()
{
    QByteArray datagram;
    datagram.resize(int(ReceiveSocket->pendingDatagramSize()));
    ReceiveSocket->readDatagram(datagram.data(),datagram.size());
    memcpy(&_packet, datagram.data(), sizeof(_packet));
    qDebug()<<"packet="<<datagram;
    _start = _packet.dataSegment.startingStation - 1;
    _end = _packet.dataSegment.terminalStation - 1;
    _now = _packet.dataSegment.currentStation - 1;
    _next = _packet.dataSegment.nextStation - 1;


    quint8 flag = _packet.dataSegment.flagSwitch;
    _door = (DynamicmapIp[0].contains(LocalAddress) && ((flag>>5)&1)) || (DynamicmapIp[1].contains(LocalAddress) && ((flag>>4)&1));
    _direction = ((flag>>7)&1);
    _pass = 0;
    memcpy(&_pass, _packet.dataSegment.flagPassStation, 6);
    qDebug()<<"pass="<<_pass;
    qDebug()<<"start="<<_start;
    qDebug()<<"end="<<_end;
    qDebug()<<"now="<<_now;
    qDebug()<<"next="<<_next;
    // bit0:越站有效 bit3:上下行有效 bit4:开右侧门 bit5:开左侧门 bit6:下行 bit7:上行
    emit dataChanged();
}
