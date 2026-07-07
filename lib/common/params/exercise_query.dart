import '../../features/feature_exercise/domain/enums/equipment_type.dart';
import '../../features/feature_exercise/domain/enums/exercise_difficulty.dart';
import '../../features/feature_exercise/domain/enums/muscle_group.dart';

class ExerciseQuery {
  final String? search;
  final MuscleGroup? muscle;
  final Equipment? equipment;
  final ExerciseDifficulty? difficulty;
  final bool? needEquipment;

  // final int page;
  // final int limit;
  // final ExerciseSort? sortBy;

  const ExerciseQuery({
    this.search,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.needEquipment,
    // this.page = 1,
    // this.limit = 20,
    // this.sortBy,
  });

  Map<String, dynamic> toMap() {
    return {
      if (search != null) "search": search,
      if (muscle != null) "muscle": muscle!.name,
      if (equipment != null) "equipment": equipment!.name,
      if (difficulty != null) "difficulty": difficulty!.name,
      if (needEquipment != null) "need_equipment": needEquipment,
      // "page": page,
      // "limit": limit,
    };
  }
}
