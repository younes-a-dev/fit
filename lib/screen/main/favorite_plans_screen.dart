import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/widgets/custom_plans_item.dart';
import 'package:workout/widgets/hex_fit_plans_item.dart';

import '../../provider/plan.dart';
import '../../res/colors.dart';
import '../../widgets/home_and_club_plans_item.dart';

class FavoritePlansScreen extends StatefulWidget {
  const FavoritePlansScreen({Key? key}) : super(key: key);

  static const routeName = '/EditProfile Screen --> Favorite Plans screen';

  @override
  State<FavoritePlansScreen> createState() => _FavoritePlansScreenState();
}

class _FavoritePlansScreenState extends State<FavoritePlansScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    TabController _tabController = TabController(length: 4, vsync: this);
    final plansData = Provider.of<Plans>(context);
    final customPlans = plansData.items
        .where((element) => element.workoutType == WorkoutType.customPlan)
        .toList();
    return Scaffold(
      body: Column(
        children: [
          // Appbar
          Container(
            height: (size.height) / 10,
            width: size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 0,
              right: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                Text(
                  'Favorite Plans',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
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
                labelColor: Theme.of(context).primaryColor,
                unselectedLabelColor: MyColors.grey,
                isScrollable: true,
                enableFeedback: false,
                splashBorderRadius: BorderRadius.circular(15),
                indicatorColor: const Color(0xffffd600),
                // indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                //indicatorPadding: EdgeInsets.only(left: 30,right: 30),
                indicatorWeight: 2.5,
                //padding: EdgeInsets.only(left: 10),
                //TODO: label padding
                labelPadding: const EdgeInsets.only(
                    left: 20, right: 20, top: 15, bottom: 15),
                tabs: const [
                  Text('Home Plans'),
                  Text('Club Plans'),
                  Text('Plans'),
                  Text('Custom Plans'),
                ],
              ),
            ),
          ),

          Expanded(
            child: SizedBox(
              width: double.maxFinite,
              child: TabBarView(
                physics: const BouncingScrollPhysics(),
                controller: _tabController,
                children: [
                  // Home Plans
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: plansData
                          .favoritePlans(WorkoutType.home)
                          .map((element) => SizedBox(
                                height: size.height / 6,
                                child: HomeAndClubPlansItem(
                                  id: element.id as String,
                                  name: element.name,
                                  exerciseCount: element.exerciseCount,
                                  exerciseTime: element.workoutTime,
                                  image: element.image,
                                  session: element.planSessions![0],
                                  level: element.level as Level,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  // Club Plans
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: plansData
                          .favoritePlans(WorkoutType.club)
                          .map((element) => SizedBox(
                                height: size.height / 6,
                                child: HomeAndClubPlansItem(
                                  id: element.id as String,
                                  name: element.name,
                                  exerciseCount: element.exerciseCount,
                                  exerciseTime: element.workoutTime,
                                  image: element.image,
                                  session: element.planSessions![0],
                                  level: element.level as Level,
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  // Plans
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: plansData
                          .favoritePlans(WorkoutType.plan)
                          .map((e) => HexFitPlansItem(id: e.id as String))
                          .toList(),
                    ),
                  ),
                  // Custom plans
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: customPlans.length,
                      itemBuilder: (ctx, i) =>
                          CustomPlansItem(id: customPlans[i].id as String),
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
