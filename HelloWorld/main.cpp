#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QDebug>
#include <QQmlContext>
#include <QQuickItem>

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

    
    QObject *rootObject = engine.rootObjects().first();
    qDebug() << "rootObject:" << rootObject;
    QQuickItem *sitenow = rootObject->findChild<QQuickItem*>("sitenow");
    
    if (sitenow) {
        qDebug() << "sitenow:" << sitenow;
        sitenow->setProperty("source", "qrc:///Images/sitenow002.png");
    }
//    sitenow->setProperty("source", "Images/sitenow002.png");
    // testDynamicProperty();

    return app.exec();
}


