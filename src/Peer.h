#ifndef PEER_H
#define PEER_H

#include <QTcpSocket>

class Peer : public QTcpSocket
{
    Q_OBJECT
public:
    explicit Peer(QObject *parent = 0);

signals:

public slots:

};

#endif // PEER_H
