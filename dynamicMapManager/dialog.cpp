#include "dialog.h"
#include "ui_dialog.h"
#include <QtXml>
#include <QDebug>

Dialog::Dialog(QWidget *parent) :
    QDialog(parent),
    ui(new Ui::Dialog)
{
    ui->setupUi(this);

    multicastSocket = new MulticastSocket;

    memset(&pisSendData, 0, sizeof(PISSendData));
    pisSendData.frameHeader  = 0x7E;
    pisSendData.packetLength = 0x15;
    pisSendData.frameTail    = 0x0D;
    pisSendData.dataSegment.flagTrigger = 0xFC;

    readStationInfo();
    for(int i=0; i<stationInfo.count(); i++)
    {
        ui->startStation->addItem(stationInfo.at(i).major);
        ui->terminateStation->addItem(stationInfo.at(i).major);
        ui->currentStation->addItem(stationInfo.at(i).major);
        ui->nextStation->addItem(stationInfo.at(i).major);
    }
    for(int i=1; i<256; i++)
        ui->comboBoxEA->addItem(QString::number(i));
    InitControls();
    showCommand();

    //comboBox
    connect(ui->startStation, SIGNAL(currentIndexChanged(int)), this, SLOT(slotCurrentIndexChanged(int)));
    connect(ui->terminateStation, SIGNAL(currentIndexChanged(int)), this, SLOT(slotCurrentIndexChanged(int)));
    connect(ui->currentStation, SIGNAL(currentIndexChanged(int)), this, SLOT(slotCurrentIndexChanged(int)));
    connect(ui->nextStation, SIGNAL(currentIndexChanged(int)), this, SLOT(slotCurrentIndexChanged(int)));
    connect(ui->comboBoxEA, SIGNAL(currentIndexChanged(int)), this, SLOT(slotCurrentIndexChanged(int)));

    //radioButton
    connect(ui->tc1Active, SIGNAL(toggled(bool)), this, SLOT(slotRadioToggled()));
    connect(ui->tc2Active, SIGNAL(toggled(bool)), this, SLOT(slotRadioToggled()));
    connect(ui->leaveTrigger, SIGNAL(toggled(bool)), this, SLOT(slotRadioToggled()));
    connect(ui->arriveTrigger, SIGNAL(toggled(bool)), this, SLOT(slotRadioToggled()));

    //checkBox
    connect(ui->leftDoorOpen, SIGNAL(toggled(bool)), this, SLOT(slotCheckBoxToggled(bool)));
    connect(ui->rightDoorOpen, SIGNAL(toggled(bool)), this, SLOT(slotCheckBoxToggled(bool)));

    //GroupBox
    connect(ui->groupBoxLuminance, SIGNAL(toggled(bool)), this, SLOT(slotGroupBoxToggled(bool)));
    connect(ui->groupBoxVolume, SIGNAL(toggled(bool)), this, SLOT(slotGroupBoxToggled(bool)));
    connect(ui->groupBoxSkip, SIGNAL(toggled(bool)), this, SLOT(slotGroupBoxToggled(bool)));

    //pushButton
    connect(ui->pushButtonAdd, SIGNAL(clicked()), this, SLOT(slotSkipSation()));
    connect(ui->pushButtonDel, SIGNAL(clicked()), this, SLOT(slotSkipSation()));
    connect(ui->pushButtonClr, SIGNAL(clicked()), this, SLOT(slotSkipSation()));

    // horizontalSlider
    connect(ui->horizontalSliderVolume, SIGNAL(valueChanged(int)), this, SLOT(slotHorizontalSlider(int)));
    connect(ui->horizontalSliderLuminance, SIGNAL(valueChanged(int)), this, SLOT(slotHorizontalSlider(int)));
}

Dialog::~Dialog()
{
    delete ui;
}

