#include "indicators.h"

Indicators::Indicators(QObject *parent)
    : QObject{parent}
    , m_rightBlinker(false)
    , m_leftBlinker(false)
{
    std::cout << "is the constructor getting called?" << std::endl;
    // chip = chip(chipName);

    // rightBlinkerGpioLine = chip.get_line(rightBlinkerGpioPin);
    // rightBlinkerGpioLine.request({
    //     "rightBlinkerGpioLine",
    //     gpiod::line_request::DIRECTION_OUTPUT,
    //     0
    // });

    // leftBlinkerGpioLine = chip.get_line(leftBlinkerGpioPin);
    // leftBlinkerGpioLine.request({
    //     "leftBlinkerGpioLine",
    //     gpiod::line_request::DIRECTION_OUTPUT,
    //     0
    // });
}

bool Indicators::rightBlinker() const
{
    return m_rightBlinker;
}

void Indicators::setRightBlinker(bool newRightBlinker)
{
    if (m_rightBlinker == newRightBlinker)
        return;
    m_rightBlinker = newRightBlinker;
    emit rightBlinkerChanged();

    // for debugging
    std::cout << "m_rightBlinker = " <<  m_rightBlinker << std::endl;

    // added by me
    // gpioPinWrite(rightBlinkerGpioPin, m_rightBlinker? 1 : 0);
}

bool Indicators::leftBlinker() const
{
    return m_leftBlinker;
}

void Indicators::setLeftBlinker(bool newLeftBlinker)
{
    if (m_leftBlinker == newLeftBlinker)
        return;
    m_leftBlinker = newLeftBlinker;
    emit leftBlinkerChanged();

    // for debugging
    std::cout << "m_leftBlinker = " <<  m_leftBlinker << std::endl;

    // added by me
    // gpioPinWrite(leftBlinkerGpioPin, m_leftBlinker? 1 : 0);
}

void Indicators::gpioPinWrite(const int &gpioPin, const int &value)
{
    switch (gpioPin)
    {
    case RIGHT_BLINKER_PIN:
        // rightBlinkerGpioLine.set_value(value);
        break;

    case LEFT_BLINKER_PIN:
        // leftBlinkerGpioLine.set_value(value);
        break;
    }
}

Indicators::~Indicators()
{
    // if (rightBlinkerGpioLine.is_requested()) {
    //     rightBlinkerGpioLine.set_value(0);
    //     rightBlinkerGpioLine.release();
    // }

    // if (leftBlinkerGpioLine.is_requested()) {
    //     leftBlinkerGpioLine.set_value(0);
    //     leftBlinkerGpioLine.release();
    // }
}
