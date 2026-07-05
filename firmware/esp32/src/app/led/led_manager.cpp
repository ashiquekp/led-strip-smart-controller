#include "led_manager.h"

#include <FastLED.h>

#include "../config/app_config.h"

namespace
{
CRGB leds[AppConfig::LED_COUNT];
}

void LedManager::begin()
{
    FastLED.addLeds<WS2812B, AppConfig::LED_PIN, GRB>(
        leds,
        AppConfig::LED_COUNT);

    FastLED.setBrightness(
        AppConfig::DEFAULT_BRIGHTNESS);

    fill_solid(
        leds,
        AppConfig::LED_COUNT,
        CRGB::Blue);

    FastLED.show();
}

void LedManager::update()
{
}