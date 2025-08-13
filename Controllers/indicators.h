#ifndef INDICATORS_H
#define INDICATORS_H

#include <QObject>
#include <gpiod.h>
#include <gpiod.hpp>
#include <iostream>

constexpr int RIGHT_BLINKER_PIN = 17;
constexpr int LEFT_BLINKER_PIN = 21;

class Indicators : public QObject
{
    Q_OBJECT
    Q_PROPERTY(bool rightBlinker READ rightBlinker WRITE setRightBlinker NOTIFY rightBlinkerChanged FINAL)
    Q_PROPERTY(bool leftBlinker READ leftBlinker WRITE setLeftBlinker NOTIFY leftBlinkerChanged FINAL)
public:
    explicit Indicators(QObject *parent = nullptr);
    ~Indicators();

    bool rightBlinker() const;
    void setRightBlinker(bool newRightBlinker);

    bool leftBlinker() const;
    void setLeftBlinker(bool newLeftBlinker);

signals:
    void rightBlinkerChanged();
    void leftBlinkerChanged();

private:
    bool m_rightBlinker;
    bool m_leftBlinker;

    const std::string chipName = "gpiochip0";

    gpiod::chip chip;

    gpiod::line rightBlinkerGpioLine;
    gpiod::line leftBlinkerGpioLine;

    const int rightBlinkerGpioPin = RIGHT_BLINKER_PIN;
    const int leftBlinkerGpioPin = LEFT_BLINKER_PIN;

    void gpioPinWrite(const int &gpioPin, const int &value);
};

#endif // INDICATORS_H
