import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:introduction_slider/introduction_slider.dart';

import '../res/colors.dart';
import 'init_user_info.dart';

class IntroSlider extends StatefulWidget {
  IntroSlider({Key? key}) : super(key: key);

  static const routeName = '/IntroSlider';

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  IntroductionSliderItem _buildSlidItem(String image) {
    return IntroductionSliderItem(
      title: Padding(
        padding: const EdgeInsets.all(70),
        child: Column(
          children: [
            Image.asset(image),
            Gap(Get.size.height / 4),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        //padding: EdgeInsets.only(bottom: 50,),
        child: IntroductionSlider(
          showStatusBar: true,
          items: [
            _buildSlidItem('assets/images/intro1.png'),
            _buildSlidItem('assets/images/intro2.png'),
            _buildSlidItem('assets/images/intro3.png'),
            _buildSlidItem('assets/images/intro4.png'),
          ],
          done: Done(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'OK',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            home: const InitUserInfo(),
          ),
          dotIndicator: const DotIndicator(
            size: 10,
            selectedColor: MyColors.mainColor,
            unselectedColor: Colors.grey,
          ),
          physics: const BouncingScrollPhysics(),
          back:  Back(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'BACK',
                style: TextStyle(
                  color: Theme.of(context).canvasColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          next:  Next(
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Text(
                'NEXT',
                style: TextStyle(
                  color:Theme.of(context).canvasColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
