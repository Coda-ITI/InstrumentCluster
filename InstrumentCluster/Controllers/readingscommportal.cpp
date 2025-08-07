#include "readingscommportal.h"

ReadingsCommPortal::ReadingsCommPortal(QObject *parent)
    : QObject{parent}
{}

QString ReadingsCommPortal::speedVal() const
{
    return m_speedVal;
}

void ReadingsCommPortal::setSpeedVal(const QString &newSpeedVal)
{
    if (m_speedVal == newSpeedVal)
        return;
    m_speedVal = newSpeedVal;
    emit speedValChanged();
}

QString ReadingsCommPortal::selectedGear() const
{
    return m_selectedGear;
}

void ReadingsCommPortal::setSelectedGear(const QString &newSelectedGear)
{
    if (m_selectedGear == newSelectedGear)
        return;
    m_selectedGear = newSelectedGear;
    emit selectedGearChanged();
}

QString ReadingsCommPortal::detectedRoadSign() const
{
    return m_detectedRoadSign;
}

void ReadingsCommPortal::setDetectedRoadSign(const QString &newDetectedRoadSign)
{
    if (m_detectedRoadSign == newDetectedRoadSign)
        return;
    m_detectedRoadSign = newDetectedRoadSign;
    emit detectedRoadSignChanged();
}

bool ReadingsCommPortal::isLightMode() const
{
    return m_isLightMode;
}

void ReadingsCommPortal::setIsLightMode(bool newIsLightMode)
{
    if (m_isLightMode == newIsLightMode)
        return;
    m_isLightMode = newIsLightMode;
    emit isLightModeChanged();
}
