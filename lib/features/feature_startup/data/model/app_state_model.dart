import '../../domain/entity/app_state_entity.dart';

class AppStateModel extends AppStateEntity {
  const AppStateModel({
    required bool hasUpdate,
    required bool isUpdateForced,
    required bool isServiceAvailable,
    required String latestVersion,
    required String minVersion,
  }) : super(
            hasUpdate: hasUpdate,
            isUpdateForced: isUpdateForced,
            isServerAvailable: isServiceAvailable,
            latestVersion: latestVersion,
            minVersion: minVersion);

  factory AppStateModel.fromJson(Map<String, dynamic> json) {
    return AppStateModel(
      hasUpdate: json['has_update'] ?? false,
      isUpdateForced: json['is_updated_forced'] ?? false,
      isServiceAvailable: json['is_service_available'] ?? false,
      latestVersion: json['latest_version'] ?? '',
      minVersion: json['min_version'] ?? '',
    );
  }
}
