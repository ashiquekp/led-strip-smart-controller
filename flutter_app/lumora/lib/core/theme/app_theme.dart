import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData get light {
    return FlexThemeData.light(
      scheme: FlexScheme.blueM3,
      useMaterial3: true,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 7,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }

  static ThemeData get dark {
    return FlexThemeData.dark(
      scheme: FlexScheme.blueM3,
      useMaterial3: true,
      surfaceMode: FlexSurfaceMode.highScaffoldLowSurface,
      blendLevel: 10,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}