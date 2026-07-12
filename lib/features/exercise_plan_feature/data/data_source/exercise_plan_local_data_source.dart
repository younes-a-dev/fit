import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/exercise_plan_model.dart';

abstract class ExercisePlanLocalDataSource {
  Future<void> cachePlans(List<ExercisePlanModel> plans);
  Future<List<ExercisePlanModel>> getCachedPlans();
  Future<void> clearCache();
}

class ExercisePlanLocalDataSourceImpl implements ExercisePlanLocalDataSource {
  final SharedPreferences _prefs;

  ExercisePlanLocalDataSourceImpl(this._prefs);

  static const _plansKey = 'cached_exercise_plans';

  @override
  Future<void> cachePlans(List<ExercisePlanModel> plans) async {
    final jsonList = plans.map((e) => e.toJson()).toList();
    await _prefs.setString(_plansKey, jsonEncode(jsonList));
  }

  @override
  Future<void> clearCache() async {
    await _prefs.remove(_plansKey);
  }

  @override
  Future<List<ExercisePlanModel>> getCachedPlans() async {
    final jsonString = _prefs.getString(_plansKey);

    if (jsonString == null) return [];

    final List<dynamic> decoded = jsonDecode(jsonString);

    return decoded
        .map(
          (e) => ExercisePlanModel.fromJson(
        Map<String, dynamic>.from(e),
      ),
    )
        .toList();
  }
}