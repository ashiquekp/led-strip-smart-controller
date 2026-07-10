class MqttTopics {
  const MqttTopics._();

  /// Root namespace for the application.
  static const String root = 'lumora';

  /// Default device identifier.
  /// Later this will come from persistent storage.
  static const String deviceId = 'device01';

  static const String base = '$root/devices/$deviceId';

  // Device lifecycle
  static const String availability = '$base/availability';
  static const String state = '$base/state';
  static const String telemetry = '$base/telemetry';

  // Commands
  static const String commandPower = '$base/command/power';
  static const String commandBrightness = '$base/command/brightness';
  static const String commandColor = '$base/command/color';
  static const String commandEffect = '$base/command/effect';
  static const String commandPreset = '$base/command/preset';
  static const String commandSchedule = '$base/command/schedule';

  // Configuration
  static const String firmware = '$base/config/firmware';
  static const String settings = '$base/config/settings';

  // Events
  static const String eventConnected = '$base/event/connected';
  static const String eventDisconnected = '$base/event/disconnected';

  /// Build topics dynamically for future multi-device support.
  static String baseTopic(String deviceId) => '$root/devices/$deviceId';

  static String commandPowerTopic(String deviceId) =>
      '${baseTopic(deviceId)}/command/power';

  static String commandBrightnessTopic(String deviceId) =>
      '${baseTopic(deviceId)}/command/brightness';

  static String commandColorTopic(String deviceId) =>
      '${baseTopic(deviceId)}/command/color';

  static String commandEffectTopic(String deviceId) =>
      '${baseTopic(deviceId)}/command/effect';

  static String stateTopic(String deviceId) => '${baseTopic(deviceId)}/state';

  static String telemetryTopic(String deviceId) =>
      '${baseTopic(deviceId)}/telemetry';
}
