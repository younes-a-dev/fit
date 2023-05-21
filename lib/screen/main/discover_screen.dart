import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/home_and_club_plans_item.dart';

import '../../provider/plan.dart';
import '../../res/colors.dart';
import '../../widgets/hex_fit_plans_item.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final planData = Provider.of<Plans>(context);
    // final hexFitPlans = planData.items
    //     .where((element) =>
    //         element.planSessionType == PlanSessionType.multiSession)
    //     .toList();
    // final plans = planData.items;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          // Appbar
          Container(
            height: (Get.size.height) / 10,
            width: Get.size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 20,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                    children: const [
                      TextSpan(
                        text: 'Discover ',
                        style: TextStyle(
                          color: MyColors.mainColor,
                        ),
                      ),
                      TextSpan(
                        text: 'Plan',
                      ),
                    ],
                  ),
                ),
                const Spacer(),
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
          // Tab Bar
          SizedBox(
            height: 60,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                isScrollable: true,
                enableFeedback: false,
                splashBorderRadius: BorderRadius.circular(15),
                indicatorColor: MyColors.mainColor,
                // indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                //indicatorPadding: EdgeInsets.only(left: 30,right: 30),
                indicatorWeight: 2.5,
                labelStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xff2e2e2e),
                    fontFamily: 'Raleway'),
                //padding: EdgeInsets.only(left: 10),
                //TODO: label padding
                labelPadding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: MyColors.grey,
                tabs: const [
                  Text('Home Workout'),
                  Text('Club'),
                  Text('Plans'),
                ],
              ),
            ),
          ),

          //Tab Bar view
          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [
                  // Home tab
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text(
                            'BEGINNER',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.beginner, WorkoutType.home)
                                .map(
                                  (element) => HomeAndClubPlansItem(
                                    id: element.id as String,
                                    name: element.name,
                                    exerciseCount: element.exerciseCount,
                                    exerciseTime: element.workoutTime,
                                    image: element.image,
                                    session: element.planSessions![0],
                                    level: element.level as Level,
                                  ),
                                )
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        // SliverList(
                        //   delegate: SliverChildBuilderDelegate(
                        //     childCount: 7,
                        //     (context, i) => ChangeNotifierProvider(
                        //       create: (ctx) => planData.filterByLevelAndType(
                        //           Level.beginner, WorkoutType.home)[i],
                        //       child: HomeAndClubPlansItem(
                        //         //id: plans[i].id as String,
                        //         name: planData.filterByLevelAndType(
                        //             Level.beginner, WorkoutType.home)[i].name,
                        //         exerciseCount: planData.filterByLevelAndType(
                        //             Level.beginner, WorkoutType.home)[i].exerciseCount,
                        //         exerciseTime: planData.filterByLevelAndType(
                        //             Level.beginner, WorkoutType.home)[i].workoutTime,
                        //         image: planData.filterByLevelAndType(
                        //             Level.beginner, WorkoutType.home)[i].image,
                        //         planExercises: planData.filterByLevelAndType(
                        //             Level.beginner, WorkoutType.home)[i].planExercises,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        SliverToBoxAdapter(
                          child: Text(
                            'INTERMEDIATE',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.intermediate, WorkoutType.home)
                                .map((element) => HomeAndClubPlansItem(
                                      id: element.id as String,
                                      name: element.name,
                                      exerciseCount: element.exerciseCount,
                                      exerciseTime: element.workoutTime,
                                      image: element.image,
                                      session: element.planSessions![0],
                                      level: element.level as Level,
                                    ))
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        SliverToBoxAdapter(
                          child: Text(
                            'ADVANCED',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.advanced, WorkoutType.home)
                                .map((element) => HomeAndClubPlansItem(
                                      id: element.id as String,
                                      name: element.name,
                                      exerciseCount: element.exerciseCount,
                                      exerciseTime: element.workoutTime,
                                      image: element.image,
                                      session: element.planSessions![0],
                                      level: element.level as Level,
                                    ))
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                      ],
                    ),
                  ),

                  // Club tab
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text(
                            'BEGINNER',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.beginner, WorkoutType.club)
                                .map(
                                  (element) => HomeAndClubPlansItem(
                                    id: element.id as String,
                                    name: element.name,
                                    exerciseCount: element.exerciseCount,
                                    exerciseTime: element.workoutTime,
                                    image: element.image,
                                    session: element.planSessions![0],
                                    level: element.level as Level,
                                  ),
                                )
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        SliverToBoxAdapter(
                          child: Text(
                            'INTERMEDIATE',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.intermediate, WorkoutType.club)
                                .map((element) => HomeAndClubPlansItem(
                                      id: element.id as String,
                                      name: element.name,
                                      exerciseCount: element.exerciseCount,
                                      exerciseTime: element.workoutTime,
                                      image: element.image,
                                      session: element.planSessions![0],
                                      level: element.level as Level,
                                    ))
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        SliverToBoxAdapter(
                          child: Text(
                            'ADVANCED',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.advanced, WorkoutType.club)
                                .map((element) => HomeAndClubPlansItem(
                                      id: element.id as String,
                                      name: element.name,
                                      exerciseCount: element.exerciseCount,
                                      exerciseTime: element.workoutTime,
                                      image: element.image,
                                      session: element.planSessions![0],
                                      level: element.level as Level,
                                    ))
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                      ],
                    ),
                  ),

                  // Plans tab
                  // Container(
                  //   padding:
                  //       const EdgeInsets.only(top: 20, left: 25, right: 25),
                  //   child: ListView.builder(
                  //     itemCount: hexFitPlans.length,
                  //     itemBuilder: (context, i) => CustomAndHexFitPlansItem(
                  //       id: hexFitPlans[i].id as String,
                  //       level: hexFitPlans[i].level,
                  //     ),
                  //   ),
                  // ),

                  // HexFit Plans tab (3th tab)
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: CustomScrollView(
                      physics: const BouncingScrollPhysics(),
                      slivers: [
                        SliverToBoxAdapter(
                          child: Text(
                            'BEGINNER',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.beginner, WorkoutType.plan)
                                .map(
                                  (element) => HexFitPlansItem(
                                    id: element.id as String,
                                    level: element.level,
                                  ),
                                )
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        SliverToBoxAdapter(
                          child: Text(
                            'INTERMEDIATE',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.intermediate, WorkoutType.plan)
                                .map(
                                  (element) => HexFitPlansItem(
                                    id: element.id as String,
                                    level: element.level,
                                  ),
                                )
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        SliverToBoxAdapter(
                          child: Text(
                            'ADVANCED',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            planData
                                .filterByLevelAndType(
                                    Level.advanced, WorkoutType.plan)
                                .map(
                                  (element) => HexFitPlansItem(
                                    id: element.id as String,
                                    level: element.level,
                                  ),
                                )
                                .toList(),
                          ),
                          itemExtent: size.height / 6,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
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
    );
  }
}
