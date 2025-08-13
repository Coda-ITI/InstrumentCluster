#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <Controllers/system.h>
#include <Controllers/lightcontrol.h>
#include <Controllers/indicators.h>
#include <Controllers/readingscommportal.h>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterType<System>("Controllers", 1, 0, "System");

    // defining a system object
    System m_systemHandler;
    LightControl m_lightControlHandler;
    Indicators m_indicators;
    ReadingsCommPortal m_readingsCommPortal;
    QQmlApplicationEngine engine;

    engine.addImportPath("/home/nemesis/Qt/6.9.1/gcc_64/qml");

    QQmlContext * context(engine.rootContext());
    context->setContextProperty("systemHandler", &m_systemHandler);
    context->setContextProperty("lightControl", &m_lightControlHandler);
    context->setContextProperty("indicators", &m_indicators);
    context->setContextProperty("readings", &m_readingsCommPortal);

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);
    engine.loadFromModule("InstrumentCluster", "Main");

    return app.exec();
}
