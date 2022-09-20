import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:workout/view/add_exercise_screen.dart';

class CreatePlanScreen extends StatelessWidget {
  const CreatePlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
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
              //crossAxisAlignment: CrossAxisAlignment.end,
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
                          text: 'Create\n',
                        ),
                        TextSpan(
                          text: 'Custom ',
                          style: TextStyle(
                            color: Colors.yellow,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        TextSpan(
                          text: 'plan',
                        ),
                      ]),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    //alignment: Alignment.bottomCenter,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      'Save',
                      style: TextStyle(
                          color: Colors.black.withOpacity(.7),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 35, right: 35),
            child: Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color(0xfff5f5f5),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              padding: const EdgeInsets.only(left: 10, right: 35),
              child: const TextField(
                keyboardType: TextInputType.text,
                //cursorHeight: 22,
                cursorColor: Colors.yellow,
                style: TextStyle(
                  color: Colors.black54,
                ),
                decoration: InputDecoration(
                  //filled: true,
                  border: InputBorder.none,
                  //contentPadding: EdgeInsets.all(10),
                  // prefixIcon: Icon(
                  //   icon,
                  //   color: Theme.of(context).primaryColor,
                  // ),
                  hintText: 'Plan title',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
          ),
          const Gap(80),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                height: 30,
                width: 30,
                'assets/images/dumbbell.png',
                color: Colors.yellow,
              ),
              const Gap(10),
              const Text(
                'Get started by adding an exercise to plan',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
              ),
              InkWell(
                onTap: () {
                  Get.to(() => AddExerciseScreen());
                },
                child: Container(
                  height: 50,
                  width: size.width / 1.5,
                  margin: EdgeInsets.only(left: 35, right: 35, top: 20),
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: const Color(0xfff5f5f5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Text(
                    '+ add exercise',
                    style: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
