#ifndef InputS_H
#define InputS_H

#include "Input.h"

#include <QObject>
#include <QFileSystemWatcher>

class Inputs : public QObject
{
    Q_OBJECT
public:
    static Inputs* getInstance(bool createIfNoInstance = true);
    void open(QString dev);
    QHash<QString, Input *> activeInputs;
    QStringList joystickFilePaths;
    void discoverJoysticks();
signals:
    void hasData(QString dev);

public slots:
    void inputDestroyed();

private slots:
    void directoryChanged(const QString &path);

private:
    explicit Inputs(QObject *parent = 0);

    bool isJoystick(const QString &f);
    QFileSystemWatcher *_fileSystemWatcher;
};

#endif // InputS_H
