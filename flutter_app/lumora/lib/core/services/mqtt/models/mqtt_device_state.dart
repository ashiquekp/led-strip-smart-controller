class MqttDeviceState {
  const MqttDeviceState({
    required this.power,
    required this.brightness,
    required this.effect,
    required this.speed,
    required this.red,
    required this.green,
    required this.blue,
    required this.firmware,
  });

  final bool power;

  final int brightness;

  final String effect;

  final int speed;

  final int red;

  final int green;

  final int blue;

  final String firmware;

  Map<String, dynamic> toJson() {
    return {
      'power': power,
      'brightness': brightness,
      'effect': effect,
      'speed': speed,
      'color': {'red': red, 'green': green, 'blue': blue},
      'firmware': firmware,
    };
  }

  factory MqttDeviceState.fromJson(Map<String, dynamic> json) {
    final color = json['color'] as Map<String, dynamic>;

    return MqttDeviceState(
      power: json['power'] as bool,
      brightness: json['brightness'] as int,
      effect: json['effect'] as String,
      speed: json['speed'] as int,
      red: color['red'] as int,
      green: color['green'] as int,
      blue: color['blue'] as int,
      firmware: json['firmware'] as String,
    );
  }
}
