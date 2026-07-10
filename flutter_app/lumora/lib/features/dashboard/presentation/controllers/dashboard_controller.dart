import 'package:lumora/features/lighting/providers/lighting_repository_provider.dart';
import 'package:lumora/features/lighting/repositories/lighting_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


import '../../../../shared/enums/connection_status.dart';
import '../../../../shared/models/device_state.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  late final LightingRepository _repository;

  @override
  DeviceState build() {
    _repository = ref.read(lightingRepositoryProvider);

    return DeviceState.initial();
  }

  Future<void> connect() async {
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

  void updateBrightness(int value) {
    _repository.setBrightness(value);

    state = state.copyWith(
      brightness: value,
      lastUpdated: DateTime.now(),
    );
  }

  void updatePower(bool power) {
    _repository.setPower(power);

    state = state.copyWith(
      power: power,
      lastUpdated: DateTime.now(),
    );
  }
}