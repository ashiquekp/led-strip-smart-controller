enum ConnectionStatus { disconnected, connecting, connected }

extension ConnectionStatusX on ConnectionStatus {
  bool get isConnected => this == ConnectionStatus.connected;

  bool get isConnecting => this == ConnectionStatus.connecting;

  bool get isDisconnected => this == ConnectionStatus.disconnected;

  String get label {
    switch (this) {
      case ConnectionStatus.disconnected:
        return 'Disconnected';

      case ConnectionStatus.connecting:
        return 'Connecting';

      case ConnectionStatus.connected:
        return 'Connected';
    }
  }
}
