import 'package:flutter/material.dart';
import 'package:workout/model/menu_item_model.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

import '../res/colors.dart';

class MenuItem {
  //profile screen, edit profile and settings item
  static const List<ProfileMenuItemModel> firstItems = [
    itemEditProfile,
    // itemSettings,
  ];

  //profile screen, manage subscription and about us items
  static const List<ProfileMenuItemModel> secondItems = [
    itemManageSubscription,
    // itemAboutUs,
  ];

  //profile screen, log out item
  static const List<ProfileMenuItemModel> thirdItems = [
    itemLogOut,
  ];
  static const List<CreatePlanMenuItemModel> selectEquipmentItems = [
    allEquipments,
    noEquipment,
    barbell,
    dumbbell,
    kettlebell,
    machine,
    plate,
    resistanceBand,
    suspensionBand,
    other,
  ];

  static const List<CreatePlanMenuItemModel> selectMuscleItems = [
    allMuscles,
    abdominals,
    abductors,
    adductors,
    lowerBack,
    upperBack,
    biceps,
    cardio,
    chest,
    calves,
    forearms,
    glutes,
    hamstrings,
    lats,
    shoulders,
    traps,
    triceps,
    quadriceps,
    olympic,
    fullBody,
    others,
  ];

  static const List<ChooseFirsDayItemModel> chooseFirsDay = [
    monday,
    saturday,
    sunday,
  ];

  static const List<CreateCustomPlanMenuItemModel> createPlanKind = [
    createPlan,
    takePlan,
  ];

  // for choose first day
  static const monday = ChooseFirsDayItemModel('Monday');
  static const saturday = ChooseFirsDayItemModel('Saturday');
  static const sunday = ChooseFirsDayItemModel('Sunday');

// for choose create plan kind
  static const createPlan =
      CreateCustomPlanMenuItemModel(text: 'Create Plan', icon: Icons.add);
  static const takePlan = CreateCustomPlanMenuItemModel(
      text: 'Take Plan', icon: flu.FluentIcons.hexagon);

  // for profile screen items
  static const itemEditProfile =
      ProfileMenuItemModel(text: 'Edit Profile', icon: Icons.edit_outlined);
  static const itemSettings =
      ProfileMenuItemModel(text: 'Settings', icon: Icons.settings_outlined);
  static const itemManageSubscription = ProfileMenuItemModel(
      text: 'Manage\nSubscription',
      icon: flu.FluentIcons.hexagon,
      iconColor: MyColors.mainColor);
  static const itemAboutUs = ProfileMenuItemModel(text: 'About Us');
  static const itemLogOut =
      ProfileMenuItemModel(text: 'Log Out', icon: Icons.logout_outlined);

  // for create plan items (Equipment item)
  static const allEquipments = CreatePlanMenuItemModel(text: 'All ');
  static const noEquipment = CreatePlanMenuItemModel(text: 'No Equipment');
  static const barbell = CreatePlanMenuItemModel(text: 'Barbell');
  static const dumbbell = CreatePlanMenuItemModel(text: 'Dumbbell');
  static const kettlebell = CreatePlanMenuItemModel(text: 'Kettlebell');
  static const machine = CreatePlanMenuItemModel(text: 'Machine');
  static const plate = CreatePlanMenuItemModel(text: 'Plate');
  static const resistanceBand = CreatePlanMenuItemModel(text: 'ResistanceBand');
  static const suspensionBand = CreatePlanMenuItemModel(text: 'SuspensionBand');
  static const other = CreatePlanMenuItemModel(text: 'Other');

  // for create plan items (Muscles item)
  static const allMuscles = CreatePlanMenuItemModel(text: 'All ');
  static const abdominals = CreatePlanMenuItemModel(text: 'Abdominals');
  static const abductors = CreatePlanMenuItemModel(text: 'Abductors');
  static const adductors = CreatePlanMenuItemModel(text: 'Adductors');
  static const lowerBack = CreatePlanMenuItemModel(text: 'Lower Back');
  static const upperBack = CreatePlanMenuItemModel(text: 'Upper Back');
  static const biceps = CreatePlanMenuItemModel(text: 'Biceps');
  static const cardio = CreatePlanMenuItemModel(text: 'Cardio');
  static const chest = CreatePlanMenuItemModel(text: 'Chest');
  static const calves = CreatePlanMenuItemModel(text: 'Calves');
  static const forearms = CreatePlanMenuItemModel(text: 'Forearms');
  static const glutes = CreatePlanMenuItemModel(text: 'Glutes');
  static const hamstrings = CreatePlanMenuItemModel(text: 'Hamstrings');
  static const lats = CreatePlanMenuItemModel(text: 'Lats');
  static const shoulders = CreatePlanMenuItemModel(text: 'Shoulders');
  static const traps = CreatePlanMenuItemModel(text: 'Traps');
  static const triceps = CreatePlanMenuItemModel(text: 'Triceps');
  static const quadriceps = CreatePlanMenuItemModel(text: 'Quadriceps');
  static const olympic = CreatePlanMenuItemModel(text: 'Olympic');
  static const fullBody = CreatePlanMenuItemModel(text: 'Full Body');
  static const others = CreatePlanMenuItemModel(text: 'Other');

// allMuscles,
// abdominals,
// abductors,
// adductors,
// lowerBack,
// upperBack,
// biceps,
// cardio,
// chest,
// calves,
// forearms,
// glutes,
// hamstrings,
// lats,
// shoulders,
// traps,
// triceps,
// quadriceps,
// olympic,
// fullBody,
// other,
}
