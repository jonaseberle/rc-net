#include "Input.h"
#include "Settings.h"

#include <QDebug>

Input::Input(QString dev, QObject *parent) :
    QObject(parent)
{
    _dev = dev;
    open();
}

void Input::open()
{
    _proc = new QProcess(this);
    this->connect(_proc, SIGNAL(finished(int)), SLOT(contactLost(int)));
    this->connect(_proc, SIGNAL(readyReadStandardOutput()), SLOT(readStdOut()));

    QString command = Settings::get(jstest).toString().arg(_dev);
    qDebug() << "Input::open()" << command;
    _proc->start(command);
}

void Input::contactLost(int ret)
{
    qDebug() << "Input::contactLost(" << ret << ")";
    open();
}

void Input::readStdOut()
{
    bool _hasData = false;

    QString in = QString::fromAscii(_proc->readAllStandardOutput());
    QStringList lines = in.split("\r", QString::SkipEmptyParts);

    foreach(QString line, lines) {
        //qDebug() << "Input::readStdOut()" << line;

        int pos = 0;
        if ((pos = line.indexOf("Axes:")) != -1) {
            pos += QString("Axes:").length();

            axes.clear();

            QRegExp rx("[ ]*(\\d+):[ ]*([-]?\\d+)");
            while ((pos = rx.indexIn(line, pos)) != -1) {
                _hasData = true;

                bool ok;
                int axis = rx.cap(1).toInt(&ok);
                if (!ok)
                    continue;

                int val = rx.cap(2).toInt(&ok);
                if (!ok)
                    continue;

                axes[axis] = val;
                //qDebug() << "Axis" << axis << ":" << val;

                pos += rx.matchedLength();
            }
        }
        if ((pos = line.indexOf("Buttons:")) != -1) {
            pos += QString("Buttons:").length();

            btns.clear();

            QRegExp rx("[ ]*(\\d+):[ ]*(on|off)");
            while ((pos = rx.indexIn(line, pos)) != -1) {
                _hasData = true;

                bool ok;
                int btn = rx.cap(1).toInt(&ok);
                if (!ok)
                    continue;

                bool val = (rx.cap(2) == "on"? true: false);

                btns[btn] = val;
                //qDebug() << "Button" << btn << ":" << val;

                pos += rx.matchedLength();
            }
        }
    }

    if (_hasData)
        emit hasData();
}

