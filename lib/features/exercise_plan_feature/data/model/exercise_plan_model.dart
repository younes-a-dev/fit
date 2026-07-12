import '../../../feature_exercise/domain/enums/muscle_group.dart';
import '../../domain/entity/enums/plan_category.dart';
import '../../domain/entity/enums/plan_difficulty.dart';
import '../../domain/entity/enums/plan_source.dart';
import '../../domain/entity/enums/workout_location.dart';
import '../../domain/entity/exercise_plan_entity.dart';
import 'workout_day_model.dart';

class ExercisePlanModel extends ExercisePlanEntity {
  const ExercisePlanModel({
    required super.id,
    required super.title,
    required super.coachName,
    required super.coachAvatar,
    required super.description,
    required super.coverImage,
    required super.category,
    required super.difficulty,
    required super.location,
    required super.source,
    // required super.bodyPart,
    required super.targetMuscles,
    required super.sessionsPerWeek,
    required super.isBookmarked,
    required super.isCurrentPlan,
    required super.estimatedDuration,
    required super.isPremium,
    required super.days,
    required super.rating,
    required super.reviewCount,
    required super.tags,
    required super.createdAt,
    required super.updatedAt,
  });

  factory ExercisePlanModel.fromJson(Map<String, dynamic> json) {
    return ExercisePlanModel(
      id: json['id'],
      title: json['title'],
      coachName: json['coach_name'] ?? '',
      coachAvatar: json['coach_avatar'] ?? '',
      description: json['description'] ?? '',
      coverImage: json['cover_image'] ?? '',
      category: PlanCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => PlanCategory.bodybuilding,
      ),
      difficulty: PlanDifficulty.values.firstWhere(
        (e) => e.name == json['difficulty'],
        orElse: () => PlanDifficulty.intermediate,
      ),
      location: WorkoutLocation.values.firstWhere(
        (e) => e.name == json['location'],
        orElse: () => WorkoutLocation.gym,
      ),
      source: PlanSource.values.firstWhere(
        (e) => e.name == json['source'],
        orElse: () => PlanSource.official,
      ),
      targetMuscles: (json['target_muscles'] as List)
          .map(
            (e) => MuscleGroup.values.firstWhere((m) => m.name == e,
                orElse: () => MuscleGroup.fullBody),
          )
          .toList(),
      sessionsPerWeek: json['sessions_per_week'] ?? 3,
      isBookmarked: json['is_bookmarked'] ?? false,
      isCurrentPlan: json['is_current_plan'] ?? false,
      estimatedDuration: json['estimated_duration'] ?? 30,
      isPremium: json['is_premium'] ?? false,
      days: (json['days'] as List? ?? [])
          .map((e) => WorkoutDayModel.fromJson(e))
          .toList(),
      rating: json['rating'] ?? 0.0,
      reviewCount: json['review_count'] ?? 0,
      tags: json['tags'] as List<String> ?? [],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cover_image': coverImage,
      'category': category.name,
      'difficulty': difficulty.name,
      'location': location.name,
      'source': source.name,
      // 'body_part': bodyPart.name,
      'target_muscles' : targetMuscles.map((e)=> e.name).toList(),
      'sessions_per_week': sessionsPerWeek,
      'is_bookmarked': isBookmarked,
      'is_current_plan': isCurrentPlan,
      'estimated_duration': estimatedDuration,
      'is_premium': isPremium,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'rating' : rating,
      'reviewCount' : reviewCount,
      'days': days.map((e) => (e as WorkoutDayModel).toJson()).toList(),
    };
  }
}
