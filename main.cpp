#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "gamecontrol.h"

int main(int argc, char* argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<GameControl>("controls", 1, 0, "GameControl");

    QObject::connect(
        &engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() {
            QCoreApplication::exit(-1);
        },
        Qt::QueuedConnection);

    engine.loadFromModule("qmlpath", "Main");

    return app.exec();
}
