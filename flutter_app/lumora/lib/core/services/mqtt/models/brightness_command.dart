class BrightnessCommand {
  const BrightnessCommand({required this.brightness});

  final int brightness;

  Map<String, dynamic> toJson() {
    return {'brightness': brightness};
  }

  factory BrightnessCommand.fromJson(Map<String, dynamic> json) {
    return BrightnessCommand(brightness: json['brightness'] as int);
  }
}
