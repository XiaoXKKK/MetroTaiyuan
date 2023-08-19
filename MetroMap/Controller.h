#ifndef CONTROLLER_H
#define CONTROLLER_H

#include <QObject>
#include <QQuickItem>

#include "Common.h"

class Controller : public QQuickItem
{
    Q_OBJECT
public:
    Controller();
    Q_PROPERTY(int start MEMBER _start)
    Q_PROPERTY(int end MEMBER _end)
    Q_PROPERTY(int now MEMBER _now)
    Q_PROPERTY(int next MEMBER _next)
    Q_PROPERTY(bool door MEMBER _door)
    Q_PROPERTY(bool direction MEMBER _direction)
    Q_PROPERTY(int pass MEMBER _pass)
private:
    QString LocalAddress;
    QStringList DynamicmapIp[2];
    GQPISSendData _packet;  // Received Data
    QUdpSocket *ReceiveSocket;
    QString Localaddress();

    int _start;
    int _end;
    int _now;
    int _next;
    bool _door;
    bool _direction;
    unsigned long long _pass;
signals:
    void dataChanged();
private slots:
    void ReadReceive();
public slots:
};

#endif // CONTROLLER_H
