#ifndef INPUTAXISWIDGET_H
#define INPUTAXISWIDGET_H

#include "ui_InputAxisWidget.h"

#include <QWidget>

namespace Ui {
class InputAxisWidget;
}

class InputAxisWidget : public QWidget
{
    Q_OBJECT

public:
    explicit InputAxisWidget(quint8 axis, QWidget *parent = 0) :
        QWidget(parent),
        ui(new Ui::InputAxisWidget)
    {
        ui->setupUi(this);
        ui->i->setText(QString("%1:").arg(axis));
    }

    ~InputAxisWidget()
    {
        delete ui;
    }

    void setValue(int val)
    {
        ui->pos->setValue(val);
    }
private:
    Ui::InputAxisWidget *ui;
};

#endif // INPUTAXISWIDGET_H
