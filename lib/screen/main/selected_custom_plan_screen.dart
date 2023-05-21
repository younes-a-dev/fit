import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/session_model.dart';
import '../../provider/plan.dart';
import '../../res/colors.dart';
import '../../widgets/expansion_tile_listview_widget.dart';
import 'edit_custom_plan_screen.dart';

class SelectedCustomPlanScreen extends StatefulWidget {
  const SelectedCustomPlanScreen({Key? key}) : super(key: key);

  static const routeName = '/create custom plan Screen --> Selected custom '
      'plan Screen';

  @override
  State<SelectedCustomPlanScreen> createState() =>
      _SelectedCustomPlanScreenState();
}

class _SelectedCustomPlanScreenState extends State<SelectedCustomPlanScreen> {
  int _totalWorkouts(List<SessionModel> list) {
    int total = 0;
    for (var element in list) {
      total += element.sessionExercises!.length;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final plansData = Provider.of<Plans>(context);
    final planId = ModalRoute.of(context)!.settings.arguments as String;
    final plan = Provider.of<Plans>(context).findPlanById(planId);
    //TODO: change dynamic to Exercise
    //final planExercises = routeArgs['planExercises'] as List<Exercise>;
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Column(
        children: [
          // AppBar
          Container(
            color: MyColors.black,
            height: size.height / 5,
            padding:
                const EdgeInsets.only(left: 15, right: 15, top: 40, bottom: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 20,
                        color: MyColors.mainColor,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(EditCustomPlanScreen.routeName,
                                arguments: plan)
                            .then((value) => setState(() {}));
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 20,
                        color: MyColors.mainColor,
                      ),
                    ),
                    IconButton(
                      //TODO: XXX
                      onPressed: () {
                        plan.toggleMainStatus();
                        plansData.selectPlanAsMain(plan.id as String);
                        // print(plansData.items.where((element) => element
                        //     .isMain == true).toList());
                      },
                      icon: Icon(
                        plan.isMain!
                            ? Icons.star_rounded
                            : Icons.star_border_rounded,
                        size: 20,
                        color: MyColors.mainColor,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Provider.of<Plans>(context, listen: false)
                            .removeCustomPlan(plan.id as String);
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 20,
                        color: MyColors.mainColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
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
                      const Spacer(),
                      Text(
                        ' ${_totalWorkouts(plan.planSessions as List<SessionModel>).toString()}  Exercises',
                        style: const TextStyle(color: MyColors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          //List View
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ExpansionTileListviewWidget(plan: plan),
            ),
          ),
        ],
      ),
    );
  }
}
