class AppConfig {
  const AppConfig._();

  static const String appName = 'Lumora';

  static const String mqttClientId = 'lumora_flutter';

  static const String mqttBroker = 'broker.hivemq.com';

  static const int mqttPort = 1883;

  static const bool enableLogging = true;

  static const int defaultBrightness = 64;
}