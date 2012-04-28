#include "Settings.h"
#include <QMetaEnum>
#include <QDebug>
#include <QApplication>

// singleton instance
Settings *settingsInstance = 0;
Settings *Settings::getInstance(bool createIfNoInstance)
{
    return getInstance("rc-net.conf", createIfNoInstance);
}
Settings *Settings::getInstance(QString fileName, bool createIfNoInstance)
{
    if (settingsInstance == 0)
        if (createIfNoInstance)
            settingsInstance = new Settings(fileName);
    return settingsInstance;
}

void Settings::add(Setting s, QString iniKey, QVariant def)
{
    _iniKeys[s] = iniKey;
    _defaults[s] = def;
}

QVariant Settings::get(Setting setting)
{
    Settings *me = Settings::getInstance();
    return me->_settings->value(me->_iniKeys[setting], me->_defaults[setting]);
}

void Settings::set(Setting setting, QVariant val)
{
    Settings *me = Settings::getInstance();
    me->_settings->setValue(
                me->_iniKeys[setting], val);
}

void Settings::writeout()
{
    foreach (Setting s, _iniKeys.keys()) {
        _settings->setValue(_iniKeys[s], get(s));
    }
}

