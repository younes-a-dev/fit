import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';

import '../provider/exercise.dart';
import '../res/colors.dart';

class HomeExerciseItem extends StatelessWidget {
  final String title;
  final String image;
  final Muscle muscle;

  HomeExerciseItem(this.title, this.image, this.muscle);

  String get muscleText {
    switch (muscle) {
      case Muscle.AllMuscles:
        return 'All Muscles';
      case Muscle.Abdominals:
        return 'Abdominals';
      case Muscle.Abductors:
        return 'Abductors';
      case Muscle.Adductors:
        return 'Adductors';
      case Muscle.LowerBack:
        return 'Lower Back';
      case Muscle.UpperBack:
        return 'Upper Back';
      case Muscle.Biceps:
        return 'Biceps';
      case Muscle.Cardio:
        return 'Cardio';
      case Muscle.Chest:
        return 'Chest';
      case Muscle.Calves:
        return 'Calves';
      case Muscle.Forearms:
        return 'Forearms';
      case Muscle.Glutes:
        return 'Glutes';
      case Muscle.Hamstrings:
        return 'Hamstring';
      case Muscle.Lats:
        return 'Lats';
      case Muscle.Shoulders:
        return 'Shoulders';
      case Muscle.Traps:
        return 'Traps';
      case Muscle.Triceps:
        return 'Triceps';
      case Muscle.Quadriceps:
        return 'Quadriceps';
      case Muscle.Olympic:
        return 'Olympic';
      case Muscle.FullBody:
        return 'Full Body';
      case Muscle.Other:
        return 'Unknown';
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
                      const Divider(),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                color: MyColors.black,
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
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  //TODO: inja bayad ok beshe
                                  muscleText,
                                  style: const TextStyle(
                                    color: MyColors.grey,
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
                                    color: MyColors.grey,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  //TODO: inja bayad ok beshe
                                  muscleText,
                                  style: const TextStyle(
                                    color: MyColors.grey,
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
      child: Row(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 11 - 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              border: Border.all(color: MyColors.grey, width: 1),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(90),
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Gap(15),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style:  TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(10),
                Row(
                  children: [
                    const Text(
                      '4 Set',
                      style: TextStyle(
                        color: MyColors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    const Gap(30),
                    Text(
                      muscleText,
                      style: const TextStyle(
                        color: MyColors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon:  const Icon(Icons.arrow_right,color: MyColors.mainColor,),
          )
        ],
      ),
    );
  }
}
