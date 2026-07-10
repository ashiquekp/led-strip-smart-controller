class PowerCommand {
  const PowerCommand({required this.power});

  final bool power;

  Map<String, dynamic> toJson() {
    return {'power': power};
  }

  factory PowerCommand.fromJson(Map<String, dynamic> json) {
    return PowerCommand(power: json['power'] as bool);
  }
}
