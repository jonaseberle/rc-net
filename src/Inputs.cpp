#include "Inputs.h"
#include "Settings.h"

#include <QDebug>
#include <QFileInfo>
#include <QDir>

// singleton instance
Inputs *jsInstance = 0;
Inputs* Inputs::getInstance(bool createIfNoInstance)
{
    if (jsInstance == 0)
        if (createIfNoInstance)
            jsInstance = new Inputs;
    return jsInstance;
}

Inputs::Inputs(QObject *parent) :
    QObject(parent)
{
    discoverJoysticks();
    foreach (QString filePath, Settings::get(joystickPaths).toStringList()) {
        qDebug() << "watching" << filePath;

        QFileInfo fileInfo(filePath);
        _fileSystemWatcher = new QFileSystemWatcher(
                    Settings::get(joystickPaths).toStringList(),
                    this);
        this->connect(_fileSystemWatcher, SIGNAL(directoryChanged(QString)),
                      SLOT(directoryChanged(QString)));
    }
}

bool Inputs::isJoystick(const QString &f)
{
    QProcess *proc = new QProcess;
    proc->start(Settings::get(jscal).toString().arg(f));
    qDebug() << "executing" << Settings::get(jscal).toString().arg(f);
    if (!proc->waitForFinished(3000))
        return false;
    return (proc->exitCode() == 0);
}

void Inputs::open(QString dev)
{
    if (!activeInputs.keys().contains(dev)) {
        activeInputs[dev] = new Input(dev, this);
        this->connect(activeInputs[dev], SIGNAL(destroyed()), SLOT(inputDestroyed()));
    } else
        activeInputs[dev]->open();
}

void Inputs::discoverJoysticks()
{
    joystickFilePaths.clear();
    foreach (const QString path, Settings::get(joystickPaths).toStringList()) {
        QDir dir = QDir(path, "", QDir::Name | QDir::IgnoreCase,
                        QDir::System);
        foreach (const QFileInfo fi, dir.entryInfoList()) {
            if (QRegExp(Settings::get(joystickFileRegExp).toString())
                    .indexIn(fi.fileName()) != -1) {
                if (isJoystick(fi.filePath())) {
                    joystickFilePaths << fi.filePath();
                    qDebug() << "discovered " << fi.filePath();
                }
            }
        }
    }
}

void Inputs::inputDestroyed()
{
    qDebug() << "Inputs::inputDestroyed()" << QObject::sender();
}

void Inputs::directoryChanged(const QString &path)
{
    qDebug() << "Inputs::directoryChanged()" << path;
    discoverJoysticks();
}
