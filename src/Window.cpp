#include "Window.h"
#include "ui_Window.h"

#include "Net.h"
#include "Inputs.h"
#include "InputDialog.h"

#include <QDebug>

Window::Window(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::Window)
{
    ui->setupUi(this);
    ui->joyDev->addItems(Inputs::getInstance()->joystickFilePaths);
}

Window::~Window()
{
    delete ui;
}

void Window::newPeer(QString str)
{
    ui->peers->addTopLevelItem(new QTreeWidgetItem(QStringList(str)));
}

void Window::delPeer(QString str)
{
    for (int i = 0; i < ui->peers->topLevelItemCount(); i++) {
        if (ui->peers->topLevelItem(i)->data(0, Qt::DisplayRole) == str) {
            ui->peers->takeTopLevelItem(i);
            break;
        }
    }
}

void Window::newPing(QString peer, int ms)
{
    for (int i = 0; i < ui->peers->topLevelItemCount(); i++) {
        if (ui->peers->topLevelItem(i)->data(0, Qt::DisplayRole) == peer) {
            ui->peers->topLevelItem(i)->setData(1, Qt::DisplayRole, ms);
            break;
        }
    }
}

void Window::on_listen_clicked()
{
}

void Window::on_ping_clicked()
{
    QList<QTreeWidgetItem *> items = ui->peers->selectedItems();
    foreach (QTreeWidgetItem *item, items) {
        Net::getInstance()->ping(item->data(0, Qt::DisplayRole).toString());
    }
}

void Window::on_joyConnect_clicked()
{
    QString dev = ui->joyDev->currentText();
    if (!Inputs::getInstance()->activeInputs.contains(dev))
        Inputs::getInstance()->open(dev);
    InputDialog *dialog = new InputDialog(dev, this);
    dialog->connect(Inputs::getInstance()->activeInputs[dev], SIGNAL(hasData()), SLOT(updateValues()));
    dialog->show();
}
