import '../../core/constants/enums.dart';

class CompleteInitialSetupParams {
  final String username;
  final Gender gender;
  final WeekStartDay weekStartDay;

  CompleteInitialSetupParams({
    required this.username,
    required this.gender,
    required this.weekStartDay,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'gender': gender.name,
      'week_start_day': weekStartDay.name,
    };
  }
}
