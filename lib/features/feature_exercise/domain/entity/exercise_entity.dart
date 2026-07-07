import 'package:equatable/equatable.dart';

import '../enums/equipment_type.dart';
import '../enums/exercise_difficulty.dart';
import '../enums/muscle_group.dart';

class ExerciseEntity extends Equatable {
  final String id;
  final String name;
  final String? description;
  final String image;
  final String? video;
  final MuscleGroup primaryMuscle;
  final List<MuscleGroup> secondaryMuscles;
  final Equipment equipmentType;
  final ExerciseDifficulty difficulty;
  final bool requiresEquipment;
  final bool isFavorite;
  final bool isPremium;

  const ExerciseEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.video,
    required this.primaryMuscle,
    required this.secondaryMuscles,
    required this.equipmentType,
    required this.difficulty,
    required this.requiresEquipment,
    required this.isFavorite,
    required this.isPremium,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        video,
        primaryMuscle,
        secondaryMuscles,
        equipmentType,
        difficulty,
        requiresEquipment,
        isFavorite,
        isPremium,
      ];
}
