import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:workout/widgets/home_and_club_item.dart';
import 'package:workout/model/home_and_club_category_model.dart';

import '../../widgets/circle_tab_indicator.dart';

class DiscoverScreen extends StatefulWidget {
  DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with TickerProviderStateMixin {
  Widget _buildPlanCard(String title, String description) {
    return Container(
      width: MediaQuery.of(context).size.width / 3.5,
      height: 80,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xfff5f5f5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                flu.FluentIcons.hexagon,
                color: Colors.yellow,
                size: 20,
              ),
              Gap(5),
              Text(
                title,
                style: TextStyle(color: Colors.black87),
              ),
              Spacer(),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  flu.FluentIcons.add_bookmark,
                  size: 18,
                ),
              ),
            ],
          ),
          Text(
            description,
            style: TextStyle(color: Colors.black54),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            // Appbar
            Container(
              height: (size.height) / 10,
              width: size.width,
              margin: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top,
                left: 35,
                right: 35,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    'Discover',
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Spacer(),
                  Icon(flu.FluentIcons.event_info),
                  Gap(35),
                  Icon(flu.FluentIcons.triple_column_edit),
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
                  labelPadding: const EdgeInsets.only(
                    left: 35,
                    right: 35,
                    top: 20,
                    bottom: 20,
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  // click sound
                  enableFeedback: false,
                  splashBorderRadius: BorderRadius.circular(15),
                  splashFactory: InkRipple.splashFactory,
                  // indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                  //indicatorPadding: EdgeInsets.only(left: 30,right: 30),
                  indicatorColor: Colors.yellow,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2.5,
                  tabs: const [
                    Text('Home Workout'),
                    Text('Club'),
                    Text('Plans'),
                  ],
                ),
              ),
            ),

            //Tab Bar view
            SizedBox(
              width: double.maxFinite,
              height: size.height - 200,
              child: TabBarView(
                controller: _tabController,
                physics: const BouncingScrollPhysics(),
                children: [


                  // Home tab
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 35, right: 35),
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: Text(
                            'BEGINNER',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            homeBeginnerCategory
                                .map((element) => HomeAndClubItem(
                                      element.title,
                                      element.image,
                                      element.exerciseTime,
                                      element.exerciseCount,
                                    ))
                                .toList(),
                          ),
                          itemExtent: Get.size.height / 8,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        const SliverToBoxAdapter(
                          child: Text(
                            'INTERMEDIATE',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            homeIntermediateCategory
                                .map((element) => HomeAndClubItem(
                                      element.title,
                                      element.image,
                                      element.exerciseTime,
                                      element.exerciseCount,
                                    ))
                                .toList(),
                          ),
                          itemExtent: Get.size.height / 8,
                        ),
                        const SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        const SliverToBoxAdapter(
                          child: Text(
                            'ADVANCED',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            homeAdvancedCategory
                                .map((element) => HomeAndClubItem(
                                      element.title,
                                      element.image,
                                      element.exerciseTime,
                                      element.exerciseCount,
                                    ))
                                .toList(),
                          ),
                          itemExtent: Get.size.height / 8,
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
                        const EdgeInsets.only(top: 20, left: 35, right: 35),
                    child: CustomScrollView(
                      slivers: [
                        const SliverToBoxAdapter(
                          child: Text(
                            'BEGINNER',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            clubBeginnerCategory
                                .map((element) => HomeAndClubItem(
                                      element.title,
                                      element.image,
                                      element.exerciseTime,
                                      element.exerciseCount,
                                    ))
                                .toList(),
                          ),
                          itemExtent: Get.size.height / 8,
                        ),
                        SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        const SliverToBoxAdapter(
                          child: Text(
                            'INTERMEDIATE',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            clubIntermediateCategory
                                .map((element) => HomeAndClubItem(
                                      element.title,
                                      element.image,
                                      element.exerciseTime,
                                      element.exerciseCount,
                                    ))
                                .toList(),
                          ),
                          itemExtent: Get.size.height / 8,
                        ),
                        SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                        const SliverToBoxAdapter(
                          child: Text(
                            'ADVANCED',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                        SliverFixedExtentList(
                          delegate: SliverChildListDelegate(
                            clubAdvancedCategory
                                .map((element) => HomeAndClubItem(
                                      element.title,
                                      element.image,
                                      element.exerciseTime,
                                      element.exerciseCount,
                                    ))
                                .toList(),
                          ),
                          itemExtent: Get.size.height / 8,
                        ),
                        SliverToBoxAdapter(
                          child: Gap(40),
                        ),
                      ],
                    ),
                  ),

                  // Plans tab
                  Container(
                    padding:
                        const EdgeInsets.only(top: 20, left: 35, right: 35),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Classic 3 Day Split',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width,
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  _buildPlanCard(
                                      'FitClub', '1.Chest and Shoulders'),
                                  _buildPlanCard(
                                      'FitClub', '2.Chest and Shoulders'),
                                  _buildPlanCard(
                                      'FitClub', '3.Chest and Shoulders'),
                                ],
                              ),
                            )
                          ],
                        ),
                        Gap(40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Full Body Split',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width,
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  _buildPlanCard('FitClub', 'Full Body 1'),
                                  _buildPlanCard('FitClub', 'Full Body 2'),
                                  _buildPlanCard('FitClub', 'Full Body 3'),
                                ],
                              ),
                            )
                          ],
                        ),
                        Gap(40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Five Day Split',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width,
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  _buildPlanCard('FitClub', 'Day 1:Chest'),
                                  _buildPlanCard(
                                      'FitClub', 'Day 2:Shoulders and ABS'),
                                  _buildPlanCard(
                                      'FitClub', 'Day 3:Arms and Neck'),
                                  _buildPlanCard('FitClub', 'Day 4:Leg'),
                                  _buildPlanCard('FitClub', 'Day 3:Back'),
                                ],
                              ),
                            )
                          ],
                        ),
                        Gap(40),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'No Equipment',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.75),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ),
                            SizedBox(
                              width: size.width,
                              height: 100,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                physics: const BouncingScrollPhysics(),
                                children: [
                                  _buildPlanCard('FitClub', 'Home Workout'),
                                  _buildPlanCard('FitClub', 'Full Body'),
                                  _buildPlanCard('FitClub', 'Home Upper'),
                                  _buildPlanCard('FitClub', 'Home Lower'),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
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
