import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../provider/plan.dart';
import '../../provider/user_setting.dart';
import '../../res/colors.dart';
import '../../widgets/calendar_widget.dart';
import '../../widgets/home_starter_guide_widget.dart';
import '../../widgets/plan_info_card_widget.dart';
import '../../widgets/home_exercise_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Plan? mainPlan;
  int planIndex = 0;

  @override
  void didChangeDependencies() {
    final plan = Provider.of<Plans>(context).mainPlan;
    mainPlan = plan;
    super.didChangeDependencies();
  }

  void getPlanIndex(Plan plan) {
    int lastIndex = plan.planSessions!.length;
    planIndex++;
    if (planIndex == lastIndex) {
      planIndex = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Appbar
          Container(
            height: (Get.size.height) / 10,
            width: Get.size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text:  TextSpan(
                      style:   TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Raleway',
                      ),
                      children: const [
                        TextSpan(
                          text: 'My ',
                          style: TextStyle(
                            color: MyColors.mainColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Training ',
                        ),
                        TextSpan(
                          text: 'plan',
                        ),
                      ]),
                ),
                const Spacer(),
                //TODO: Alert screen !!!
                // IconButton(
                //   onPressed: () {
                //     Navigator.of(context).pushNamed(AlertScreen.routeName);
                //   },
                //   icon: const Icon(
                //     flu.FluentIcons.ringer_active,
                //     color: Colors.black,
                //   ),
                // ),
              ],
            ),
          ),
          // Calendar
          const CalendarWidget(),
          const Gap(20),
          // SliverList
          mainPlan == null
              ? const Center(child: HomeStarterGuideWidget())
              : Expanded(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // Plan Info Card
                      SliverToBoxAdapter(
                        child: PlanInfoCardWidget(
                            mainPlan: mainPlan, planIndex: planIndex),
                      ),
                      // Main Plan ListView
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          childCount: mainPlan == null
                              ? 0
                              : mainPlan!.planSessions![planIndex]
                                  .sessionExercises!.length,
                          (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 20,
                                right: 20,
                                top: index == 0 ? 30 : 0,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                        bottom: 5, left: 20, right: 20),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        mainPlan == null
                                            ? Container()
                                            : Expanded(
                                                child: Column(
                                                  children: [
                                                    HomeExerciseItem(
                                                      mainPlan!
                                                          .planSessions![
                                                              planIndex]
                                                          .sessionExercises![
                                                              index]
                                                          .name,
                                                      mainPlan!
                                                          .planSessions![
                                                              planIndex]
                                                          .sessionExercises![
                                                              index]
                                                          .image,
                                                      mainPlan!
                                                          .planSessions![
                                                              planIndex]
                                                          .sessionExercises![
                                                              index]
                                                          .muscle,
                                                    ),
                                                    index + 1 ==
                                                            mainPlan!
                                                                .planSessions![
                                                                    planIndex]
                                                                .sessionExercises!
                                                                .length
                                                        ? const Gap(10)
                                                        :  Divider(
                                                      color: Theme.of
                                                        (context).canvasColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                      ],
                                    ),
                                  ),
                                  if (index ==
                                      mainPlan!.planSessions![planIndex]
                                              .sessionExercises!.length -
                                          1)
                                    // Done Button
                                    ElevatedButton(
                                      onPressed: () {
                                        Provider.of<User>(context,
                                                listen: false)
                                            .addWorkoutToHistory(
                                                mainPlan!,
                                                mainPlan!
                                                    .planSessions![planIndex]);
                                        setState(() {
                                          getPlanIndex(mainPlan!);
                                        });
                                      },
                                      child: const Text('Done'),
                                    ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
