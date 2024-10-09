#include "gamecontrol.h"

#include <QRandomGenerator>

GameControl::GameControl(QObject* parent)
    : QObject(parent)
{
    shuffle();
}

void GameControl::shuffle()
{
    locations.clear();

    locations.resize(16, 0);

    int i = 0;

    while (true)
    {
        locations[i] = QRandomGenerator::global()->bounded(1, 16);

        for (auto j = 0; j < i; ++j)
        {
            if (locations[i] == locations[j])
            {
                --i;
                break;
            }
        }

        ++i;

        if (i == 15)
            break;
    }
}

int GameControl::row(int instanceId)
{
    auto index = findIndex(instanceId);

    return index / 4;
}

int GameControl::column(int instanceId)
{
    auto index = findIndex(instanceId);

    return index - index / 4 * 4;
}

bool GameControl::relocate(int instanceId)
{
    auto index = findIndex(instanceId);

    int row = index / 4;

    int column = index - index / 4 * 4;

    int relocationIndex = -1;

    if (row < 3 && locations[index + 4] == 0)
        relocationIndex = index + 4;
    else if (row > 0 && locations[index - 4] == 0)
        relocationIndex = index - 4;
    else if (column < 3 && locations[index + 1] == 0)
        relocationIndex = index + 1;
    else if (column > 0 && locations[index - 1] == 0)
        relocationIndex = index - 1;

    if (relocationIndex > -1)
    {
        locations[index] = 0;
        locations[relocationIndex] = instanceId;

        return true;
    }

    return false;
}

int GameControl::findIndex(int instanceId)
{
    int index = 0;

    while (index < 16)
    {
        if (locations[index] == instanceId)
            break;

        ++index;
    }

    return index;
}
