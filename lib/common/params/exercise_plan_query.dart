import '../../features/exercise_plan_feature/domain/entity/enums/plan_category.dart';
import '../../features/exercise_plan_feature/domain/entity/enums/plan_difficulty.dart';
import '../../features/exercise_plan_feature/domain/entity/enums/plan_source.dart';
import '../../features/exercise_plan_feature/domain/entity/enums/workout_location.dart';
import '../../features/feature_exercise/domain/enums/muscle_group.dart';

class ExercisePlanQuery {
  final String? search;
  final PlanCategory? category;
  final WorkoutLocation? location;
  final PlanDifficulty? difficulty;
  final PlanSource? source;
  final List<MuscleGroup>? targetMuscles;
  final bool? bookmarkedOnly;
  final bool? premiumOnly;
  final int? sessionsPerWeek;

  const ExercisePlanQuery({
    this.search,
    this.category,
    this.location,
    this.difficulty,
    this.source,
    this.targetMuscles,
    this.bookmarkedOnly,
    this.premiumOnly,
    this.sessionsPerWeek,
  });

  Map<String, dynamic> toMap() {
    return {
      if (search != null) "search": search,
      if(category != null) "category":category!.name,
      if (location != null) "location": location!.name,
      if (difficulty != null) "difficulty": difficulty!.name,
      if (source != null) "source": source!.name,
      if(targetMuscles != null) "target_muscles" : targetMuscles!.map((e) => e.name).toList(),
      if (bookmarkedOnly != null) "bookmarked": bookmarkedOnly,
      if (premiumOnly != null) "premium": premiumOnly,
      if (sessionsPerWeek != null) "sessions": sessionsPerWeek,
    };
  }
}
