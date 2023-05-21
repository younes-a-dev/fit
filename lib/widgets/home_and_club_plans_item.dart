import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../model/session_model.dart';
import '../provider/exercise.dart';
import '../provider/plan.dart';
import '../res/colors.dart';
import '../screen/discover_selected_plan_detail_screen.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

class HomeAndClubPlansItem extends StatelessWidget {
  const HomeAndClubPlansItem({
    Key? key,
    required this.id,
    this.name,
    this.image,
    this.exerciseTime,
    this.exerciseCount,
    this.session,
    required this.level,
  }) : super(key: key);

  final String id;
  final String? name;
  final String? image;
  final int? exerciseTime;
  final int? exerciseCount;
  final SessionModel? session;
  final Level level;

  get sessionExercise {
    List<Exercise>? sessionExercise = session!.sessionExercises;
    return sessionExercise;
  }

  int _createDifficultyIconList() {
    int? iconCount;
    if (level == Level.beginner) {
      iconCount = 1;
    } else if (level == Level.intermediate) {
      iconCount = 2;
    } else {
      iconCount = 3;
    }
    return iconCount;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          DiscoverSelectedPlanDetailScreen.routeName,
          arguments: {
            'id': id,
            'title': name,
            'image': image,
            'exerciseTime': exerciseTime,
            'exerciseCount': exerciseCount,
            'sessionExercises': sessionExercise,
          },
        );
      },
      child: SizedBox(
        child: Stack(
          children: [
            // image
            Container(
              width: size.width,
              margin: const EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Colors.black87,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  image!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                //color: const Color(0xff2e2e2e),
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black87,
                    Colors.black54,
                    Colors.black54,
                    Colors.transparent,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name!,
                    style: const TextStyle(
                      color: MyColors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(5),
                  Row(
                    children: [
                      Text(
                        '$exerciseTime  mins',
                        style: const TextStyle(
                          color: MyColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Icon(
                        flu.FluentIcons.location_dot,
                        color: MyColors.mainColor,
                        size: 20,
                      ),
                      Text(
                        '$exerciseCount  workout',
                        style:const  TextStyle(
                          color: MyColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _createDifficultyIconList(),
                      itemBuilder: (ctx, _) => Row(
                        children: const [
                          Icon(
                            flu.FluentIcons.hexagon,
                            color: MyColors.mainColor,
                            size: 16,
                          ),
                          Gap(5),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
