#ifndef SYSTEM_H
#define SYSTEM_H

#include <QObject>
#include <QTimer>
#include <QDateTime>

class System : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged FINAL)
public:
    explicit System(QObject *parent = nullptr);

    QString currentTime() const;
    void setCurrentTime(const QString &newCurrentTime);
    void currentTimeTimerTimeout();

signals:
    void currentTimeChanged();
private:
    QString m_currentTime;
    QTimer* m_currentTimeTimer;
};

#endif // SYSTEM_H
