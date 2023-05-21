import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

import '../provider/plan.dart';
import '../res/colors.dart';
import '../widgets/expansion_tile_listview_widget.dart';

class SelectedHexFitPlanScreen extends StatefulWidget {
  const SelectedHexFitPlanScreen({Key? key}) : super(key: key);

  // this screen is for plans of plan tab in discover screen

  static const routeName = '/ Discover Screen(plan item) --> '
      'SelectedHexFitPlanScreen';

  @override
  State<SelectedHexFitPlanScreen> createState() =>
      _SelectedHexFitPlanScreenState();
}

class _SelectedHexFitPlanScreenState extends State<SelectedHexFitPlanScreen> {
  int _createDifficultyIconList(Level level) {
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
    final plansData = Provider.of<Plans>(context);
    final planId = ModalRoute.of(context)!.settings.arguments as String;
    final plan = Provider.of<Plans>(context).findPlanById(planId);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // const AppBarWidget('Plan Name'),
          Container(
            color: MyColors.black,
            height: size.height / 5,
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.arrow_back,
                          color: MyColors.mainColor),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          plan.toggleBookmarkStatus();
                        });
                      },
                      icon: Icon(
                        plan.isFavorite!
                            ? flu.FluentIcons.single_bookmark_solid
                            : flu.FluentIcons.add_bookmark,
                        color: MyColors.mainColor,
                        size: 18,
                      ),
                    ),
                    IconButton(
                      //TODO: XXX
                      onPressed: () {
                        plan.toggleMainStatus();
                        plansData.selectPlanAsMain(planId);
                        // print(plansData.items.where((element) => element
                        //     .isMain == true).toList());
                      },
                      icon: Icon(
                        plan.isMain!
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        color: MyColors.mainColor,
                      ),
                    ),
                  ],
                ),
                const Gap(15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    children: [
                      Text(
                        plan.name as String,
                        style: const TextStyle(
                          color: MyColors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(10),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10),
                  child: Row(
                    children: [
                      Text(
                        '${plan.exerciseCount} Workouts',
                        style: const TextStyle(color: MyColors.grey),
                      ),
                      const Spacer(),
                      SizedBox(
                        //TODO: height in not correct
                        height: 20,
                        width:
                            _createDifficultyIconList(plan.level as Level) * 20,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount:
                              _createDifficultyIconList(plan.level as Level),
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
                )
              ],
            ),
          ),
          const Gap(40),

          // ListView
          Expanded(child: ExpansionTileListviewWidget(plan: plan)),
        ],
      ),
    );
  }
}
