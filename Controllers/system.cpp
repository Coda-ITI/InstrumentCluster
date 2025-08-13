#include "system.h"

System::System(QObject *parent)
    : QObject{parent}
{
    m_currentTimeTimer = new QTimer(this);
    m_currentTimeTimer->setInterval(500);

    m_currentTimeTimer->setSingleShot(true);

    // everytime this timer timesout, it will call the function below
    connect(m_currentTimeTimer, &QTimer::timeout, this, &System::currentTimeTimerTimeout);

    currentTimeTimerTimeout();
}

QString System::currentTime() const
{
    return m_currentTime;
}

void System::setCurrentTime(const QString &newCurrentTime)
{
    if (m_currentTime == newCurrentTime)
        return;
    m_currentTime = newCurrentTime;
    emit currentTimeChanged();
}

void System::currentTimeTimerTimeout()
{
    QDateTime dateTime = QDateTime::currentDateTime();
    QString currentTime = dateTime.toString("hh:mm ap");  // Fix format

    setCurrentTime(currentTime);

    m_currentTimeTimer->start();  // Ensure it restarts
}
