#ifndef WINDOW_H
#define WINDOW_H

#include <QMainWindow>

namespace Ui {
    class Window;
}

class Window : public QMainWindow
{
    Q_OBJECT

public:
    explicit Window(QWidget *parent = 0);
    ~Window();
public slots:
    void newPeer(QString str);
    void delPeer(QString str);
    void newPing(QString peer, int ms);

private slots:
    void on_listen_clicked();
    void on_ping_clicked();
    void on_joyConnect_clicked();

private:
    Ui::Window *ui;
};

#endif // WINDOW_H
