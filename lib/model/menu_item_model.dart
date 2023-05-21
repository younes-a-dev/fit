import 'package:flutter/material.dart';

class ProfileMenuItemModel {
  final String text;
  final IconData? icon;
  final Color? iconColor;

  const ProfileMenuItemModel({required this.text, this.icon, this.iconColor});
}

class CreatePlanMenuItemModel {
  final String text;

  const CreatePlanMenuItemModel({required this.text});
}

class CreateCustomPlanMenuItemModel {
  final String text;
  final IconData? icon;

  // final Color? iconColor;
  const CreateCustomPlanMenuItemModel({required this.text, this.icon});
}

class ChooseFirsDayItemModel {
  final String title;

  const ChooseFirsDayItemModel(this.title);
}
