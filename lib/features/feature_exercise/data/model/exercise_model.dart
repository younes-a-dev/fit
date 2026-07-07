import '../../domain/enums/equipment_type.dart';
import '../../domain/enums/exercise_difficulty.dart';
import '../../domain/entity/exercise_entity.dart';
import '../../domain/enums/muscle_group.dart';

class ExerciseModel extends ExerciseEntity {
  const ExerciseModel({
    required super.id,
    required super.name,
    super.description,
    required super.image,
    super.video,
    required super.primaryMuscle,
    required super.secondaryMuscles,
    required super.equipmentType,
    required super.difficulty,
    required super.requiresEquipment,
    required super.isFavorite,
    required super.isPremium,
  });

  factory ExerciseModel.fromJson(Map<String, dynamic> json) {
    return ExerciseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'] ?? '',
      image: json['image_url'],
      video: json['video_url'],
      primaryMuscle: MuscleGroup.values.firstWhere(
        (e) => e.name == json['primary_muscle'],
        orElse: () => MuscleGroup.fullBody,
      ),
      secondaryMuscles: (json['secondary_muscles'] as List? ?? [])
          .map(
            (e) => MuscleGroup.values.firstWhere(
              (m) => m.name == e,
              orElse: () => MuscleGroup.fullBody,
            ),
          )
          .toList(),
      equipmentType: Equipment.values.firstWhere(
        (e) => e.name == json['equipment_type'],
        orElse: () => Equipment.other,
      ),
      difficulty: ExerciseDifficulty.values.firstWhere(
        (e) => e.name == json['difficulty'],
        orElse: () => ExerciseDifficulty.intermediate,
      ),
      requiresEquipment: json['requires_equipment'],
      isFavorite: json['is_favorite'] ?? false,
      isPremium: json['is_premium'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image_url': image,
      'video_url': video,
      'primary_muscle': primaryMuscle.name,
      'secondary_muscles': secondaryMuscles.map((e) => e.name).toList(),
      'equipment_type': equipmentType.name,
      'difficulty': difficulty.name,
      'requires_equipment': requiresEquipment,
    };
  }
}
