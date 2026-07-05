import 'package:flutter/material.dart';

import '../core/config/app_config.dart';
import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';

class LumoraApp extends StatelessWidget {
  const LumoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: appRouter,
    );
  }
}