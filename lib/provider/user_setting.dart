import 'package:flutter/material.dart';
import 'package:workout/model/session_model.dart';
import 'package:workout/provider/plan.dart';
import 'package:workout/model/workout_history_model.dart';

enum FirstWeekDay {
  monday,
  saturday,
  sunday,
}

enum UserGender {
  male,
  female,
}

enum UserMainGoal {
  loseWeight,
  buildMuscle,
  keepFit,
}

enum UserWorkoutLocation {
  home,
  gym,
}

enum UserDailyWalk {
  lessThan1Hour,
  b1_2hour,
  moreThan2Hour,
}

enum UserPushUps {
  b3_5PushUps,
  b5_10PushUps,
  b10_20PushUps,
  moreThan20,
}

enum UserBodyType {
  skinny,
  average,
  heavier,
}

enum UserTargetBodyType {
  cut,
  bulk,
  extraBulk,
}

enum UserFocusArea {
  fullBody,
  arm,
  chest,
  abs,
  leg,
}

// enum MotivatesToExercise{
//
// }

class User with ChangeNotifier {
  String? id;
  String? username;
  double? userCurrentWeight;
  double? userTargetWeight;
  double? userHeight;
  int? userAge;
  UserGender? userGender = UserGender.male;
  UserMainGoal? userMainGoal;
  UserWorkoutLocation? userWorkoutLocation;
  UserDailyWalk? userDailyWalk;
  UserPushUps? userPushUps;
  UserBodyType? userBodyType;
  UserTargetBodyType? userTargetBodyType;
  UserFocusArea? userFocusArea;
  FirstWeekDay? userFirstDay = FirstWeekDay.monday;
  int? weeklyTrainingDaysCount = 3;
  List<FirstWeekDay>? userWorkoutDays;

  //Map<String, Plan>? daysPlan;
  List<WorkoutHistoryModel>? workoutHistory;

  User({
    this.id,
    this.username,
    this.userCurrentWeight,
    this.userTargetWeight,
    this.userHeight,
    this.userAge,
    this.userGender,
    this.userMainGoal,
    this.userWorkoutLocation,
    this.userDailyWalk,
    this.userPushUps,
    this.userBodyType,
    this.userTargetBodyType,
    this.userFocusArea,
    this.userFirstDay,
    this.weeklyTrainingDaysCount,
    this.userWorkoutDays,
    // this.daysPlan,
    this.workoutHistory,
  });

  late User _user;

  User get user{
    return _user;
  }

  void updateUserWeeklyGoalInfo(User user) {
    // User xUser = User(
    //   id: user.id,
    //   username: user.username,
    //   weeklyTrainingDaysCount: user.weeklyTrainingDaysCount,
    //   userFirstDay: user.userFirstDay,
    //   userWorkoutDays: user.userWorkoutDays,
    //   userCurrentWeight: user.userCurrentWeight,
    //   userTargetWeight: user.userTargetWeight,
    //   userHeight: user.userHeight,
    //   userAge: user.userAge,
    //   userGender: user.userGender,
    //   userMainGoal: user.userMainGoal,
    //   userWorkoutLocation: user.userWorkoutLocation,
    //   userDailyWalk: user.userDailyWalk,
    //   userPushUps: user.userPushUps,
    //   userBodyType: user.userBodyType,
    //   userTargetBodyType: user.userTargetBodyType,
    //   userFocusArea: user.userFocusArea,
    //   workoutHistory: [],
    // );
    User xUser = user;
    print(user.userFirstDay);
    print(user.weeklyTrainingDaysCount);
    print(user.userCurrentWeight);
    print(user.userTargetWeight);
    print(user.userHeight);
    print(user.userAge);
    print(user.userGender);
    print(user.userMainGoal);
    print(user.userWorkoutLocation);
    print(user.userDailyWalk);
    print(user.userPushUps);
    print(user.userBodyType);
    print(user.userTargetBodyType);
    print(user.userFocusArea);
    _user = xUser;
    notifyListeners();
  }

  void addWorkoutToHistory(Plan plan,SessionModel session) {
    _user.workoutHistory!.add(
      WorkoutHistoryModel(
        id: DateTime.now().toString(),
        // planName: plan.name as String,
        plan: plan,
        session: session,
        workoutDate: DateTime.now(),
      ),
    );
    // print(_user.workoutHistory?.length);
    notifyListeners();
  }
}
