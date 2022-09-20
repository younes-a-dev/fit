import 'package:flutter/material.dart';

class HomeAndClubCategoryModel {
  final String title;
  final String image;
  final int exerciseTime;
  final int exerciseCount;

  //final Widget exerciseDifficulty;

  HomeAndClubCategoryModel(
    this.title,
    this.image,
    this.exerciseTime,
    this.exerciseCount,
    //this.exerciseDifficulty,
  );
}

List<HomeAndClubCategoryModel> homeBeginnerCategory = [
  HomeAndClubCategoryModel('Full Body', 'assets/images/workout1.jpg', 17, 10),
  HomeAndClubCategoryModel('Upper', 'assets/images/workout2.jpg', 12, 8),
  HomeAndClubCategoryModel('Lower', 'assets/images/workout3.jpg', 15, 20),
  HomeAndClubCategoryModel('ABS', 'assets/images/workout4.jpg', 17, 10),
  HomeAndClubCategoryModel('Chest', 'assets/images/workout5.jpg', 17, 10),
  HomeAndClubCategoryModel('Leg', 'assets/images/workout6.jpg', 17, 10),
  HomeAndClubCategoryModel(
      'Arm and shoulder', 'assets/images/workout7.jpg', 17, 10),
];

List<HomeAndClubCategoryModel> homeIntermediateCategory = [
  HomeAndClubCategoryModel('Full Body', 'assets/images/workout1.jpg', 20, 20),
  HomeAndClubCategoryModel('Upper', 'assets/images/workout2.jpg', 20, 20),
  HomeAndClubCategoryModel('Lower', 'assets/images/workout3.jpg', 20, 20),
  HomeAndClubCategoryModel('ABS', 'assets/images/workout4.jpg', 20, 20),
  HomeAndClubCategoryModel('Chest', 'assets/images/workout5.jpg', 20, 20),
  HomeAndClubCategoryModel('Leg', 'assets/images/workout6.jpg', 20, 20),
  HomeAndClubCategoryModel(
      'Arm and shoulder', 'assets/images/workout7.jpg', 20, 20),
];
List<HomeAndClubCategoryModel> homeAdvancedCategory = [
  HomeAndClubCategoryModel('Full Body', 'assets/images/workout1.jpg', 30, 30),
  HomeAndClubCategoryModel('Upper', 'assets/images/workout2.jpg', 30, 30),
  HomeAndClubCategoryModel('Lower', 'assets/images/workout3.jpg', 30, 30),
  HomeAndClubCategoryModel('ABS', 'assets/images/workout4.jpg', 30, 30),
  HomeAndClubCategoryModel('Chest', 'assets/images/workout5.jpg', 30, 30),
  HomeAndClubCategoryModel('Leg', 'assets/images/workout6.jpg', 30, 30),
  HomeAndClubCategoryModel(
      'Arm and shoulder', 'assets/images/workout7.jpg', 30, 30),
];

List<HomeAndClubCategoryModel> clubBeginnerCategory = [
  HomeAndClubCategoryModel('Full Body', 'assets/images/workout1.jpg', 40, 10),
  HomeAndClubCategoryModel('Upper', 'assets/images/workout2.jpg', 44, 8),
  HomeAndClubCategoryModel('Lower', 'assets/images/workout3.jpg', 44, 20),
  HomeAndClubCategoryModel('ABS', 'assets/images/workout4.jpg', 44, 10),
  HomeAndClubCategoryModel('Chest', 'assets/images/workout5.jpg', 44, 10),
  HomeAndClubCategoryModel('Leg', 'assets/images/workout6.jpg', 44, 10),
  HomeAndClubCategoryModel(
      'Arm and shoulder', 'assets/images/workout7.jpg', 17, 10),
];

List<HomeAndClubCategoryModel> clubIntermediateCategory = [
  HomeAndClubCategoryModel('Full Body', 'assets/images/workout1.jpg', 44, 10),
  HomeAndClubCategoryModel('Upper', 'assets/images/workout2.jpg', 44, 8),
  HomeAndClubCategoryModel('Lower', 'assets/images/workout3.jpg', 44, 20),
  HomeAndClubCategoryModel('ABS', 'assets/images/workout4.jpg', 44, 10),
  HomeAndClubCategoryModel('Chest', 'assets/images/workout5.jpg', 44, 10),
  HomeAndClubCategoryModel('Leg', 'assets/images/workout6.jpg', 44, 10),
  HomeAndClubCategoryModel(
      'Arm and shoulder', 'assets/images/workout7.jpg', 44, 10),
];

List<HomeAndClubCategoryModel> clubAdvancedCategory = [
  HomeAndClubCategoryModel('Full Body', 'assets/images/workout1.jpg', 45, 10),
  HomeAndClubCategoryModel('Upper', 'assets/images/workout2.jpg', 45, 8),
  HomeAndClubCategoryModel('Lower', 'assets/images/workout3.jpg', 45, 20),
  HomeAndClubCategoryModel('ABS', 'assets/images/workout4.jpg', 45, 10),
  HomeAndClubCategoryModel('Chest', 'assets/images/workout5.jpg', 45, 10),
  HomeAndClubCategoryModel('Leg', 'assets/images/workout6.jpg', 45, 10),
  HomeAndClubCategoryModel(
      'Arm and shoulder', 'assets/images/workout7.jpg', 45, 10),
];
