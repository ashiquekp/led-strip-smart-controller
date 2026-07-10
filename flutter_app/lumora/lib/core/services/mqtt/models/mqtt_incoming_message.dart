class MqttIncomingMessage {
  const MqttIncomingMessage({required this.topic, required this.payload});

  final String topic;
  final String payload;

  @override
  String toString() {
    return 'MqttIncomingMessage(topic: $topic, payload: $payload)';
  }
}
