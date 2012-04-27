#ifndef NET_H
#define NET_H

#include "Peer.h"

#include <QObject>
#include <QtNetwork>

class Net : public QObject
{
    Q_OBJECT
public:
    static Net* getInstance(bool createIfNoInstance = true);
    void setProvides(QStringList &provides);
    void updateAddresses();
    bool isLocalHostAddress(const QHostAddress &address);
    void sendDatagram(QByteArray &datagram);
    void hello();
    void whoThere();
    void pong(QString id, QString epoch);
signals:
    void newPeer(QString);
    void delPeer(QString);
    void pongReceived(QString, int);

public slots:
    void keepAlive();
    void ping(QString id);
    void ping();
    void bye();
private slots:
    void readDatagram();
private:
    explicit Net(QObject *parent = 0);
    QString id;
    int port;
    QUdpSocket socket;
    QTimer timer;
    QList<QHostAddress> broadcastAddresses;
    QList<QHostAddress> ipAddresses;
    QStringList peerIds;
    QStringList provides;
    QList<Peer *> peers;
};

#endif // NET_H
