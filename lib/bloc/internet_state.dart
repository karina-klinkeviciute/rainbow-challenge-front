part of 'internet_cubit.dart';

abstract class InternetState {}

// Default/initial state
class InternetLoading extends InternetState {}

// Connected through Wifi or MobileData
class InternetConnected extends InternetState {
  final ConnectionType connectionType;

  InternetConnected({required this.connectionType});
}

class InternetDisconnected extends InternetState {}
