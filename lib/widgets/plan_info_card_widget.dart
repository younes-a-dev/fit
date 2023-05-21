import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../provider/plan.dart';
import '../res/colors.dart';
import '../screen/main/plan_overview_screen.dart';
import 'day_counter.dart';
import 'hexagon _spinning_icon.dart';

class PlanInfoCardWidget extends StatelessWidget {
  PlanInfoCardWidget({required this.mainPlan, required this.planIndex});

  Plan? mainPlan;
  int planIndex;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 8,
      width: size.width,
      padding: const EdgeInsets.only(left: 20, right: 20),
      margin: const EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: MyColors.black,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                mainPlan!.name as String,
                style: const TextStyle(
                  color: MyColors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              DayCounter(DateTime.now()),
            ],
          ),
          const Gap(30),
          Row(
            children: [
              const SpinningHexagonIcon(
                size: 20,
                borderColor: MyColors.mainColor,
                borderWidth: 1.5,
              ),
              const Gap(10),
              Text(
                'TODAY :',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const Gap(5),
              mainPlan!.planSessionType == PlanSessionType.singleSession
                  ? Text(
                      ' ${mainPlan!.planSessions![0].sessionExercises!.length} Workouts',
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  : Text(
                      '${mainPlan!.planSessions![planIndex].sessionName}',
                      //     '\n'
                      //     '${mainPlan!.planSessions![planIndex]
                      //     .sessionExercises!.length} Workouts',
                      // textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
              const Spacer(),
              Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      PlanOverviewScreen.routeName,
                      arguments: mainPlan,
                    );
                  },
                  child:  Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, top: 5,
                            bottom: 5),
                    child: Text(
                      'Detail',
                      style: TextStyle(
                        color: MyColors.black.withOpacity(.8),
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
