import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:provider/provider.dart';

import '../provider/exercise.dart';
import '../provider/plan.dart';
import '../res/colors.dart';

class DiscoverSelectedPlanDetailScreen extends StatefulWidget {
  static const routeName =
      '/Discover Screen (home and club plan item)  --> SelectedPlanDetailScreen';

  @override
  State<DiscoverSelectedPlanDetailScreen> createState() =>
      _DiscoverSelectedPlanDetailScreenState();
}

class _DiscoverSelectedPlanDetailScreenState
    extends State<DiscoverSelectedPlanDetailScreen> {
  @override
  Widget build(BuildContext context) {
    //final exerciseData = Provider.of<Exercises>(context);
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final id = routeArgs['id'];
    final title = routeArgs['title'];
    final image = routeArgs['image'];
    final exerciseTime = routeArgs['exerciseTime'];
    final exerciseCount = routeArgs['exerciseCount'];
    final sessionExercises = routeArgs['sessionExercises'] as List<Exercise>;
    final plansData = Provider.of<Plans>(context);
    final plan = Provider.of<Plans>(context).findPlanById(id);
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      body: Column(
        children: [
          SizedBox(
            height: Get.size.height / 4,
            width: Get.size.width,
            child: Stack(
              children: [
                Image.asset(
                  image,
                  fit: BoxFit.cover,
                  height: Get.size.height / 4,
                  width: Get.size.width,
                ),
                Container(
                  height: Get.size.height / 4,
                  width: Get.size.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black,
                        Colors.black87,
                        Colors.black54,
                        Colors.black54,
                        Colors.transparent,
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      flu.FluentIcons.chrome_back,
                      size: 18,
                      color: MyColors.mainColor,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 10,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          //TODO: its not normal
                          setState(() {
                            plan.toggleBookmarkStatus();
                          });
                        },
                        icon: Icon(
                          plan.isFavorite!
                              ? flu.FluentIcons.single_bookmark_solid
                              : flu.FluentIcons.add_bookmark,
                          size: 18,
                          color: MyColors.mainColor,
                        ),
                      ),
                      IconButton(
                        //TODO: XXX
                        onPressed: () {
                          plan.toggleMainStatus();
                          plansData.selectPlanAsMain(id);
                          // print(plansData.items.where((element) => element
                          //     .isMain == true).toList());
                        },
                        icon: Icon(
                          plan.isMain!
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          size: 25,
                          color: MyColors.mainColor,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 25,
                  bottom: 50,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: MyColors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 25,
                  child: Row(
                    children: [
                      Text(
                        '$exerciseTime Min',
                        style: const TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      const Gap(10),
                      const Icon(
                        flu.FluentIcons.location_dot,
                        size: 16,
                        color: MyColors.mainColor,
                      ),
                      const Gap(10),
                      Text(
                        '$exerciseCount Workout',
                        style: const TextStyle(
                          color: MyColors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: sessionExercises
                    .map(
                      (element) => GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                    height: 350,
                                    // width: Get.size.width/2,
                                    padding: const EdgeInsets.only(
                                        top: 10, bottom: 10, left: 25, right: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: Get.size.width / 1.5,
                                          height: 200,
                                          child: Image.asset(element.image),
                                        ),
                                        const Divider(),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title,
                                                style: const TextStyle(
                                                  color: MyColors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                              const Gap(10),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Primary: ',
                                                    style: TextStyle(
                                                      color: MyColors.grey,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    //TODO: inja bayad ok beshe
                                                    element.muscle.toString(),
                                                    style: const TextStyle(
                                                      color: MyColors.grey,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                    'Secondary: ',
                                                    style: TextStyle(
                                                      color: MyColors.grey,
                                                      fontWeight: FontWeight.w500,
                                                    ),
                                                  ),
                                                  Text(
                                                    //TODO: inja bayad ok beshe
                                                    element.muscle.toString(),
                                                    style: const TextStyle(
                                                      color: MyColors.grey,
                                                      fontWeight: FontWeight.w500,
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
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height:
                                        MediaQuery.of(context).size.height / 10,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(90),
                                      border: Border.all(
                                          color: MyColors.grey, width: 1),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(90),
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
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          maxLines: 1,
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                          style:  TextStyle(
                                            color: Theme.of(context).primaryColor,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const Gap(15),
                                        Row(
                                          children: [
                                            const Text(
                                              '4 Set',
                                              style: TextStyle(
                                                color: MyColors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            const Gap(30),
                                            Text(
                                              element.muscle
                                                  .toString()
                                                  .substring(7),
                                              style: const TextStyle(
                                                color: MyColors.grey,
                                                fontSize: 15,
                                                fontWeight: FontWeight.normal,
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
                             const Divider(color:MyColors.grey,indent:20,
                                 endIndent:20),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
