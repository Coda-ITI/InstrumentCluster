#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    // qmlRegisterSingletonType(QUrl("qrc:/ui/StyleTheme/StyleTheme.qml"), "Theme", 1, 0, "Theme");

    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);
    engine.loadFromModule("InstrumentCluster", "Main");

    return app.exec();
}
