#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>

QObject *object;

void testDynamicProperty()
{
    QObject *sitenow = object->findChild<QObject*>("sitenow");
    sitenow->setProperty("source", "Images/sitenow002.png");
}

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    object = engine.rootObjects().first();
    QObject *sitenow = object->findChild<QObject*>("sitenow");
    sitenow->setProperty("source", "Images/sitenow002.png");

    // testDynamicProperty();

    return app.exec();
}