void Dialog::readStationInfo()
{
    QDomDocument doc;
    QFile file(":/xml/taiyuan_line1.xml");
    if(!file.open(QIODevice::ReadOnly)) return ;
    if(!doc.setContent(&file))
    {
        file.close();
        return ;
    }
    file.close();

    StationInfo tempStationinfo;
    QDomElement docElem = doc.documentElement();
    QDomNode n = docElem.firstChild();
    while(!n.isNull())
    {
        QDomElement e = n.toElement();
        if(!e.isNull())
        {
            tempStationinfo.id =  e.toElement().attribute("ID").toInt();
            tempStationinfo.major = e.toElement().attribute("major");
            stationInfo.push_back(tempStationinfo);
        }
        n = n.nextSibling();
    }
}

void Dialog::InitControls()
{
    ui->startStation->setCurrentIndex(-1);
    ui->terminateStation->setCurrentIndex(-1);
    ui->currentStation->setCurrentIndex(-1);
    ui->nextStation->setCurrentIndex(-1);

    ui->terminateStation->setEnabled(false);
    ui->currentStation->setEnabled(false);
    ui->nextStation->setEnabled(false);

    ui->radioButton->setVisible(false);
    ui->radioButton_2->setVisible(false);
    ui->radioButton->setChecked(true);
    ui->radioButton_2->setChecked(true);

    ui->rightDoorOpen->setChecked(false);
    ui->leftDoorOpen->setChecked(false);
    ui->tc1Active->setChecked(false);
    ui->tc2Active->setChecked(false);

    ui->groupBoxVolume->setChecked(false);
    ui->groupBoxLuminance->setChecked(false);
    ui->spinBoxVolume->setValue(0);
    ui->spinBoxLuminance->setValue(0);

    ui->comboBoxEA->setCurrentIndex(-1);
}

void Dialog::showCommand()
{
    ba.resize(sizeof(PISSendData));
    memcpy(ba.data(), &pisSendData, sizeof(PISSendData));

    QString sendData = ba.toHex();
    ui->lineEditCommand->setText(addSpaceInString(sendData));
}

inline QString Dialog::addSpaceInString(const QString& sourceString)
{
    QString destString;
    for(int i=0; i<sourceString.count(); i+=2)
        destString += sourceString.mid(i, 2) + " ";
    return destString.trimmed();
}

