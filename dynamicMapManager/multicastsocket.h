#ifndef MULTICASTSOCKET_H
#define MULTICASTSOCKET_H

#include <QUdpSocket>
#include "communicationData.h"

class MulticastSocket : public QUdpSocket
{
    Q_OBJECT

public:
    explicit MulticastSocket(QUdpSocket *parent = 0);
    ~MulticastSocket();

public:
    qint64 sendTo(QByteArray&);

public slots:
    void dataReceive();

private:
    QUdpSocket sendSocket;	    // Socket for sending data to the host group
    PISRecvData recvData;
};

#endif // MULTICASTSOCKET_H
