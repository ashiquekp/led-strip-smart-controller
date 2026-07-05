class DashboardStatus {
  const DashboardStatus({
    required this.deviceConnected,
    required this.mqttConnected,
    required this.currentEffect,
    required this.brightness,
  });

  final bool deviceConnected;

  final bool mqttConnected;

  final String currentEffect;

  final int brightness;

  DashboardStatus copyWith({
    bool? deviceConnected,
    bool? mqttConnected,
    String? currentEffect,
    int? brightness,
  }) {
    return DashboardStatus(
      deviceConnected:
          deviceConnected ?? this.deviceConnected,
      mqttConnected:
          mqttConnected ?? this.mqttConnected,
      currentEffect:
          currentEffect ?? this.currentEffect,
      brightness:
          brightness ?? this.brightness,
    );
  }
}