void Dialog::slotCurrentIndexChanged(int index)
{
    QComboBox *comboBox = dynamic_cast<QComboBox*>(sender());
    if(comboBox->objectName() == "startStation")
    {
        int indexTerminate = ui->terminateStation->currentIndex();
        if(indexTerminate == -1)
        {
            ui->terminateStation->setEnabled(true);
        }
        else
        {
            if(index == indexTerminate)
            {
                index = 27 - indexTerminate;
                ui->startStation->setCurrentIndex(27 - indexTerminate);
            }

            //确定交路
            if(index > indexTerminate) //下行
            {
                ui->listWidgetAll->clear();
                for(int i=index; i>= ui->terminateStation->currentIndex(); i--)
                {
                    ui->listWidgetAll->addItem(stationInfo.at(i).major);
                }

                pisSendData.dataSegment.flagSwitch |= 0x40;
                pisSendData.dataSegment.flagSwitch &= ~0x80;
            }
            else    //上行
            {
                ui->listWidgetAll->clear();
                for(int i=index; i<= ui->terminateStation->currentIndex(); i++)
                {
                    ui->listWidgetAll->addItem(stationInfo.at(i).major);
                }

                pisSendData.dataSegment.flagSwitch |= 0x80;
                pisSendData.dataSegment.flagSwitch &= ~0x40;
            }

            //ui->currentStation->setCurrentIndex(-1);
        }

        pisSendData.dataSegment.startingStation = index+1;
    }
    else if(comboBox->objectName() == "terminateStation")
    { 
        int indexSart = ui->startStation->currentIndex();
        if(index == indexSart)
        {
            ui->terminateStation->setCurrentIndex(27 - index);
        }

        //确定交路
        if(indexSart >index ) //下行
        {
            ui->listWidgetAll->clear();
            for(int i=indexSart; i>= ui->terminateStation->currentIndex(); i--)
            {
                ui->listWidgetAll->addItem(stationInfo.at(i).major);
            }

            pisSendData.dataSegment.flagSwitch |= 0x40;
            pisSendData.dataSegment.flagSwitch &= ~0x80;
        }
        else    //上行
        {
            ui->listWidgetAll->clear();
            for(int i=indexSart; i<= ui->terminateStation->currentIndex(); i++)
            {
                ui->listWidgetAll->addItem(stationInfo.at(i).major);
            }

            pisSendData.dataSegment.flagSwitch |= 0x80;
            pisSendData.dataSegment.flagSwitch &= ~0x40;
        }

        ui->currentStation->setEnabled(true);
        ui->currentStation->setCurrentIndex(-1);
        pisSendData.dataSegment.terminalStation = index+1;
    }
    else if(comboBox->objectName() == "currentStation")
    {
        if(index != -1)
        {
            ui->nextStation->setCurrentIndex(-1);
            int startIndex = ui->startStation->currentIndex();
            int terminateIndex =  ui->terminateStation->currentIndex();

            if(index != terminateIndex)
            {
                if(startIndex > terminateIndex) //下行
                {
                    if(index >= terminateIndex && index <= startIndex)
                    {
                        ui->nextStation->setCurrentIndex(index-1);
                    }
                    else
                    {
                        index = -1;
                        ui->currentStation->setCurrentIndex(index);
                    }
                }
                else //上行
                {
                    if(index >= startIndex && index <= terminateIndex)
                    {
                        ui->nextStation->setCurrentIndex(index+1);
                    }
                    else
                    {
                        index = -1;
                        ui->currentStation->setCurrentIndex(index);
                    }
                }
            }
            else
            {
                ui->nextStation->setCurrentIndex(-1);
            }
        }

        pisSendData.dataSegment.currentStation = index+1;
    }
    else if(comboBox->objectName() == "nextStation")
    {
        pisSendData.dataSegment.nextStation = index+1;
    }
    else if(comboBox->objectName() == "comboBoxEA")
    {
        pisSendData.dataSegment.emergencyAnnouncing = index + 1;
    }

    showCommand();
}

void Dialog::slotRadioToggled()
{
    QRadioButton *radioBtn = dynamic_cast<QRadioButton*>(sender());

    if(radioBtn->objectName() == "tc1Active")      //激活TC1
    {
        pisSendData.dataSegment.activeTC &= ~0x40;
        pisSendData.dataSegment.activeTC |= 0x80;
    }
    else if(radioBtn->objectName() == "tc2Active") //激活TC2
    {
        pisSendData.dataSegment.activeTC &= ~0x80;
        pisSendData.dataSegment.activeTC |= 0x40;
    }
    else if(radioBtn->objectName() == "arriveTrigger")  //到站触发
    {
        pisSendData.dataSegment.flagTrigger |= 0x02;
        pisSendData.dataSegment.flagTrigger &= ~0x01;
    }
    else if(radioBtn->objectName() == "leaveTrigger")   //离站触发
    {
        pisSendData.dataSegment.flagTrigger |= 0x01;
        pisSendData.dataSegment.flagTrigger &= ~0x02;
    }

    showCommand();
}

void Dialog::slotCheckBoxToggled(bool b)
{
    int tempFlag = 0;
    QCheckBox *checkBoxBtn = dynamic_cast<QCheckBox*>(sender());
    if(checkBoxBtn->objectName() == "leftDoorOpen")   //开左侧门
    {
        tempFlag = 0x20;
    }
    else if(checkBoxBtn->objectName() == "rightDoorOpen") //开右侧门
    {
        tempFlag = 0x10;
    }

    if(b)
        pisSendData.dataSegment.flagSwitch |= tempFlag;
    else
        pisSendData.dataSegment.flagSwitch &= ~tempFlag;

    showCommand();
}

