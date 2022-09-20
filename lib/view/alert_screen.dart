import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:get/get.dart';
import 'package:gap/gap.dart';

class AlertScreen extends StatelessWidget {
  AlertScreen({Key? key}) : super(key: key);

  final List<String> _alertMessages = [
    'Heyyyy,\n new update available, download it',
    'You didn\t practice at all this week, today is the time',
    'Today plan : Leegggg,\n prepare your ass'
  ];

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
              left: 35,
              right: 35,
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    flu.FluentIcons.chrome_back,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                const Text(
                  'Alerts',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          // Gap(20),
          Expanded(
            child: Container(
              width: Get.size.width,
              margin: const EdgeInsets.only(right: 35, left: 35, bottom: 35),
              decoration: BoxDecoration(
                //color: Color(0xfff1f1f1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListView.builder(
                itemCount: _alertMessages.length,
                itemBuilder: (_, i) {
                  return Container(
                    margin: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle, color: Colors.grey),
                          child: const Icon(
                            flu.FluentIcons.hexagon,
                            color: Colors.yellow,
                          ),
                        ),
                        const Gap(15),
                        Container(
                          padding: const EdgeInsets.all(20),
                          //width: Get.size.width / 1.2,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Text(
                            _alertMessages[i],
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
