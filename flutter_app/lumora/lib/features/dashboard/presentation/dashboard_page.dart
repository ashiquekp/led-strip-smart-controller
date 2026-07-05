import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/app_section_title.dart';
import '../../../core/widgets/status_card.dart';
import '../controllers/dashboard_controller.dart';

class DashboardPage extends ConsumerWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard =
        ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lumora'),
      ),
      body: ListView(
        padding: AppSpacing.screenPadding,
        children: [
          const AppSectionTitle(
            title: 'Device Overview',
          ),

          const SizedBox(height: 16),

          StatusCard(
            title: 'Device',
            value: dashboard.deviceConnected
                ? 'Connected'
                : 'Disconnected',
            icon: Icons.memory,
          ),

          const SizedBox(height: 12),

          StatusCard(
            title: 'MQTT',
            value: dashboard.mqttConnected
                ? 'Connected'
                : 'Disconnected',
            icon: Icons.cloud_done,
          ),

          const SizedBox(height: 12),

          StatusCard(
            title: 'Current Effect',
            value: dashboard.currentEffect,
            icon: Icons.auto_awesome,
          ),

          const SizedBox(height: 12),

          StatusCard(
            title: 'Brightness',
            value:
                '${dashboard.brightness}/255',
            icon: Icons.light_mode,
          ),
        ],
      ),
    );
  }
}