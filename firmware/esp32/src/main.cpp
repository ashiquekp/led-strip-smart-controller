#include <Arduino.h>

#include "app/led/led_manager.h"

LedManager ledManager;

void setup()
{
    Serial.begin(115200);

    ledManager.begin();
}

void loop()
{
    ledManager.update();
}