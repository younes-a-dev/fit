import '../../domain/entity/app_state_entity.dart';

class AppStateModel extends AppStateEntity {
  const AppStateModel({
    required bool hasUpdate,
    required bool isUpdateForced,
    required bool isServiceAvailable,
    required bool coachFeatureEnabled,
    required bool paymentEnabled,
    required bool adsEnabled,
    required String maintenanceMessage,
    required String latestVersion,
    required String minVersion,
  }) : super(
            hasUpdate: hasUpdate,
            isUpdateForced: isUpdateForced,
            isServerAvailable: isServiceAvailable,
            coachFeatureEnabled: coachFeatureEnabled,
            paymentEnabled: paymentEnabled,
            adsEnabled: adsEnabled,
            maintenanceMessage: maintenanceMessage,
            latestVersion: latestVersion,
            minVersion: minVersion);

  factory AppStateModel.fromJson(Map<String, dynamic> json) {
    return AppStateModel(
      hasUpdate: json['has_update'] ?? false,
      isUpdateForced: json['is_updated_forced'] ?? false,
      isServiceAvailable: json['is_service_available'] ?? false,
      coachFeatureEnabled: json['coach_feature_enabled'] ?? false,
      paymentEnabled: json['payment_enabled'] ?? false,
      adsEnabled: json['ads_enabled'] ?? false,
      maintenanceMessage: json['maintenance_message'] ?? '',
      latestVersion: json['latest_version'] ?? '',
      minVersion: json['min_version'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'has_update': hasUpdate,
      'is_updated_forced': isUpdateForced,
      'is_service_available': isServerAvailable,
      'coach_feature_enabled': coachFeatureEnabled,
      'payment_enabled': paymentEnabled,
      'ads_enabled': adsEnabled,
      'maintenance_message': maintenanceMessage,
      'latest_version': latestVersion,
      'min_version': minVersion,
    };
  }
}