void Dialog::slotGroupBoxToggled(bool on)
{
    QGroupBox *ckBox = dynamic_cast<QGroupBox*>(sender());

    if(ckBox->objectName() == "groupBoxVolume")
    {
        if(on)
        {
            //ui->lineEditVolume->setEnabled(true);
            pisSendData.dataSegment.flagControl |= 0x10;
        }
        else
        {
            //ui->lineEditVolume->setEnabled(false);
            pisSendData.dataSegment.flagControl &= ~0x10;
        }
    }
    else if(ckBox->objectName() == "groupBoxLuminance")
    {
        if(on)
        {
            //ui->lineEditLuminance->setEnabled(true);
            pisSendData.dataSegment.flagControl |= 0x04;
        }
        else
        {
            //ui->lineEditLuminance->setEnabled(false);
            pisSendData.dataSegment.flagControl &= ~0x04;
        }
    }
    else if(ckBox->objectName() == "groupBoxSkip") //跳站有效
    {
        if(on)
        {
            pisSendData.dataSegment.flagSwitch |= 0x01;
            ui->pushButtonAdd->setEnabled(true);
            ui->pushButtonDel->setEnabled(true);
            ui->pushButtonClr->setEnabled(true);
        }
        else
        {
            pisSendData.dataSegment.flagSwitch &= ~0x01;
            ui->pushButtonAdd->setEnabled(false);
            ui->pushButtonDel->setEnabled(false);
            ui->pushButtonClr->setEnabled(false);
        }
    }

   showCommand();
}

void Dialog::slotSkipSation()
{
    int indexSel = ui->listWidgetAll->currentRow();
    if(indexSel == -1) return ;

    QPushButton *btn = dynamic_cast<QPushButton*>(sender());
    if(btn->objectName() == "pushButtonAdd")
    {
        QString selSta = ui->listWidgetAll->item(indexSel)->text();
        //遍历Skip查看该车站是否已设置了跳站
        for(int i=0; i<ui->listWidgetSkip->count(); i++)
        {
            if(ui->listWidgetSkip->item(i)->text() == selSta)
                return ;
        }
        ui->listWidgetSkip->addItem(selSta);

        for(int i=0; i<stationInfo.count(); i++)
        {
            if(selSta == stationInfo.at(i).major)
            {
                pisSendData.dataSegment.flagPassStation[i/8] |= (qint8)pow(2, i - i/8*8);
                break;
            }
        }
    }
    else if(btn->objectName() == "pushButtonDel")
    {
        if(ui->listWidgetSkip->currentRow() == -1) return ;
        QString selSta = ui->listWidgetSkip->item(ui->listWidgetSkip->currentRow())->text();
        qDebug() << "out for Loop" << selSta;
        for(int i=0; i<stationInfo.count(); i++)
        {
            if(selSta == stationInfo.at(i).major)
            {
                qDebug() << "in for Loop" << selSta;
                pisSendData.dataSegment.flagPassStation[i/8] &= ~(qint8)pow(2, i - i/8*8);
                break;
            }
        }
        ui->listWidgetSkip->takeItem(ui->listWidgetSkip->currentRow());
    }
    else if(btn->objectName() == "pushButtonClr")
    {
        ui->listWidgetSkip->clear();
        memset(pisSendData.dataSegment.flagPassStation, 0 , sizeof(pisSendData.dataSegment.flagPassStation));
    }

    showCommand();
}

void Dialog::slotHorizontalSlider(int value)
{
    QSlider *slider = dynamic_cast<QSlider*>(sender());
    if(slider->objectName() == "horizontalSliderVolume")
    {
        pisSendData.dataSegment.dynamicMapVolume = value;
    }
    else if(slider->objectName() == "horizontalSliderLuminance")
    {
        pisSendData.dataSegment.dynamicMapLuminance = value;
    }

    showCommand();
    on_OK_clicked();
}

void Dialog::on_canclePushButton_clicked()
{
    InitControls();
    showCommand();
}

void Dialog::on_OK_clicked()
{
//    QString sendData = ui->lineEditCommand->text();
//    sendData.remove(QRegExp("\\s"));

    multicastSocket->sendTo(ba);
}
