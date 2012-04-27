#ifndef InputDIALOG_H
#define InputDIALOG_H

#include "InputAxisWidget.h"
#include "InputBtnWidget.h"

#include <QMainWindow>

#include <QHash>

namespace Ui {
class InputDialog;
}

class InputDialog : public QMainWindow
{
    Q_OBJECT

public:
    explicit InputDialog(QString dev, QWidget *parent = 0);
    QString dev;
    ~InputDialog();
public slots:
    void updateValues();
    void createAxesUi();
    void createBtnsUi();

private:
    Ui::InputDialog *ui;
    QHash<quint8, InputAxisWidget *> _axesUis;
    QHash<quint8, InputBtnWidget *> _btnsUis;
};

#endif // InputDIALOG_H
