import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../provider/plan.dart';
import '../res/colors.dart';
import '../screen/main/selected_custom_plan_screen.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

class CustomPlansItem extends StatelessWidget {
  const CustomPlansItem({required this.id, this.level});

  final String id;
  final Level? level;

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
    final plan = Provider.of<Plans>(context).findPlanById(id);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(SelectedCustomPlanScreen.routeName, arguments: id);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 15),
        padding:
            const EdgeInsets.only(left: 10, right: 15, top: 20, bottom: 20),
        decoration: BoxDecoration(
          color: MyColors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                children: [
                  Text(
                    plan.name as String,
                    style: const TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Spacer(),
                  plan.workoutType == WorkoutType.plan
                      ? SizedBox(
                          //TODO: height in not correct
                          height: 20,
                          width: _createDifficultyIconList() * 20,
                          child: ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: _createDifficultyIconList(),
                            itemBuilder: (ctx, _) => Row(
                              children: [
                                Icon(
                                  flu.FluentIcons.hexagon,
                                  color: MyColors.mainColor.withOpacity(.6),
                                  size: 16,
                                ),
                                const Gap(5),
                              ],
                            ),
                          ),
                        )
                      : RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: MyColors.white,
                              fontSize: 16,
                            ),
                            children: [
                              TextSpan(
                                text: 'H',
                                style: TextStyle(
                                  color: MyColors.mainColor,
                                ),
                              ),
                              TextSpan(
                                text: 'ex',
                                style: TextStyle(
                                ),
                              ),
                              TextSpan(
                                text: 'F',
                                style: TextStyle(
                                  color: MyColors.mainColor,
                                ),
                              ),
                              TextSpan(
                                text: 'it',
                                style: TextStyle(
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 5,
              ),
              child: SizedBox(
                height: 80,
                width: size.width,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: plan.planSessions!.length,
                  itemBuilder: (context, i) => Container(
                    margin: const EdgeInsets.only(right: 10, top: 20),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        color: MyColors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color:MyColors.mainColor.withOpacity(.5),
                          width: .5,
                        )),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          plan.planSessions![i].sessionName as String,
                          style: const TextStyle(
                            color: MyColors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(5),
                        Text(
                          '${plan.planSessions![i].sessionExercises!.length} Exercises',
                          style:
                              const TextStyle(color: MyColors.grey, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
