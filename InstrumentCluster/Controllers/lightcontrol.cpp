#include "lightcontrol.h"

LightControl::LightControl(QObject *parent)
    : QObject{parent}
    , m_lowBeam(false)
    , m_highBeam(false)
    , m_fogBeam(false)
{
    // chip = chip(chipName);

    // lowBeamGpioLine = chip.get_line(lowBeamGpioPin);
    // lowBeamGpioLine.request({
    //     "lowBeamGpioLine",
    //     gpiod::line_request::DIRECTION_OUTPUT,
    //     0
    // });

    // highBeamGpioLine = chip.get_line(highBeamGpioPin);
    // highBeamGpioLine.request({
    //     "highBeamGpioLine",
    //     gpiod::line_request::DIRECTION_OUTPUT,
    //     0
    // });

    // fogBeamGpioLine = chip.get_line(fogBeamGpioPin);
    // fogBeamGpioLine.request({
    //     "fogBeamGpioLine",
    //     gpiod::line_request::DIRECTION_OUTPUT,
    //     0
    // });
}

bool LightControl::lowBeam() const
{
    return m_lowBeam;
}

void LightControl::setLowBeam(bool newLowBeam)
{
    if (m_lowBeam == newLowBeam)
        return;
    m_lowBeam = newLowBeam;
    emit lowBeamChanged();

    // added by me
    // gpioPinWrite(lowBeamGpioPin, m_lowBeam? 1 : 0);
}

bool LightControl::highBeam() const
{
    return m_highBeam;
}

void LightControl::setHighBeam(bool newHighBeam)
{
    if (m_highBeam == newHighBeam)
        return;
    m_highBeam = newHighBeam;
    emit highBeamChanged();

    // added by me
    // gpioPinWrite(highBeamGpioPin, m_highBeam? 1 : 0);
}

bool LightControl::fogBeam() const
{
    return m_fogBeam;
}

void LightControl::setFogBeam(bool newFogBeam)
{
    if (m_fogBeam == newFogBeam)
        return;
    m_fogBeam = newFogBeam;
    emit fogBeamChanged();

    // added by me
    // gpioPinWrite(fogBeamGpioPin, m_fogBeam? 1 : 0);
}

void LightControl::gpioPinWrite(const int &gpioPin, const int &value)
{
    switch (gpioPin)
    {
        case LOW_BEAM_PIN:
            // lowBeamGpioLine.set_value(value);
        break;

        case HIGH_BEAM_PIN:
            // highBeamGpioLine.set_value(value);
        break;

        case FOG_BEAM_PIN:
            // fogBeamGpioLine.set_value(value);
        break;
    }
}

LightControl::~LightControl()
{
    // if (lowBeamGpioLine.is_requested()) {
    //     lowBeamGpioLine.set_value(0);
    //     lowBeamGpioLine.release();
    // }

    // if (highBeamGpioLine.is_requested()) {
    //     highBeamGpioLine.set_value(0);
    //     highBeamGpioLine.release();
    // }

    // if (fogBeamGpioLine.is_requested()) {
    //     fogBeamGpioLine.set_value(0);
    //     fogBeamGpioLine.release();
    // }
}
