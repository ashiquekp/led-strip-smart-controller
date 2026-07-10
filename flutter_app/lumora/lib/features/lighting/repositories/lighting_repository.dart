import 'dart:async';
import 'dart:convert';

import 'package:lumora/core/services/mqtt/models/brightness_command.dart';
import 'package:lumora/core/services/mqtt/models/color_command.dart';
import 'package:lumora/core/services/mqtt/models/effect_command.dart';
import 'package:lumora/core/services/mqtt/models/mqtt_incoming_message.dart';
import 'package:lumora/core/services/mqtt/models/power_command.dart';
import 'package:lumora/core/services/mqtt/mqtt_service.dart';
import 'package:lumora/core/services/mqtt/mqtt_topics.dart';
import 'package:lumora/shared/enums/device_effect.dart';
import 'package:lumora/shared/models/device_state.dart';

class LightingRepository {
  LightingRepository({required MqttService mqttService})
    : _mqttService = mqttService {
    _messageSubscription = _mqttService.messageStream.listen(
      _handleIncomingMessage,
    );

    _connectionSubscription = _mqttService.connectionStream.listen((_) {});
  }

  final MqttService _mqttService;

  late final StreamSubscription<MqttIncomingMessage> _messageSubscription;

  late final StreamSubscription<bool> _connectionSubscription;

  final StreamController<DeviceState> _deviceStateController =
      StreamController<DeviceState>.broadcast();

  DeviceState _currentState = DeviceState.initial();

  Stream<DeviceState> get deviceStateStream => _deviceStateController.stream;

  DeviceState get currentState => _currentState;

  bool get isConnected => _mqttService.isConnected;

  Stream<bool> get connectionStream => _mqttService.connectionStream;

  Future<bool> connect() {
    return _mqttService.connect();
  }

  void disconnect() {
    _mqttService.disconnect();
  }

  void _handleIncomingMessage(MqttIncomingMessage message) {
    switch (message.topic) {
      case MqttTopics.state:
        _handleStateMessage(message.payload);
        break;

      case MqttTopics.telemetry:
        // Day 4
        break;

      case MqttTopics.availability:
        // Day 5
        break;
    }
  }

  void _handleStateMessage(String payload) {
    try {
      final json = jsonDecode(payload) as Map<String, dynamic>;

      _currentState = DeviceState.fromJson(json);

      _deviceStateController.add(_currentState);
    } catch (_) {
      // Ignore malformed packets.
    }
  }

  void setPower(bool power) {
    final command = PowerCommand(power: power);

    _mqttService.publishJson(MqttTopics.commandPower, command.toJson());
  }

  void setBrightness(int brightness) {
    final command = BrightnessCommand(brightness: brightness.clamp(0, 255));

    _mqttService.publishJson(MqttTopics.commandBrightness, command.toJson());
  }

  void setColor({required int red, required int green, required int blue}) {
    final command = ColorCommand(
      red: red.clamp(0, 255),
      green: green.clamp(0, 255),
      blue: blue.clamp(0, 255),
    );

    _mqttService.publishJson(MqttTopics.commandColor, command.toJson());
  }

  void setEffect({required DeviceEffect effect, required int speed}) {
    final command = EffectCommand(
      effect: effect.name,
      speed: speed.clamp(0, 100),
    );

    _mqttService.publishJson(MqttTopics.commandEffect, command.toJson());
  }

  void dispose() {
    _messageSubscription.cancel();

    _connectionSubscription.cancel();

    _deviceStateController.close();
  }
}
