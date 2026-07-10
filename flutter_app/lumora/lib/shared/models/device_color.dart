import 'package:flutter/material.dart';

class DeviceColor {
  const DeviceColor({
    required this.red,
    required this.green,
    required this.blue,
  });

  final int red;
  final int green;
  final int blue;

  Color get flutterColor {
    return Color.fromARGB(255, red, green, blue);
  }

  DeviceColor copyWith({int? red, int? green, int? blue}) {
    return DeviceColor(
      red: red ?? this.red,
      green: green ?? this.green,
      blue: blue ?? this.blue,
    );
  }

  static const white = DeviceColor(red: 255, green: 255, blue: 255);

  static const black = DeviceColor(red: 0, green: 0, blue: 0);

  static const redColor = DeviceColor(red: 255, green: 0, blue: 0);

  static const greenColor = DeviceColor(red: 0, green: 255, blue: 0);

  static const blueColor = DeviceColor(red: 0, green: 0, blue: 255);

  @override
  String toString() {
    return 'DeviceColor(r: $red, g: $green, b: $blue)';
  }
}
