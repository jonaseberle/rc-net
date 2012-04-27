#include "InputDialog.h"
#include "ui_InputDialog.h"

#include "Inputs.h"

#include <QLabel>
#include <QDebug>

InputDialog::InputDialog(QString dev, QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::InputDialog)
{
    ui->setupUi(this);
    setWindowTitle(dev);
    this->dev = dev;
}

InputDialog::~InputDialog()
{
    delete ui;
}

void InputDialog::updateValues()
{
    QHash<quint8, int>  axes = Inputs::getInstance()->activeInputs[dev]->axes;
    QHash<quint8, bool> btns = Inputs::getInstance()->activeInputs[dev]->btns;

    if (ui->g_axes->layout()->count() != axes.size())
        createAxesUi();
    if (ui->g_btns->layout()->count() != btns.size())
        createBtnsUi();

    foreach(quint8 axis, axes.keys()) {
        Q_ASSERT (_axesUis.contains(axis));
        _axesUis[axis]->setValue(axes[axis]);
    }
    foreach(quint8 btn, btns.keys()) {
        Q_ASSERT (_btnsUis.contains(btn));
        _btnsUis[btn]->setValue(btns[btn]);
    }
}

void InputDialog::createAxesUi()
{
    qDebug() << "InputDialog::createAxisUi()";
    foreach(quint8 axis, _axesUis.keys()) {
        delete _axesUis[axis];
        _axesUis.remove(axis);
    }

    QHash<quint8, int> axes = Inputs::getInstance()->activeInputs[dev]->axes;

    foreach(quint8 axis, axes.keys()) {
        _axesUis[axis] = new InputAxisWidget(axis, ui->g_axes);
        ui->g_axes->layout()->addWidget(_axesUis[axis]);
    }
    ui->g_axes->layout()->update();
}

void InputDialog::createBtnsUi()
{
    qDebug() << "InputDialog::createBtnsUi()";
    foreach(quint8 btn, _btnsUis.keys()) {
        delete _btnsUis[btn];
        _btnsUis.remove(btn);
    }

    QHash<quint8, bool> btns = Inputs::getInstance()->activeInputs[dev]->btns;

    foreach(quint8 btn, btns.keys()) {
        _btnsUis[btn] = new InputBtnWidget(btn, ui->g_btns);
        ui->g_btns->layout()->addWidget(_btnsUis[btn]);
    }
    ui->g_btns->layout()->update();
}
