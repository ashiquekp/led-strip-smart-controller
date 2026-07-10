import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumora/core/services/mqtt/mqtt_service.dart';

final mqttServiceProvider = Provider<MqttService>((ref) {
  final service = MqttService(
    host: 'broker.hivemq.com',
    port: 1883,
    clientId: 'lumora_flutter',
  );

  ref.onDispose(service.dispose);

  return service;
});
