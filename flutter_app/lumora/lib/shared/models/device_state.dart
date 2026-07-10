import '../enums/connection_status.dart';
import '../enums/device_effect.dart';
import 'device_color.dart';

class DeviceState {
  const DeviceState({
    required this.deviceStatus,
    required this.mqttStatus,
    required this.power,
    required this.brightness,
    required this.effect,
    required this.speed,
    required this.color,
    required this.lastUpdated,
    required this.firmwareVersion,
  });

  final ConnectionStatus deviceStatus;
  final ConnectionStatus mqttStatus;
  final bool power;
  final int brightness;
  final DeviceEffect effect;
  final int speed;
  final DeviceColor color;
  final DateTime lastUpdated;
  final String firmwareVersion;

  factory DeviceState.initial() {
    return DeviceState(
      deviceStatus: ConnectionStatus.disconnected,
      mqttStatus: ConnectionStatus.disconnected,
      power: false,
      brightness: 128,
      effect: DeviceEffect.staticColor,
      speed: 50,
      color: DeviceColor.white,
      lastUpdated: DateTime.now(),
      firmwareVersion: '1.0.0',
    );
  }

  factory DeviceState.fromJson(Map<String, dynamic> json) {
    return DeviceState(
      deviceStatus: _parseConnectionStatus(
        json['deviceStatus'],
        ConnectionStatus.disconnected,
      ),

      mqttStatus: _parseConnectionStatus(
        json['mqttStatus'],
        ConnectionStatus.disconnected,
      ),
      power: json['power'] as bool? ?? false,
      brightness: json['brightness'] as int? ?? 128,
      effect: _parseEffect(json['effect']),
      speed: json['speed'] as int? ?? 50,
      color: DeviceColor(
        red: json['red'] as int? ?? 255,
        green: json['green'] as int? ?? 255,
        blue: json['blue'] as int? ?? 255,
      ),
      lastUpdated: DateTime.now(),
      firmwareVersion: json['firmwareVersion'] as String? ?? '1.0.0',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'deviceStatus': deviceStatus.name,
      'mqttStatus': mqttStatus.name,
      'power': power,
      'brightness': brightness,
      'effect': effect.name,
      'speed': speed,
      'red': color.red,
      'green': color.green,
      'blue': color.blue,
      'firmwareVersion': firmwareVersion,
    };
  }

  DeviceState copyWith({
    ConnectionStatus? deviceStatus,
    ConnectionStatus? mqttStatus,
    bool? power,
    int? brightness,
    DeviceEffect? effect,
    int? speed,
    DeviceColor? color,
    DateTime? lastUpdated,
    String? firmwareVersion,
  }) {
    return DeviceState(
      deviceStatus: deviceStatus ?? this.deviceStatus,
      mqttStatus: mqttStatus ?? this.mqttStatus,
      power: power ?? this.power,
      brightness: brightness ?? this.brightness,
      effect: effect ?? this.effect,
      speed: speed ?? this.speed,
      color: color ?? this.color,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      firmwareVersion: firmwareVersion ?? this.firmwareVersion,
    );
  }

  static ConnectionStatus _parseConnectionStatus(
    dynamic value,
    ConnectionStatus fallback,
  ) {
    if (value is String) {
      for (final status in ConnectionStatus.values) {
        if (status.name == value) {
          return status;
        }
      }
    }

    return fallback;
  }

  static DeviceEffect _parseEffect(dynamic value) {
    if (value is String) {
      for (final effect in DeviceEffect.values) {
        if (effect.name == value) {
          return effect;
        }
      }
    }

    return DeviceEffect.staticColor;
  }

  @override
  String toString() {
    return '''
DeviceState(
  deviceStatus: $deviceStatus,
  mqttStatus: $mqttStatus,
  power: $power,
  brightness: $brightness,
  effect: $effect,
  speed: $speed,
  color: $color,
  firmwareVersion: $firmwareVersion
)
''';
  }
}
