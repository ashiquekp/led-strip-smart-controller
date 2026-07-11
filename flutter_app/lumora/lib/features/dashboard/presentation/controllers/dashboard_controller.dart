import 'dart:async';

import 'package:lumora/features/lighting/providers/lighting_repository_provider.dart';
import 'package:lumora/features/lighting/repositories/lighting_repository.dart';
import 'package:lumora/shared/enums/device_effect.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../shared/enums/connection_status.dart';
import '../../../../shared/models/device_state.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  late final LightingRepository _repository;

  StreamSubscription<DeviceState>? _deviceSubscription;
  StreamSubscription<bool>? _connectionSubscription;

  @override
  DeviceState build() {
    _repository = ref.read(lightingRepositoryProvider);

    ref.onDispose(() async {
      await _deviceSubscription?.cancel();
      await _connectionSubscription?.cancel();
    });

    _listenToRepository();

    return DeviceState.initial();
  }

  void _listenToRepository() {
    _deviceSubscription?.cancel();

    _deviceSubscription = _repository.deviceStateStream.listen((deviceState) {
      state = deviceState;
    });

    _connectionSubscription?.cancel();

    _connectionSubscription = _repository.connectionStream.listen((connected) {
      state = state.copyWith(
        mqttStatus: connected
            ? ConnectionStatus.connected
            : ConnectionStatus.disconnected,
        lastUpdated: DateTime.now(),
      );
    });
  }

  Future<void> connect() async {
    state = state.copyWith(
      mqttStatus: ConnectionStatus.connecting,
      lastUpdated: DateTime.now(),
    );

    final connected = await _repository.connect();

    state = state.copyWith(
      mqttStatus: connected
          ? ConnectionStatus.connected
          : ConnectionStatus.disconnected,
      lastUpdated: DateTime.now(),
    );
  }

  void disconnect() {
    _repository.disconnect();

    state = state.copyWith(
      mqttStatus: ConnectionStatus.disconnected,
      lastUpdated: DateTime.now(),
    );
  }

  void updatePower(bool value) {
    _repository.setPower(value);
  }

  void updateBrightness(int value) {
    _repository.setBrightness(value);
  }

  void setColor({required int red, required int green, required int blue}) {
    _repository.setColor(red: red, green: green, blue: blue);
  }

  void setEffect({required String effect, required int speed}) {
    _repository.setEffect(
      effect: DeviceEffect.values.firstWhere(
        (e) => e.name == effect,
        orElse: () => DeviceEffect.staticColor,
      ),
      speed: speed,
    );
  }
}

