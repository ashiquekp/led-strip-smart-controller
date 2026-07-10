class MqttPayload {
  const MqttPayload._();

  static String power(bool on) {
    return on ? 'ON' : 'OFF';
  }

  static String brightness(int value) {
    return value.toString();
  }
}
