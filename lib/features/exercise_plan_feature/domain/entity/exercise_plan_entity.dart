import 'package:equatable/equatable.dart';

import '../../../feature_exercise/domain/enums/muscle_group.dart';
import 'enums/plan_category.dart';
import 'enums/plan_difficulty.dart';
import 'enums/plan_source.dart';
import 'enums/workout_location.dart';
import 'workout_day_entity.dart';

class ExercisePlanEntity extends Equatable {
  final String id;
  final String title;
  final String coachName;
  final String coachAvatar;
  final String description;
  final String coverImage;
  final PlanCategory category;
  final PlanDifficulty difficulty;
  final WorkoutLocation location;
  final PlanSource source;

  // final BodyPart bodyPart;
  final List<MuscleGroup> targetMuscles;
  final int sessionsPerWeek;
  final bool isBookmarked;
  final bool isCurrentPlan;
  final bool isPremium;
  final int estimatedDuration;
  final List<WorkoutDayEntity> days;
  final double rating;
  final int reviewCount;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  const ExercisePlanEntity({
    required this.id,
    required this.title,
    required this.coachName,
    required this.coachAvatar,
    required this.description,
    required this.coverImage,
    required this.category,
    required this.difficulty,
    required this.location,
    required this.source,
    // required this.bodyPart,
    required this.targetMuscles,
    required this.sessionsPerWeek,
    required this.isBookmarked,
    required this.isCurrentPlan,
    required this.estimatedDuration,
    required this.isPremium,
    required this.days,
    required this.rating,
    required this.reviewCount,
    required this.tags,
    required this.createdAt,
    required this.updatedAt,
  });

  ExercisePlanEntity copyWith({
    String? id,
    String? title,
    String? coachName,
    String? coachAvatar,
    String? description,
    String? coverImage,
    PlanCategory? category,
    PlanDifficulty? difficulty,
    WorkoutLocation? location,
    PlanSource? source,
    List<MuscleGroup>? targetMuscles,
    int? sessionsPerWeek,
    bool? isBookmarked,
    bool? isCurrentPlan,
    bool? isPremium,
    int? estimatedDuration,
    List<WorkoutDayEntity>? days,
    double? rating,
    int? reviewCount,
    List<String>? tags,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return ExercisePlanEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      coachName: coachName ?? this.coachName,
      coachAvatar: coachAvatar ?? this.coachAvatar,
      description: description ?? this.description,
      coverImage: coverImage ?? this.coverImage,
      difficulty: difficulty ?? this.difficulty,
      location: location ?? this.location,
      source: source ?? this.source,
      targetMuscles: targetMuscles ?? this.targetMuscles,
      sessionsPerWeek: sessionsPerWeek ?? this.sessionsPerWeek,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isCurrentPlan: isCurrentPlan ?? this.isCurrentPlan,
      estimatedDuration: estimatedDuration ?? this.estimatedDuration,
      isPremium: isPremium ?? this.isPremium,
      createdAt: createdAt ?? this.createdAt,
      days: days ?? this.days,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      tags: tags ?? this.tags,
      updatedAt: updatedAt ?? this.updatedAt,
      category: category ?? this.category,
    );
  }

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        coverImage,
        category,
        difficulty,
        location,
        source,
        // bodyPart,
        targetMuscles,
        sessionsPerWeek,
        isBookmarked,
        isCurrentPlan,
        estimatedDuration,
        days,
        isPremium,
        createdAt,
        updatedAt,
      ];
}
