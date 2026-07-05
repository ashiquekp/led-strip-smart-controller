import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../shared/models/dashboard_status.dart';

part 'dashboard_controller.g.dart';

@riverpod
class DashboardController extends _$DashboardController {
  @override
  DashboardStatus build() {
    return const DashboardStatus(
      deviceConnected: false,
      mqttConnected: false,
      currentEffect: 'Static',
      brightness: 64,
    );
  }

  void updateBrightness(int brightness) {
    state = state.copyWith(
      brightness: brightness,
    );
  }

  void updateDeviceStatus(bool connected) {
    state = state.copyWith(
      deviceConnected: connected,
    );
  }

  void updateMqttStatus(bool connected) {
    state = state.copyWith(
      mqttConnected: connected,
    );
  }
}