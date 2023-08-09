#ifndef DIALOG_H
#define DIALOG_H

#include "communicationData.h"
#include "multicastsocket.h"
#include <QDialog>
#include <QVector>

namespace Ui {
class Dialog;
}

class Dialog : public QDialog
{
    Q_OBJECT

public:
    explicit Dialog(QWidget *parent = 0);
    ~Dialog();

    static QString addSpaceInString(const QString& sourceString);

private:
    void readStationInfo();
    void InitControls();
    void showCommand();

private slots:
    void on_OK_clicked();
    void on_canclePushButton_clicked();
    void slotCurrentIndexChanged(int);
    void slotRadioToggled();
    void slotCheckBoxToggled(bool);
    void slotGroupBoxToggled(bool);
    void slotSkipSation();
    void slotHorizontalSlider(int);

private:
    Ui::Dialog *ui;

    QVector<StationInfo> stationInfo;
    QByteArray  ba;
    PISSendData pisSendData;    //客视屏接收的帧
    MulticastSocket *multicastSocket;
};

#endif // DIALOG_H
