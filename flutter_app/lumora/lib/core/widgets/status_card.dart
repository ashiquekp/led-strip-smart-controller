import 'package:flutter/material.dart';

import '../constants/app_radius.dart';
import '../constants/app_spacing.dart';

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.card,
      ),
      child: Padding(
        padding: AppSpacing.screenPadding,
        child: Row(
          children: [
            Icon(icon,size:30),

            const SizedBox(width:16),

            Expanded(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  Text(title),

                  Text(
                    value,
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}