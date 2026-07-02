import 'package:flutter/material.dart';

import '../core/router/app_router.dart';
import '../core/theme/app_theme.dart';

class LumoraApp extends StatelessWidget {
  const LumoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Lumora',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: AppRouter.router,
    );
  }
}