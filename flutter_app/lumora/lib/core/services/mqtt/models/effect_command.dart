class EffectCommand {
  const EffectCommand({required this.effect, required this.speed});

  final String effect;
  final int speed;

  Map<String, dynamic> toJson() {
    return {'effect': effect, 'speed': speed};
  }

  factory EffectCommand.fromJson(Map<String, dynamic> json) {
    return EffectCommand(
      effect: json['effect'] as String,
      speed: json['speed'] as int,
    );
  }
}
