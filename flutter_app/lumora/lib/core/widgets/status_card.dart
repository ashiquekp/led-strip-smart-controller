import 'package:flutter/material.dart';

import '../constants/app_spacing.dart';
import 'app_card.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      child: Row(
        children: [
          Icon(icon, size: 30),
          const SizedBox(width: AppSpacing.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.bodyMedium),
                const SizedBox(height: 4),
                Text(value, style: theme.textTheme.headlineSmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
