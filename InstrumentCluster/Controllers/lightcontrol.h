#ifndef LIGHTCONTROL_H
#define LIGHTCONTROL_H

#include <QObject>
#include <gpiod.hpp>

class LightControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool lowBeam READ lowBeam WRITE setLowBeam NOTIFY lowBeamChanged FINAL)
    Q_PROPERTY(bool highBeam READ highBeam WRITE setHighBeam NOTIFY highBeamChanged FINAL)
    Q_PROPERTY(bool fogBeam READ fogBeam WRITE setFogBeam NOTIFY fogBeamChanged FINAL)
public:
    explicit LightControl(QObject *parent = nullptr);

    bool lowBeam() const;
    void setLowBeam(bool newLowBeam);

    bool highBeam() const;
    void setHighBeam(bool newHighBeam);

    bool fogBeam() const;
    void setFogBeam(bool newFogBeam);

signals:
    void lowBeamChanged();
    void highBeamChanged();
    void fogBeamChanged();

private:
    bool m_lowBeam;
    bool m_highBeam;
    bool m_fogBeam;

    const std::string chipName = "gpiochip0";

    const int lowBeamGpioPin = 17;
    const int highBeamGpioPin = 21;
    const int fogBeamGpioPin = 26;
};

#endif // LIGHTCONTROL_H
