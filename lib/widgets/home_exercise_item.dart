import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:workout/model/exercise_step_model.dart';

class HomeExerciseItem extends StatelessWidget {
  final String title;
  final String image;
  final Muscle muscle;

  HomeExerciseItem(this.title, this.image, this.muscle);

  // String get difficultyText {
  //   switch (difficulty) {
  //     case Difficulty.basic:
  //       return 'Basic';
  //       break;
  //     case Difficulty.intermediate:
  //       return 'Intermediate';
  //       break;
  //     case Difficulty.advance:
  //       return 'Advance';
  //       break;
  //     default:
  //       return 'Unknown';
  //   }
  // }

  String get muscleText {
    switch (muscle) {
      case Muscle.allMuscles:
        return 'All Muscles';
        break;
      case Muscle.abdominals:
        return 'Abdominals';
        break;
      case Muscle.abductors:
        return 'Abductors';
        break;
      case Muscle.adductors:
        return 'Adductors';
        break;
      case Muscle.lowerBack:
        return 'Lower Back';
        break;
      case Muscle.upperBack:
        return 'Upper Back';
        break;
      case Muscle.biceps:
        return 'Biceps';
        break;
      case Muscle.cardio:
        return 'Cardio';
        break;
      case Muscle.chest:
        return 'Chest';
        break;
      case Muscle.calves:
        return 'Calves';
        break;
      case Muscle.forearms:
        return 'Forearms';
        break;
      case Muscle.glutes:
        return 'Glutes';
        break;
      case Muscle.hamstrings:
        return 'Hamstring';
        break;
      case Muscle.lats:
        return 'Lats';
        break;
      case Muscle.shoulders:
        return 'Shoulders';
        break;
      case Muscle.traps:
        return 'Traps';
        break;
      case Muscle.triceps:
        return 'Triceps';
        break;
      case Muscle.quadriceps:
        return 'Quadriceps';
        break;
      case Muscle.olympic:
        return 'Olympic';
        break;
      case Muscle.fullBody:
        return 'Full Body';
        break;
      case Muscle.other:
        return 'Unknown';
        break;
      default:
        return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Container(
                  height: 350,
                  // width: Get.size.width/2,
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, left: 25, right: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: Get.size.width / 1.5,
                        height: 200,
                        child: Image.asset(image),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xfff5f5f5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            const Gap(10),
                            Row(
                              children: [
                                const Text(
                                  'Primary: ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  muscleText,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text(
                                  'Secondary: ',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  muscleText,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
      },
      child: Container(
        //margin: const EdgeInsets.only(right: 10),
        height: Get.size.height / 8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(
                image,
                width: 100,
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(
                  left: 15,
                  top: 30,
                  bottom: 30,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Gap(10),
                    Row(
                      children: const [
                        Text(
                          '3x14',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        Gap(5),
                        Icon(
                          flu.FluentIcons.location_dot,
                          color: Colors.black87,
                          size: 20,
                        ),
                        Gap(5),
                        Text(
                          '5 min',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.only(right: 20),
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Primary: ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            muscleText,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: const [
                              Text(
                                'More',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Gap(5),
                              Icon(
                                Icons.arrow_upward_rounded,
                                size: 20,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
