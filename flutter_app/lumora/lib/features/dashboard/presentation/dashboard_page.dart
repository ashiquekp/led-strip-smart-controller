import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/app_section_title.dart';
import '../../../core/widgets/status_card.dart';
import '../../../shared/enums/connection_status.dart';
import '../../../shared/enums/device_effect.dart';
import 'controllers/dashboard_controller.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Lumora')),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          const AppSectionTitle(title: 'Device Overview'),

          const SizedBox(height: AppSpacing.lg),

          StatusCard(
            title: 'Device',
            value: dashboard.deviceStatus.label,
            icon: Icons.memory,
          ),

          const SizedBox(height: AppSpacing.md),

          StatusCard(
            title: 'MQTT',
            value: dashboard.mqttStatus.label,
            icon: Icons.cloud_done,
          ),

          const SizedBox(height: AppSpacing.md),

          StatusCard(
            title: 'Current Effect',
            value: dashboard.effect.label,
            icon: Icons.auto_awesome,
          ),

          const SizedBox(height: AppSpacing.md),

          StatusCard(
            title: 'Brightness',
            value: '${dashboard.brightness}/255',
            icon: Icons.light_mode,
          ),

          const SizedBox(height: AppSpacing.md),

          StatusCard(
            title: 'Power',
            value: dashboard.power ? 'ON' : 'OFF',
            icon: Icons.power_settings_new,
          ),

          const SizedBox(height: AppSpacing.md),

          StatusCard(
            title: 'Firmware',
            value: dashboard.firmwareVersion,
            icon: Icons.system_update,
          ),
        ],
      ),
    );
  }
}
