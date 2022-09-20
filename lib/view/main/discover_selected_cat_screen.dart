import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/model/exercise_step_model.dart';

class DiscoverSelectedCatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    final title = routeArgs['title'];
    final image = routeArgs['image'];
    final exerciseTime = routeArgs['exerciseTime'];
    final exerciseCount = routeArgs['exerciseCount'];
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
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
                  left: 20,
                  child: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      flu.FluentIcons.chrome_back,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  right: 20,
                  child: IconButton(
                    //TODO: XXX
                    onPressed: () {},
                    icon: const Icon(
                      flu.FluentIcons.add_bookmark,
                      color: Colors.yellow,
                    ),
                  ),
                ),
                Positioned(
                  left: 35,
                  bottom: 60,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 25,
                  left: 35,
                  child: Row(
                    children: [
                      Text(
                        '$exerciseTime Min',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                      const Gap(10),
                      const Icon(
                        flu.FluentIcons.location_dot,
                        size: 20,
                        color: Colors.yellow,
                      ),
                      const Gap(10),
                      Text(
                        '$exerciseCount Workout',
                        style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Gap(20),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: exercise
                  .map((element) => GestureDetector(
                onTap: (){
                  showDialog(context: context, builder: (BuildContext context){
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
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: Get.size.width / 1.5,
                              height: 200,
                              child: Image.asset(element.image),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 30),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xfff5f5f5),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const Gap(10),
                                  Row(
                                    children:  [
                                      const Text(
                                        'Primary: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        //TODO: inja bayad ok beshe
                                        element.muscle.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children:  [
                                      const Text(
                                        'Secondary: ',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        //TODO: inja bayad ok beshe
                                        element.muscle.toString(),
                                        style: const TextStyle(
                                          color: Colors.grey,
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
                    child: Container(
                          height: Get.size.height / 8,
                          width: Get.size.width,
                          padding: const EdgeInsets.all(25),
                          margin: const EdgeInsets.only(
                              left: 20, right: 20, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            children: [
                              Image.asset(element.image),
                              // Gap(5),
                              // // Divider(color: Colors.yellow,thickness: 2),
                              // Container(
                              //   color: Colors.yellow,
                              //   width: 2,
                              //  height: Get.size.height/10,
                              // ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                    top: 10,
                                    left: 20,
                                    bottom: 20,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Row(
                                        children: [
                                          // Icon(
                                          //   flu.FluentIcons.location_dot,
                                          //   size: 20,
                                          //   color: Colors.yellow,
                                          // ),
                                          // Gap(5),
                                          Text(
                                            element.name,
                                            style: const TextStyle(
                                                color: Colors.black87,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      const Gap(10),
                                      Row(
                                        children: [
                                          // Icon(
                                          //   flu.FluentIcons.location_dot,
                                          //   size: 20,
                                          //   color: Colors.yellow,
                                          // ),
                                          Text(
                                            '$exerciseTime min --$exerciseCount '
                                                'workout',
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const Spacer(),
                                          Row(
                                            children: const [
                                              Text(
                                                'More',
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                              Gap(5),
                                              Icon(
                                                Icons.arrow_upward_rounded,
                                                size: 20,
                                                color: Colors.yellow,
                                              ),
                                            ],
                                          ),
                                          // Icon(
                                          //   flu.FluentIcons.location_dot,
                                          //   size: 20,
                                          // ),
                                          // Text(
                                          //   '$exerciseCount workout ',
                                          //   style: TextStyle(
                                          //     color: Colors.grey,
                                          //     fontSize: 16,
                                          //     fontWeight: FontWeight.w700,
                                          //   ),
                                          // ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
