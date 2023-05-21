import 'package:flutter/material.dart';

enum EquipmentType {
  AllEquipments,
  NoEquipment,
  Barbell,
  Dumbbell,
  Kettlebell,
  Machine,
  Plate,
  ResistanceBand,
  SuspensionBand,
  Other,
}

enum Muscle {
  AllMuscles,
  Abdominals,
  Abductors,
  Adductors,
  LowerBack,
  UpperBack,
  Biceps,
  Cardio,
  Chest,
  Calves,
  Forearms,
  Glutes,
  Hamstrings,
  Lats,
  Shoulders,
  Traps,
  Triceps,
  Quadriceps,
  Olympic,
  FullBody,
  Other,
}

enum Difficulty {
  basic,
  intermediate,
  advance,
}

class Exercise {
  final String id;
  final String name;
  final String image;
  final bool needEquipment;
  bool isSelected = false;
  final EquipmentType equipmentType;
  final Muscle muscle;
  final Difficulty difficulty;

  Exercise(
    this.id,
    this.name,
    this.image,
    this.needEquipment,
    this.isSelected,
    this.equipmentType,
    this.muscle,
    this.difficulty,
  );
}

class Exercises with ChangeNotifier {
  List<Exercise> _items = [
    Exercise(
      '1',
      'BENCH PRESS',
      'assets/images/Archer-Push-Up.gif',
      true,
      false,
      EquipmentType.Barbell,
      Muscle.Chest,
      Difficulty.intermediate,
    ),
    Exercise(
      '2',
      'Barbell Bent Over Row',
      'assets/images/Barbell-Bent-Over-Row.gif',
      true,
      false,
      EquipmentType.ResistanceBand,
      Muscle.FullBody,
      Difficulty.advance,
    ),
    Exercise(
      '3',
      'Barbell Clean and Press',
      'assets/images/Barbell-Clean-and-Press.gif',
      true,
      false,
      EquipmentType.Kettlebell,
      Muscle.FullBody,
      Difficulty.advance,
    ),
    Exercise(
      '4',
      'Barbell Hang Clean',
      'assets/images/Barbell-Hang-Clean.gif',
      true,
      false,
      EquipmentType.Machine,
      Muscle.Olympic,
      Difficulty.advance,
    ),
    Exercise(
      '5',
      'Barbell Heaving Snatch Balance',
      'assets/images/Barbell-Heaving-Snatch-Balance.gif',
      true,
      false,
      EquipmentType.Plate,
      Muscle.Triceps,
      Difficulty.advance,
    ),
    Exercise(
      '6',
      'Barbell Muscle Snatch',
      'assets/images/Barbell-Muscle-Snatch.gif',
      true,
      false,
      EquipmentType.SuspensionBand,
      Muscle.FullBody,
      Difficulty.intermediate,
    ),
    Exercise(
      '7',
      'Barbell Power Snatch',
      'assets/images/Barbell-Power-Snatch.gif',
      true,
      false,
      EquipmentType.Dumbbell,
      Muscle.FullBody,
      Difficulty.basic,
    ),
    Exercise(
      '8',
      'Barbell Snatch',
      'assets/images/Barbell-Snatch.gif',
      true,
      false,
      EquipmentType.Barbell,
      Muscle.FullBody,
      Difficulty.basic,
    ),
    Exercise(
      '9',
      'Battle Rope',
      'assets/images/Battle-Rope.gif',
      true,
      false,
      EquipmentType.Plate,
      Muscle.FullBody,
      Difficulty.advance,
    ),
    Exercise(
      '10',
      'Barbell Power Snatch',
      'assets/images/Barbell-Power-Snatch.gif',
      true,
      false,
      EquipmentType.Barbell,
      Muscle.FullBody,
      Difficulty.basic,
    ),
    Exercise(
      '11',
      'Barbell Snatch',
      'assets/images/Barbell-Snatch.gif',
      true,
      false,
      EquipmentType.Barbell,
      Muscle.FullBody,
      Difficulty.basic,
    ),
    Exercise(
      '12',
      'Battle Rope',
      'assets/images/Battle-Rope.gif',
      true,
      false,
      EquipmentType.Barbell,
      Muscle.FullBody,
      Difficulty.advance,
    ),
  ];

  List<Exercise> get items {
    return [..._items];
  }

// Future<void> getExercise() async {
//   var url =
//       Uri.parse('https://flutterapp-4c45e-default-rtdb.firebaseio.com/');
//       try{
//         final response = await http.get(url);
//         final extractedData = json.decode(response.body) as Map<String,dynamic>;
//       }catch{

//       }
// }

}

