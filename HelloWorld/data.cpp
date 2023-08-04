#include <QtNetwork>

int main(int argc, char *argv[])
{
    QCoreApplication app(argc, argv);

    // 创建QUdpSocket对象
    QUdpSocket socket;

    // 绑定到组播地址和端口
    QHostAddress groupAddress("224.0.0.1");
    quint16 groupPort = 1234;
    socket.bind(QHostAddress::AnyIPv4, groupPort, QUdpSocket::ShareAddress);

    // 加入组播组
    socket.joinMulticastGroup(groupAddress);

    // 接收数据
    while (socket.state() == QUdpSocket::BoundState) {
        if (socket.hasPendingDatagrams()) {
            QByteArray datagram;
            datagram.resize(socket.pendingDatagramSize());
            QHostAddress sender;
            quint16 senderPort;

            socket.readDatagram(datagram.data(), datagram.size(), &sender, &senderPort);

            // 处理接收到的数据
            qDebug() << "Received datagram:" << datagram;
        }
    }

    return app.exec();
}