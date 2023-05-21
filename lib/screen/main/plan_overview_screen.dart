import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../provider/plan.dart';
import '../../provider/user_setting.dart';
import '../../res/colors.dart';
import '../../widgets/app_bar_widget.dart';
import '../../widgets/expansion_tile_listview_widget.dart';
import '../../widgets/hexagon_widget.dart';

class PlanOverviewScreen extends StatefulWidget {
  const PlanOverviewScreen({Key? key}) : super(key: key);

  static const routeName = '/HomeScreen(more info button) --> '
      'PlanOverviewScreen';

  @override
  State<PlanOverviewScreen> createState() => _PlanOverviewScreenState();
}

class _PlanOverviewScreenState extends State<PlanOverviewScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 2, vsync: this);
    final plan = ModalRoute.of(context)!.settings.arguments as Plan;
    final userData = Provider.of<User>(context);
    // final workoutHistory = userData.workoutHistory;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: 'Plan Overview'),
      body: Column(
        children: [
          // //AppBar
          // Container(
          //   height: (size.height) / 10,
          //   width: size.width,
          //   margin: EdgeInsets.only(
          //     top: MediaQuery.of(context).padding.top,
          //     left: 25,
          //     right: 25,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children:  [
          //       Text(
          //         'Plan Overview',
          //         style: TextStyle(
          //           color: Theme.of(context).primaryColor,
          //           fontFamily: 'Raleway',
          //           fontWeight: FontWeight.bold,
          //           fontSize: 24,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // TabBar
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                isScrollable: true,
                labelPadding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 15,
                  bottom: 15,
                ),
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: MyColors.grey,
                enableFeedback: false,
                splashBorderRadius: BorderRadius.circular(15),
                splashFactory: InkRipple.splashFactory,
                // indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                //indicatorPadding: EdgeInsets.only(left: 30,right: 30),
                indicatorColor: MyColors.mainColor,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 2.5,
                tabs: [
                  Text(plan.planSessionType == PlanSessionType.multiSession
                      ? 'Session\'s'
                      : 'Session Exercises'),
                  const Text('Workout History'),
                ],
              ),
            ),
          ),
          // Session Tab
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              height: size.height - 200,
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: plan.planSessionType == PlanSessionType.multiSession
                        ? Padding(
                          padding: const EdgeInsets.only(left: 20,right:20),
                          child: ExpansionTileListviewWidget(plan: plan),
                        )
                        : ListView(
                            physics: const BouncingScrollPhysics(),
                            children: plan.planSessions![0].sessionExercises!
                                .map((element) => GestureDetector(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(25),
                                                ),
                                                child: Container(
                                                  height: 350,
                                                  // width: Get.size.width/2,
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10,
                                                          bottom: 10,
                                                          left: 25,
                                                          right: 25),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        width: Get.size.width /
                                                            1.5,
                                                        height: 200,
                                                        child: Image.asset(
                                                            element.image),
                                                      ),
                                                      const Divider(),
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(10),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              element.name,
                                                              style:
                                                                  const TextStyle(
                                                                color: MyColors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 18,
                                                              ),
                                                            ),
                                                            const Gap(10),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'Primary: ',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        MyColors
                                                                            .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  //TODO: inja bayad ok beshe
                                                                  element.muscle
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    color:
                                                                        MyColors
                                                                            .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              children: [
                                                                const Text(
                                                                  'Secondary: ',
                                                                  style:
                                                                      TextStyle(
                                                                    color:
                                                                        MyColors
                                                                            .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  //TODO: inja bayad ok beshe
                                                                  element.muscle
                                                                      .toString(),
                                                                  style:
                                                                      const TextStyle(
                                                                    color:
                                                                        MyColors
                                                                            .grey,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
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
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                              left: 20,
                                              right: 20,
                                            ),
                                            padding: const EdgeInsets.only(
                                              left: 10,
                                              right: 10,
                                              bottom: 5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: Colors.transparent,
                                              // const Color(0xfff5f5f5),
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      10,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                    border: Border.all(
                                                        color: MyColors.grey,
                                                        width: 1),
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                    child: Image.asset(
                                                      element.image,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                const Gap(15),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        element.name,
                                                        maxLines: 1,
                                                        softWrap: true,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: TextStyle(
                                                          color:
                                                              Theme.of(context)
                                                                  .primaryColor,
                                                          fontSize: 17,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                      const Gap(10),
                                                      Row(
                                                        children: [
                                                          const Text(
                                                            '4 Set',
                                                            style: TextStyle(
                                                              color:
                                                                  MyColors.grey,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                          const Gap(30),
                                                          Text(
                                                            element.muscle
                                                                .toString()
                                                                .substring(7),
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  MyColors.grey,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                const Icon(
                                                  Icons.arrow_right,
                                                  color: MyColors.mainColor,
                                                ),
                                              ],
                                            ),
                                          ),
                                          const Divider(
                                            endIndent: 20,
                                            indent: 20,
                                            color: MyColors.grey,
                                          ),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                  ),

                  // Workout History Tab
                  userData.user.workoutHistory!.isEmpty
                      ? const Center(
                          child: Text('no history'),
                        )
                      : Expanded(
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: userData.user.workoutHistory!.length,
                            itemBuilder: (context, i) => Container(
                              height: size.height / 16,
                              width: double.infinity,
                              margin: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                children: [
                                  const Gap(15),
                                  Center(
                                    child: ClipPath(
                                      clipper: HexagonWidget(),
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        decoration: const BoxDecoration(
                                          color: Colors.white30,
                                        ),
                                        width: size.height / 50,
                                        height: size.height / 50,
                                        child: Text(
                                          '${i + 1}',
                                          style: const TextStyle(
                                            color: Colors.yellow,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const Gap(15),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        userData.user.workoutHistory![i].plan
                                            .name as String,
                                        style: const TextStyle(
                                          color: MyColors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Gap(2),
                                      if (userData.user.workoutHistory![i].plan
                                              .planSessionType ==
                                          PlanSessionType.multiSession)
                                        Text(
                                          userData.user.workoutHistory![i]
                                              .session.sessionName as String,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat('EEE - h:mm a\nMMM d - ' 'yyy')
                                        .format(userData.user.workoutHistory![i]
                                            .workoutDate),
                                    // textAlign: TextAlign.center,
                                    // userData.user.workoutHistory![i].workoutDate
                                    //     .toString(),
                                    style:
                                    const TextStyle(
                                      color: MyColors.grey,
                                      fontSize: 15,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const Gap(25),
                                ],
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
