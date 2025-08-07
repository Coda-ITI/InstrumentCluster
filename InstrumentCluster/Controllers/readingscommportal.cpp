#include "readingscommportal.h"

ReadingsCommPortal::ReadingsCommPortal(QObject *parent)
    : QObject{parent}
    , m_speedVal("0")
    , m_selectedGear("P")
    , m_detectedRoadSign("SpeedLimit50")
    , m_isLightMode(false)
{
    setupSocket();
}

void ReadingsCommPortal::setupSocket()
{
    m_socket = new QLocalSocket(this);

    connect(m_socket, &QLocalSocket::readyRead, this, [this]() {
        m_readBuffer.append(m_socket->readAll());

        while (m_readBuffer.size() >= 3) {
            quint8 msgId = static_cast<quint8>(m_readBuffer[0]);
            quint16 payloadLen = (static_cast<quint8>(m_readBuffer[1]) << 8)
                                 | static_cast<quint8>(m_readBuffer[2]);

            if (m_readBuffer.size() < 3 + payloadLen)
                return; // Wait for full message

            QByteArray payload = m_readBuffer.mid(3, payloadLen);
            parseReceivedMessage(msgId, payload);

            m_readBuffer.remove(0, 3 + payloadLen);
        }
    });

    connect(m_socket, &QLocalSocket::disconnected, this, []() {
        qWarning() << "Disconnected from socket server.";
    });

    m_socket->connectToServer(SOCKET_FILE_FULL_PATH);
    if (!m_socket->waitForConnected(1000)) {
        qWarning() << "Failed to connect to socket:" << m_socket->errorString();
    }
}

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

    qDebug() << "m_speedVal =" << m_speedVal;
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

    qDebug() << "m_selectedGear =" << m_selectedGear;
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

    qDebug() << "m_detectedRoadSign =" << m_detectedRoadSign;
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

    qDebug() << "m_isLightMode =" << m_isLightMode;
}

void ReadingsCommPortal::parseReceivedMessage(quint8 msgId, const QByteArray &payload)
{
    // switch on first byte to determine the type of data
    // call the set method of each property
    switch (msgId)
    {
        case SPEED_MSG_ID:
            setSpeedVal(QString::fromUtf8(payload));
        break;

        case GEAR_MSG_ID:
            setSelectedGear(QString::fromUtf8(payload));
        break;

        case SIGN_MSG_ID:
            setDetectedRoadSign(QString::fromUtf8(payload));
        break;

        case THEME_MSG_ID:
            setIsLightMode(payload == "1");
        break;

        default:
            qWarning("Unknown message ID received: %02X", msgId);
        break;
    }
}

ReadingsCommPortal::~ReadingsCommPortal()
{
    if (m_socket)
    {
        m_socket->disconnectFromServer();
        m_socket->deleteLater();
    }
}
