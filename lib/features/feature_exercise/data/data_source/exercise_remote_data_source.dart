import 'package:dio/dio.dart';

import '../../../../core/config/app_config.dart';
import '../../../../core/constants/api_urls.dart';
import '../../../../core/error/api_response_validator.dart';
import '../../../../core/error/exception_mapper.dart';
import '../../../../core/network/dio_client.dart';
import '../../domain/enums/equipment_type.dart';
import '../../domain/enums/exercise_difficulty.dart';
import '../../../../common/params/exercise_query.dart';
import '../../domain/enums/muscle_group.dart';
import '../model/exercise_model.dart';

abstract class ExerciseRemoteDataSource {
  Future<List<ExerciseModel>> getExercises({ExerciseQuery? query});

  Future<ExerciseModel> getExerciseDetails(String exerciseId);
}

class ExerciseRemoteDataSourceImpl implements ExerciseRemoteDataSource {
  final DioClient _dio;

  ExerciseRemoteDataSourceImpl(this._dio);

  @override
  Future<ExerciseModel> getExerciseDetails(String exerciseId) async {
    if (AppConfig.useMock) {
      return mockExercises.firstWhere((e) => e.id == exerciseId);
    }
    try {
      final response = await _dio.get('${ApiUrls.exerciseDetail}/$exerciseId');
      validateApiResponse(response.data);
      return ExerciseModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }

  @override
  Future<List<ExerciseModel>> getExercises({ExerciseQuery? query}) async {
    if (AppConfig.useMock) {
      Iterable<ExerciseModel> data = mockExercises;

      if (query?.search != null) {
        data = data.where(
          (e) => e.name.toLowerCase().contains(query!.search!.toLowerCase()),
        );
      }

      if (query?.muscle != null) {
        data = data.where(
          (e) =>
              e.primaryMuscle == query!.muscle ||
              e.secondaryMuscles.contains(query.muscle),
        );
      }

      if (query?.equipment != null) {
        data = data.where(
          (e) => e.equipmentType == query!.equipment,
        );
      }

      if (query?.difficulty != null) {
        data = data.where(
          (e) => e.difficulty == query!.difficulty,
        );
      }

      if (query?.needEquipment != null) {
        data = data.where(
          (e) => e.requiresEquipment == query!.needEquipment,
        );
      }
      return data.toList();
    }
    try {
      final response =
          await _dio.get(ApiUrls.getExercises, queryParameters: query?.toMap());
      validateApiResponse(response.data);
      return (response.data["data"] as List)
          .map(
            (e) => ExerciseModel.fromJson(e),
          )
          .toList();
    } on DioException catch (e) {
      throw mapDioExceptionToException(e);
    }
  }
}

List<ExerciseModel> mockExercises = [
  const ExerciseModel(
    id: '1',
    name: 'Bench Press',
    description:
        'Compound exercise targeting the chest, shoulders, and triceps',
    image: 'assets/images/Archer-Push-Up.gif',
    video: null,
    primaryMuscle: MuscleGroup.chest,
    secondaryMuscles: [MuscleGroup.triceps, MuscleGroup.shoulders],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.intermediate,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '2',
    name: 'Barbell Bent Over Row',
    description: 'Compound exercise targeting the back and biceps',
    image: 'assets/images/Barbell-Bent-Over-Row.gif',
    video: null,
    primaryMuscle: MuscleGroup.back,
    secondaryMuscles: [MuscleGroup.biceps, MuscleGroup.shoulders],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.intermediate,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '3',
    name: 'Barbell Clean and Press',
    description: 'Full body Olympic weightlifting movement',
    image: 'assets/images/Barbell-Clean-and-Press.gif',
    video: null,
    primaryMuscle: MuscleGroup.fullBody,
    secondaryMuscles: [
      MuscleGroup.shoulders,
      MuscleGroup.glutes,
      MuscleGroup.quadriceps
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.advanced,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '4',
    name: 'Barbell Hang Clean',
    description: 'Olympic weightlifting exercise for explosive power',
    image: 'assets/images/Barbell-Hang-Clean.gif',
    video: null,
    primaryMuscle: MuscleGroup.olympic,
    secondaryMuscles: [
      MuscleGroup.glutes,
      MuscleGroup.quadriceps,
      MuscleGroup.shoulders
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.advanced,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '5',
    name: 'Barbell Heaving Snatch Balance',
    description: 'Advanced Olympic lifting movement for stability and power',
    image: 'assets/images/Barbell-Heaving-Snatch-Balance.gif',
    video: null,
    primaryMuscle: MuscleGroup.shoulders,
    secondaryMuscles: [
      MuscleGroup.olympic,
      MuscleGroup.back,
      MuscleGroup.glutes
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.advanced,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '6',
    name: 'Barbell Muscle Snatch',
    description:
        'Olympic weightlifting movement for explosive upper body power',
    image: 'assets/images/Barbell-Muscle-Snatch.gif',
    video: null,
    primaryMuscle: MuscleGroup.olympic,
    secondaryMuscles: [
      MuscleGroup.shoulders,
      MuscleGroup.back,
      MuscleGroup.glutes
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.intermediate,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '7',
    name: 'Barbell Power Snatch',
    description: 'Olympic weightlifting movement for explosive full body power',
    image: 'assets/images/Barbell-Power-Snatch.gif',
    video: null,
    primaryMuscle: MuscleGroup.fullBody,
    secondaryMuscles: [
      MuscleGroup.glutes,
      MuscleGroup.quadriceps,
      MuscleGroup.shoulders
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.beginner,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '8',
    name: 'Barbell Snatch',
    description: 'Classic Olympic weightlifting movement for full body power',
    image: 'assets/images/Barbell-Snatch.gif',
    video: null,
    primaryMuscle: MuscleGroup.olympic,
    secondaryMuscles: [
      MuscleGroup.fullBody,
      MuscleGroup.shoulders,
      MuscleGroup.glutes
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.beginner,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '9',
    name: 'Battle Rope',
    description: 'High intensity cardio and shoulder endurance exercise',
    image: 'assets/images/Battle-Rope.gif',
    video: null,
    primaryMuscle: MuscleGroup.cardio,
    secondaryMuscles: [MuscleGroup.shoulders, MuscleGroup.back],
    equipmentType: Equipment.other,
    difficulty: ExerciseDifficulty.advanced,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '10',
    name: 'Barbell Power Snatch',
    description: 'Olympic weightlifting movement for explosive full body power',
    image: 'assets/images/Barbell-Power-Snatch.gif',
    video: null,
    primaryMuscle: MuscleGroup.fullBody,
    secondaryMuscles: [
      MuscleGroup.glutes,
      MuscleGroup.quadriceps,
      MuscleGroup.shoulders
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.beginner,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '11',
    name: 'Barbell Snatch',
    description: 'Classic Olympic weightlifting movement for full body power',
    image: 'assets/images/Barbell-Snatch.gif',
    video: null,
    primaryMuscle: MuscleGroup.olympic,
    secondaryMuscles: [
      MuscleGroup.fullBody,
      MuscleGroup.shoulders,
      MuscleGroup.glutes
    ],
    equipmentType: Equipment.barbell,
    difficulty: ExerciseDifficulty.beginner,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
  const ExerciseModel(
    id: '12',
    name: 'Battle Rope',
    description: 'High intensity cardio and shoulder endurance exercise',
    image: 'assets/images/Battle-Rope.gif',
    video: null,
    primaryMuscle: MuscleGroup.cardio,
    secondaryMuscles: [MuscleGroup.shoulders, MuscleGroup.back],
    equipmentType: Equipment.other,
    difficulty: ExerciseDifficulty.advanced,
    requiresEquipment: true,
    isFavorite: false,
    isPremium: false,
  ),
];
