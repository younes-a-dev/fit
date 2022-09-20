import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class AddExerciseScreen extends StatelessWidget {
  const AddExerciseScreen({Key? key}) : super(key: key);

  Widget _buildToggleButton(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: Get.size.width / 2.5,
        height: 50,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xfff1f1f1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.grey, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
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
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    flu.FluentIcons.back,
                    size: 20,
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(
                        text: 'Add ',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      TextSpan(
                        text: 'Exercise ',
                        // style: TextStyle(
                        //   color: Colors.yellow,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 24,
                        // ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  flu.FluentIcons.accept,
                  size: 20,
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
              padding: const EdgeInsets.only(),
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
                  prefixIcon: Icon(
                    flu.FluentIcons.search,
                    color: Colors.yellow,
                  ),
                  hintText: 'Search Exercise',
                  hintStyle: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20, left: 35, right: 35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildToggleButton('All Equipment'),
                _buildToggleButton('All Muscles'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
