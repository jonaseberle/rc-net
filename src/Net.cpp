#include "Net.h"
#include "Settings.h"

// singleton instance
Net *netInstance = 0;
Net* Net::getInstance(bool createIfNoInstance)
{
    if (netInstance == 0)
        if (createIfNoInstance)
            netInstance = new Net;
    return netInstance;
}

Net::Net(QObject *parent) :
    QObject(parent)
{
    this->port = Settings::get(broadcastPort).toInt();
    this->provides = provides;

    this->id = QHostInfo::localHostName().append(QString::number(QCoreApplication::applicationPid()));

    updateAddresses();

    if (!socket.bind(QHostAddress::Any, this->port,
                     QUdpSocket::ShareAddress | QUdpSocket::ReuseAddressHint)) {
        qFatal("Could not bind to port %s!", qPrintable(QString::number(this->port)));
    }
    connect(&socket, SIGNAL(readyRead()),
            this, SLOT(readDatagram()));

    whoThere();

    timer.setInterval(Settings::get(pingInterval).toInt());
    connect(&timer, SIGNAL(timeout()),
            this, SLOT(ping()));
//            this, SLOT(keepAlive()));
    timer.start();
}

void Net::setProvides(QStringList &provides)
{
    this->provides = provides;
    hello();
}

void Net::ping()
{
    QByteArray datagram;
    datagram.append("PING|");
    datagram.append(QByteArray::number(QDateTime::currentMSecsSinceEpoch()));
    sendDatagram(datagram);
}

void Net::ping(QString id)
{
    QByteArray datagram;
    datagram.append("PING");
    datagram.append("@" + id + "|");
    datagram.append(QByteArray::number(QDateTime::currentMSecsSinceEpoch()));
    sendDatagram(datagram);
}

void Net::pong(QString id, QString epoch)
{
    QByteArray datagram;
    datagram.append("PONG");
    datagram.append("@" + id + "|");
    datagram.append(epoch);
    sendDatagram(datagram);
}

void Net::hello()
{
    QByteArray datagram;
    datagram.append("HOLA|");
    datagram.append(this->provides.join(","));
    sendDatagram(datagram);
}

void Net::bye()
{
    QByteArray datagram;
    datagram.append("BYE");
    sendDatagram(datagram);
}

void Net::keepAlive()
{
    QByteArray datagram;
    sendDatagram(datagram);
}


void Net::whoThere()
{
    QByteArray datagram = QByteArray("WHOTHERE");
    sendDatagram(datagram);
}

void Net::sendDatagram(QByteArray &datagram)
{
    QByteArray id;
    id.append(this->id + "|");
    datagram.prepend(id);

    bool validBroadcastAddresses = true;
    foreach (QHostAddress address, broadcastAddresses) {
        if (socket.writeDatagram(
                    datagram, address, this->port) == -1)
            validBroadcastAddresses = false;
        qDebug() << "> UDP" << address.toString() << datagram;
    }

    if (!validBroadcastAddresses)
        updateAddresses();
}

void Net::readDatagram()
{
    while (socket.hasPendingDatagrams()) {
        QHostAddress senderIp;
        quint16 senderPort;
        QByteArray datagram;
        datagram.resize(socket.pendingDatagramSize());

        if (socket.readDatagram(datagram.data(), datagram.size(),
                                &senderIp, &senderPort) == -1)
            continue;

        QList<QByteArray> list = datagram.split('|');
        if (list.size() < 1)
            continue;

        QString senderId = list.at(0);

        if (senderId == this->id)
            continue;

        if (!peerIds.contains(senderId)) {
            peerIds.append(senderId);
            emit newPeer(senderId);
        }

        if (list.size() < 2)
            continue;

        QString msg = list.at(1);
        QStringList msgRecipient = msg.split("@");
        // adressate provided
        if (msgRecipient.size() > 1) {
            if (msgRecipient.at(1) != this->id)
                continue;
            msg = msgRecipient.at(0);
        }

        QString param = (list.size() > 2? list.at(2): "");

        if (msg == "WHOTHERE")
            hello();
        if (msg == "PING")
            pong(senderId, param);
        if (msg == "PONG")
            emit pongReceived(senderId, QDateTime::currentMSecsSinceEpoch() - param.toLongLong());
        if (msg == "BYE") {
            peerIds.removeAll(senderId);
            emit delPeer(senderId);
        }

        qDebug() << "< UDP" << senderIp.toString() << senderId << msgRecipient << param;
    }
}

void Net::updateAddresses()
{
    broadcastAddresses.clear();
    ipAddresses.clear();
    foreach (QNetworkInterface interface, QNetworkInterface::allInterfaces()) {
        foreach (QNetworkAddressEntry entry, interface.addressEntries()) {
            QHostAddress broadcastAddress = entry.broadcast();
            if (broadcastAddress != QHostAddress::Null && entry.ip() != QHostAddress::LocalHost) {
                qDebug() << "Network connection:"
                         << "IP:" << entry.ip().toString()
                         << "broadcast:" << broadcastAddress.toString();
                broadcastAddresses << broadcastAddress;
                ipAddresses << entry.ip();
            }
        }
    }
}

bool Net::isLocalHostAddress(const QHostAddress &address)
{
    foreach (QHostAddress localAddress, ipAddresses) {
        if (address == localAddress)
            return true;
    }
    return false;
}

