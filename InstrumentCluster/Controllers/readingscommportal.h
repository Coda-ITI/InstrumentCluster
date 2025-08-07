#ifndef READINGSCOMMPORTAL_H
#define READINGSCOMMPORTAL_H

#include <QObject>

/*
 * constexpr for speed && gear && sign && theme state
 * method to read the socket string and switch on the MSB then calls the right function
 * setter for each of these based on the property
 *
 */

constexpr int SPEED_MSG_ID = 0x01; // str
constexpr int GEAR_MSG_ID = 0x02; // str (single char --- selected gear property)
constexpr int SIGN_MSG_ID = 0x03; // str
constexpr int THEME_MSG_ID = 0x04; // bool flag
constexpr const char* SOCKET_FILE_FULL_PATH = "/tmp/sock_file"; // socket file

class ReadingsCommPortal : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString speedVal READ speedVal WRITE setSpeedVal NOTIFY speedValChanged FINAL)
    Q_PROPERTY(QString selectedGear READ selectedGear WRITE setSelectedGear NOTIFY selectedGearChanged FINAL)
    Q_PROPERTY(QString detectedRoadSign READ detectedRoadSign WRITE setDetectedRoadSign NOTIFY detectedRoadSignChanged FINAL)
    Q_PROPERTY(bool isLightMode READ isLightMode WRITE setIsLightMode NOTIFY isLightModeChanged FINAL)

public:
    explicit ReadingsCommPortal(QObject *parent = nullptr);
    ~ReadingsCommPortal();

    QString speedVal() const;
    void setSpeedVal(const QString &newSpeedVal);

    QString selectedGear() const;
    void setSelectedGear(const QString &newSelectedGear);

    QString detectedRoadSign() const;
    void setDetectedRoadSign(const QString &newDetectedRoadSign);

    bool isLightMode() const;
    void setIsLightMode(bool newIsLightMode);

signals:
    void speedValChanged();
    void selectedGearChanged();

    void detectedRoadSignChanged();

    void isLightModeChanged();

private:
    QString m_speedVal;
    QString m_selectedGear;
    QString m_detectedRoadSign;
    bool m_isLightMode;
};

#endif // READINGSCOMMPORTAL_H
