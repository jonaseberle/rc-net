#include <QtGui/QApplication>
#include <QDebug>
#include <iostream>

#include "Window.h"
#include "Net.h"
#include "Inputs.h"
#include "Settings.h"

int main(int argc, char *argv[]) {
    bool headless = false;
    for (int i = 0; i < argc; i++) {
        if (QString::fromLocal8Bit(argv[i]) == "headless") {
            headless = true;
            std::cout << "Headless (no GUI)\n";
        }
    }

    QApplication *app;
    QCoreApplication *coreApp;
    if (headless)
        coreApp = new QCoreApplication(argc, argv);
    else
        app = new QApplication(argc, argv);

    if (QCoreApplication::arguments().contains("--help")) {
        std::cout << "\tmakeconf       writes a clean config file\n"
                     "\tconf=FILENAME  use this config file\n"
                     "\theadless       no GUI\n"
                ;
        return 0;
    }
    QRegExp rx("conf=(.*)");
    if (QCoreApplication::arguments().indexOf(rx) != -1)
        Settings::getInstance(rx.cap(1));
    if (QCoreApplication::arguments().contains("makeconf"))
        Settings::getInstance()->writeout();

    Net *net = Net::getInstance();
    QStringList provides = QStringList("tx");
    net->setProvides(provides);

    if (headless) {
        net->connect(coreApp, SIGNAL(aboutToQuit()), SLOT(bye()));
        return coreApp->exec();
    } else {
        Window *w = new Window();
        w->connect(net, SIGNAL(newPeer(QString)), SLOT(newPeer(QString)));
        w->connect(net, SIGNAL(delPeer(QString)), SLOT(delPeer(QString)));
        w->connect(net, SIGNAL(pongReceived(QString,int)), SLOT(newPing(QString,int)));

        w->show();

        net->connect(app, SIGNAL(aboutToQuit()), SLOT(bye()));
        return app->exec();
    }
}
