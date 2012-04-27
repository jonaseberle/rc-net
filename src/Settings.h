#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QHash>
#include <QStringList>
#include <QSettings>
#include <iostream>

// define settings keys
enum Setting {
    tcpPort, udpPort,
    broadcastPort, pingInterval,
    jstest, jscal, joystickPaths, joystickFileRegExp, activeJoysticks
};

class Settings : public QObject
{
    Q_OBJECT
    Q_ENUMS(IntSetting StrSetting StrListSetting)
public:
    static QVariant get(const Setting setting);
    static void set(Setting setting, QVariant val);

    void writeout();
    static Settings *getInstance(bool createIfNoInstance = true);
    static Settings *getInstance(QString fileName, bool createIfNoInstance = true);

private:
    explicit Settings(QString fileName, QObject *parent = 0) :
        QObject(parent)
    {
        _settings = new QSettings(fileName, QSettings::IniFormat);
        std::cout << "Using config file '" << fileName.toLocal8Bit().constData() << "'\n";

        // set default values for each setting
        add(tcpPort, "Net/tcpPort", 45456);
        add(tcpPort, "Net/udpPort", 45455);
        add(broadcastPort, "Net/udpBroadcastPort", 45454);
        add(pingInterval, "Net/pingIntervalMs", 10000);
        add(jstest, "Joysticks/continuousValuesOn1LineCmd",
            "/usr/bin/jstest --normal %1");
        add(jscal, "Joysticks/errorOnNonvalidJoystickCmd",
            "/usr/bin/jscal %1");
        add(joystickFileRegExp, "Joysticks/watchFileRegExp",
            "[^e][^v][^e][^n][^t]-joystick$");
        add(joystickPaths, "Joystick/watchDirs",
            QStringList() << "/dev/input/by-id/");
        add(activeJoysticks, "Joystick/activeJoysticks",
            QStringList());
    }

    void add(Setting s, QString iniKey, QVariant def);

    QHash<Setting, QString> _iniKeys;
    QHash<Setting, QVariant> _defaults;

    QSettings *_settings;
};


#endif // SETTINGS_H
