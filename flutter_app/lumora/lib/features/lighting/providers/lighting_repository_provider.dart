import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lumora/core/services/mqtt/providers/mqtt_service_provider.dart';
import 'package:lumora/features/lighting/repositories/lighting_repository.dart';

final lightingRepositoryProvider = Provider<LightingRepository>((ref) {
  return LightingRepository(mqttService: ref.watch(mqttServiceProvider));
});
