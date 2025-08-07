#include "lightcontrol.h"

LightControl::LightControl(QObject *parent)
    : QObject{parent}
    , m_lowBeam(false)
    , m_highBeam(false)
    , m_fogBeam(false)
{
    // gpiod::chip chip(chipName);
    // gpio.setGpioDirOut(LED_GPIO_PIN);
    // gpio.setGpioValue(LED_GPIO_PIN,ledState);
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
    // writeToFile("/sys/class/gpio/gpio26/value", m_lowBeam ? "1" : "0");
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
    // writeToFile("/sys/class/gpio/gpio26/value", m_lowBeam ? "1" : "0");
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
    // writeToFile("/sys/class/gpio/gpio26/value", m_lowBeam ? "1" : "0");
}


//  // or "gpiochip4" for some pins
// const int gpioPin = 17; // GPIO 17 (change as needed)

// try {
//     // Open the GPIO chip
//

//     // Get the GPIO line
//     gpiod::line line = chip.get_line(gpioPin);

//     // Request the line as an output with initial value LOW
//     line.request({
//         "example",               // Consumer label (for debugging)
//         gpiod::line_request::DIRECTION_OUTPUT,
//         0                        // Initial value (0 = LOW, 1 = HIGH)
//     });

//     std::cout << "Toggling GPIO " << gpioPin << "..." << std::endl;

//     // Toggle the GPIO state
//     for (int i = 0; i < 5; i++) {
//         line.set_value(i % 2); // Alternate between 0 and 1
//         std::cout << "GPIO " << gpioPin << " = " << line.get_value() << std::endl;
//         sleep(1); // Wait 1 second
//     }

//     // Release the line (optional, destructor handles cleanup)
//     line.release();
