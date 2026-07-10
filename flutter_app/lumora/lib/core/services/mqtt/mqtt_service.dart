import 'dart:async';
import 'dart:convert';

import 'package:lumora/core/logging/app_logger.dart';
import 'package:lumora/core/services/mqtt/models/mqtt_incoming_message.dart';
import 'package:lumora/core/services/mqtt/mqtt_topics.dart';
import 'package:mqtt_client/mqtt_client.dart' as mqtt;
import 'package:mqtt_client/mqtt_server_client.dart';

class MqttService {
  MqttService({required this.host, this.port = 1883, required this.clientId}) {
    _client = MqttServerClient(host, clientId);

    _configureClient();
  }

  final String host;
  final int port;
  final String clientId;

  late final MqttServerClient _client;

  final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  final StreamController<MqttIncomingMessage> _messageController =
      StreamController<MqttIncomingMessage>.broadcast();

  Stream<bool> get connectionStream => _connectionController.stream;

  Stream<MqttIncomingMessage> get messageStream => _messageController.stream;

  bool get isConnected =>
      _client.connectionStatus?.state == mqtt.MqttConnectionState.connected;

  void _configureClient() {
    _client.port = port;

    _client.keepAlivePeriod = 30;

    _client.autoReconnect = true;

    _client.resubscribeOnAutoReconnect = true;

    _client.logging(on: false);

    _client.setProtocolV311();

    _client.onConnected = () {
      AppLogger.info('MQTT Connected');

      _connectionController.add(true);
    };

    _client.onDisconnected = () {
      AppLogger.warning('MQTT Disconnected');

      _connectionController.add(false);
    };

    _client.onSubscribed = (topic) {
      AppLogger.info('Subscribed: $topic');
    };
  }

  Future<bool> connect() async {
    try {
      await _client.connect();

      if (!isConnected) {
        return false;
      }

      _client.updates?.listen(_onMessage);

      _subscribeToDefaultTopics();

      AppLogger.info('MQTT initialization completed.');

      return true;
    } catch (e) {
      AppLogger.error('MQTT Connect Error: $e');

      disconnect();

      return false;
    }
  }

  void _subscribeToDefaultTopics() {
    const topics = <String>[
      MqttTopics.state,
      MqttTopics.telemetry,
      MqttTopics.availability,
    ];

    for (final topic in topics) {
      subscribe(topic);
    }
  }

  void disconnect() {
    _client.disconnect();
  }

  void subscribe(String topic) {
    if (!isConnected) {
      return;
    }

    _client.subscribe(topic, mqtt.MqttQos.atLeastOnce);
  }

  void unsubscribe(String topic) {
    if (!isConnected) {
      return;
    }

    _client.unsubscribe(topic);
  }

  void publishJson(String topic, Map<String, dynamic> payload) {
    if (!isConnected) {
      AppLogger.warning('Cannot publish. MQTT client is disconnected.');
      return;
    }

    final builder = mqtt.MqttClientPayloadBuilder();

    builder.addString(jsonEncode(payload));

    _client.publishMessage(topic, mqtt.MqttQos.atLeastOnce, builder.payload!);
  }

  void _onMessage(List<mqtt.MqttReceivedMessage<mqtt.MqttMessage?>> events) {
    for (final event in events) {
      final publishMessage = event.payload as mqtt.MqttPublishMessage;

      final payload = mqtt.MqttPublishPayload.bytesToStringAsString(
        publishMessage.payload.message,
      );

      final message = MqttIncomingMessage(topic: event.topic, payload: payload);

      AppLogger.info('MQTT RX [${event.topic}] $payload');

      _messageController.add(message);
    }
  }

  void dispose() {
    disconnect();

    _connectionController.close();

    _messageController.close();
  }
}
