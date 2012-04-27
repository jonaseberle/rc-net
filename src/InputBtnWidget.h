#ifndef INPUTBTNWIDGET_H
#define INPUTBTNWIDGET_H

#include "ui_InputBtnWidget.h"

#include <QWidget>

namespace Ui {
class InputBtnWidget;
}

class InputBtnWidget : public QWidget
{
    Q_OBJECT

public:
    explicit InputBtnWidget(quint8 btn, QWidget *parent) :
        QWidget(parent),
        ui(new Ui::InputBtnWidget)
    {
        ui->setupUi(this);
        ui->i->setText(QString("%1").arg(btn));
    }

    ~InputBtnWidget()
    {
        delete ui;
    }

    void setValue(bool val)
    {
        ui->i->setBackgroundRole(val? QPalette::Highlight: QPalette::Window);
    }

private:
    Ui::InputBtnWidget *ui;
};

#endif // INPUTBTNWIDGET_H
