#ifndef LIGHTCONTROL_H
#define LIGHTCONTROL_H

#include <QObject>
#include "gpiohalrpi5.hpp"
#include <iostream>

constexpr int LOW_BEAM_PIN = 17;
constexpr int HIGH_BEAM_PIN = 21;
constexpr int FOG_BEAM_PIN = 26;

class LightControl : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool lowBeam READ lowBeam WRITE setLowBeam NOTIFY lowBeamChanged FINAL)
    Q_PROPERTY(bool highBeam READ highBeam WRITE setHighBeam NOTIFY highBeamChanged FINAL)
    Q_PROPERTY(bool fogBeam READ fogBeam WRITE setFogBeam NOTIFY fogBeamChanged FINAL)
public:
    explicit LightControl(QObject *parent = nullptr);
    ~LightControl();

    Q_INVOKABLE bool lowBeam() const;
    Q_INVOKABLE void setLowBeam(bool newLowBeam);

    Q_INVOKABLE bool highBeam() const;
    Q_INVOKABLE void setHighBeam(bool newHighBeam);

    Q_INVOKABLE bool fogBeam() const;
    Q_INVOKABLE void setFogBeam(bool newFogBeam);

signals:
    void lowBeamChanged();
    void highBeamChanged();
    void fogBeamChanged();

private:
    bool m_lowBeam;
    bool m_highBeam;
    bool m_fogBeam;

    const std::string chipName = "gpiochip0";

    // gpiod::chip chip;

    // gpiod::line lowBeamGpioLine;
    // gpiod::line highBeamGpioLine;
    // gpiod::line fogBeamGpioLine;
    GpioHal gpio = GpioHal();

    const int lowBeamGpioPin = LOW_BEAM_PIN;
    const int highBeamGpioPin = HIGH_BEAM_PIN;
    const int fogBeamGpioPin = FOG_BEAM_PIN;

    // void gpioPinWrite(const int &gpioPin, const int &value);
};

#endif // LIGHTCONTROL_H
