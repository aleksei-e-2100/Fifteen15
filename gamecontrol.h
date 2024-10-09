#pragma once

#include <QObject>
#include <vector>

class GameControl : public QObject
{
    Q_OBJECT

public:
    GameControl(QObject* parent = nullptr);

public:
    Q_INVOKABLE void shuffle();

    Q_INVOKABLE int row(int instanceId);

    Q_INVOKABLE int column(int instanceId);

    Q_INVOKABLE bool relocate(int instanceId);

private:
    int findIndex(int instanceId);

private:
    std::vector<int> locations;
};
