import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/exercise_model.dart';

abstract class ExerciseLocalDataSource {
  Future<void> cacheExercises(List<ExerciseModel> exercises);
  Future<List<ExerciseModel>> getCachedExercises();
  Future<void> clearCache();
}

class ExerciseLocalDataSourceImpl implements ExerciseLocalDataSource {
  final SharedPreferences _prefs;

  ExerciseLocalDataSourceImpl(this._prefs);

  static const _exerciseKey = 'cached_exercises';

  @override
  Future<void> cacheExercises(List<ExerciseModel> exercises) async {
    final jsonList = exercises.map((e) => e.toJson()).toList();
    await _prefs.setString(_exerciseKey, jsonEncode(jsonList));
  }

  @override
  Future<void> clearCache() async {
    await _prefs.remove(_exerciseKey);
  }

  @override
  Future<List<ExerciseModel>> getCachedExercises() async {
    final jsonString = _prefs.getString(_exerciseKey);

    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);

    return decoded
        .map(
          (e) => ExerciseModel.fromJson(
            Map<String, dynamic>.from(e),
          ),
        )
        .toList();
  }
}
