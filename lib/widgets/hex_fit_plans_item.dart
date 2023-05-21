import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import '../provider/plan.dart';
import '../res/colors.dart';
import '../screen/selected_hex_Fit_plan_screen.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

class HexFitPlansItem extends StatelessWidget {
  const HexFitPlansItem({required this.id, this.level});

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
            .pushNamed(SelectedHexFitPlanScreen.routeName, arguments: id);
      },
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding:
            const EdgeInsets.only(left: 10, right: 15, top: 20, bottom:15),
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
                  //plan name
                  Text(
                    plan.name as String,
                    style: const TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  const Spacer(),
                  // Difficulty Icons
                  SizedBox(
                    //TODO: height in not correct
                    height: 20,
                    width: _createDifficultyIconList() * 20,
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
                  )
                ],
              ),
            ),

            // Horizontal Sessions ListView
            // Todo: fix top 4 size (over flow)
             Padding(
              padding: const EdgeInsets.only(
                left: 10,
                top: 4,
              ),
              child: SizedBox(
                height: 60,
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
                          color: MyColors.mainColor.withOpacity(.5),
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
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
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
