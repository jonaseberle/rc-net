#ifndef Input_H
#define Input_H

#include <QObject>
#include <QProcess>
#include <QHash>

class Input : public QObject
{
    Q_OBJECT
public:
    explicit Input(QString dev, QObject *parent = 0);
    QHash<quint8, int>  axes;
    QHash<quint8, bool> btns;
    void open();

signals:
    //void hasDeviceInformation(QString name, int numAxes, int numBtns);
    void hasData();

public slots:

private slots:
    void readStdOut();
    void contactLost(int);

private:
    QString _dev;
    QProcess *_proc;
    //QString _name;
    //int _numAxes, _numBtns;
};

#endif // Input_H
