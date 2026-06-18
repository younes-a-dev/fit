import 'package:equatable/equatable.dart';

class AppStateEntity extends Equatable {
  final bool hasUpdate;
  final bool isUpdateForced;
  final bool isServerAvailable;
  final bool coachFeatureEnabled;
  final bool paymentEnabled;
  final bool adsEnabled;
  final String maintenanceMessage;
  final String latestVersion;
  final String minVersion;

  const AppStateEntity({
    required this.hasUpdate,
    required this.isUpdateForced,
    required this.isServerAvailable,
    required this.coachFeatureEnabled,
    required this.paymentEnabled,
    required this.adsEnabled,
    required this.maintenanceMessage,
    required this.latestVersion,
    required this.minVersion,
  });

  @override
  List<Object?> get props => [
        hasUpdate,
        isUpdateForced,
        isServerAvailable,
        coachFeatureEnabled,
        paymentEnabled,
        adsEnabled,
        maintenanceMessage,
        latestVersion,
        minVersion,
      ];
}
