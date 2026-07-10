enum DeviceEffect {
  staticColor,
  rainbow,
  breathing,
  colorWipe,
  theaterChase,
  pulse,
  blink,
  fire,
  ocean,
  party,
  police,
  randomColors,
}

extension DeviceEffectX on DeviceEffect {
  String get label {
    switch (this) {
      case DeviceEffect.staticColor:
        return 'Static';

      case DeviceEffect.rainbow:
        return 'Rainbow';

      case DeviceEffect.breathing:
        return 'Breathing';

      case DeviceEffect.colorWipe:
        return 'Color Wipe';

      case DeviceEffect.theaterChase:
        return 'Theater Chase';

      case DeviceEffect.pulse:
        return 'Pulse';

      case DeviceEffect.blink:
        return 'Blink';

      case DeviceEffect.fire:
        return 'Fire';

      case DeviceEffect.ocean:
        return 'Ocean';

      case DeviceEffect.party:
        return 'Party';

      case DeviceEffect.police:
        return 'Police';

      case DeviceEffect.randomColors:
        return 'Random Colors';
    }
  }
}
