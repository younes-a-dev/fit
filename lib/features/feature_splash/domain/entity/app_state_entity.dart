import 'package:equatable/equatable.dart';

class AppStateEntity extends Equatable {
  final bool hasUpdate;
  final bool isUpdateForced;
  final bool isServerAvailable;
  final String latestVersion;
  final String minVersion;

  const AppStateEntity({
    required this.hasUpdate,
    required this.isUpdateForced,
    required this.isServerAvailable,
    required this.latestVersion,
    required this.minVersion,
  });

  @override
  List<Object?> get props => [
        hasUpdate,
        isServerAvailable,
        isUpdateForced,
        latestVersion,
        minVersion,
      ];
}
