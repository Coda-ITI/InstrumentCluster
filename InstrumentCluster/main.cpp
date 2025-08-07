#include <QGuiApplication>
#include <QQmlApplicationEngine>


int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    engine.addImportPath("/home/nemesis/Qt/6.9.1/gcc_64/qml");

    // qmlRegisterSingletonType(QUrl("qrc:/ui/StyleTheme/StyleTheme.qml"), "Theme", 1, 0, "Theme");
    // qmlRegisterSingletonType(QUrl("qrc:/ThemeSettings.qml"),
    //                          "App.Settings", 1, 0,
    //                          "ThemeSettings");


    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
                     &app, []() { QCoreApplication::exit(-1); },
                     Qt::QueuedConnection);
    engine.loadFromModule("InstrumentCluster", "Main");

    return app.exec();
}
