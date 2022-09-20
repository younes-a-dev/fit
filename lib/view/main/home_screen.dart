import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/widgets/home_days_of_week_item.dart';
import 'package:workout/widgets/home_exercise_item.dart';
import 'package:workout/view/alert_screen.dart';
import '../../model/exercise_step_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF9f9f9),
      body: Column(
        children: [
          // Appbar
          Container(
            height: (Get.size.height) / 10,
            width: Get.size.width,
            margin: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top,
              left: 35,
              right: 35,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: const TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                      children: [
                        TextSpan(
                          text: 'My ',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
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
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    flu.FluentIcons.single_bookmark,
                    color: Colors.black,
                    size: 21,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => AlertScreen());
                  },
                  icon: const Icon(
                    flu.FluentIcons.ringer_active,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),

          // Days of Week row
          Container(
            width: Get.size.width,
            margin: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                HomeDaysOfWeekItem('Mon', true, false),
                HomeDaysOfWeekItem('Tue', false, false),
                HomeDaysOfWeekItem('Wed', true, false),
                HomeDaysOfWeekItem('Thu', false, true),
                HomeDaysOfWeekItem('Fri', true, false),
                HomeDaysOfWeekItem('Sat', false, false),
                HomeDaysOfWeekItem('Sun', false, false),
              ],
            ),
          ),
          const Gap(30),

          // SliverList
          Expanded(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                // Today session
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      // Today's session Text
                      Container(
                        padding: const EdgeInsets.only(left: 35),
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          'Today\'s session',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ),
                      const Gap(20),

                      // Today's session Container
                      Container(
                        margin: const EdgeInsets.only(left: 35, right: 35),
                        width: Get.size.width,
                        height: Get.size.height / 5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          gradient: const LinearGradient(
                            colors: [
                              Colors.black87,
                              Colors.transparent,
                            ],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: Get.size.width,
                              height: Get.size.height / 5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Image.asset(
                                  'assets/images/gym5.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: Get.size.width,
                              height: Get.size.height / 5,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.black,
                                    Colors.black.withOpacity(.7),
                                    Colors.transparent,
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20,
                              left: 20,
                              child: SizedBox(
                                //width: Get.size.width/3,
                                height: Get.size.height / 5 - 40,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          'DAY 14',
                                          //textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      'Full Body',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 34,
                                        color: Colors.white,
                                      ),
                                    ),
                                    //const Gap(3),
                                    const Text(
                                      'Ronnie Coleman',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const Gap(5),
                                    Row(
                                      children: const [
                                        Icon(
                                          flu.FluentIcons.hexagon,
                                          color: Colors.white,
                                          size: 16,
                                        ),
                                        Gap(5),
                                        Text(
                                          'TODAY : 21 mins - 11 workout',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 16,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // myPlan listView
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: exercise.length,
                    (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 35,
                          right: 35,
                          top: index == 0 ? 30 : 0,
                        ),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              top: 0,
                              //index == 0 ? 80 : 0,
                              //Todo: this fucking shit not work!!
                              bottom: exercise.length == index ? 100 : 0,
                              left: 20,
                              width: 100,
                              //height: 75,
                              child: LayoutBuilder(
                                builder: (BuildContext context,
                                    BoxConstraints constraints) {
                                  print(
                                      "The height is ${constraints.constrainWidth()}");
                                  return Flex(
                                    direction: Axis.vertical,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    //mainAxisSize: MainAxisSize.min,
                                    children: List.generate(
                                      (constraints.constrainWidth() / 3)
                                          .floor(),
                                      (index) => const SizedBox(
                                        width: 2,
                                        height: 2,
                                        child: DecoratedBox(
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  exercise.isEmpty
                                      ? Container()
                                      : Expanded(
                                          child: HomeExerciseItem(
                                            exercise[index].name,
                                            exercise[index].image,
                                            exercise[index].muscle,
                                          ),
                                        ),
                                ],
                              ),
                            )
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
