class ColorCommand {
  const ColorCommand({
    required this.red,
    required this.green,
    required this.blue,
  });

  final int red;
  final int green;
  final int blue;

  Map<String, dynamic> toJson() {
    return {'red': red, 'green': green, 'blue': blue};
  }

  factory ColorCommand.fromJson(Map<String, dynamic> json) {
    return ColorCommand(
      red: json['red'] as int,
      green: json['green'] as int,
      blue: json['blue'] as int,
    );
  }
}
