import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:workout/bottom_navigator.dart';

class IntroSlider extends StatelessWidget {
  const IntroSlider({Key? key}) : super(key: key);

  IntroductionSliderItem _buildSlidItem(String image) {
    return IntroductionSliderItem(
      title: Padding(
        padding: EdgeInsets.all(70),
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
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        //padding: EdgeInsets.only(bottom: 50,),
        child: IntroductionSlider(
          items: [
            _buildSlidItem('assets/images/intro1.png'),
            _buildSlidItem('assets/images/intro2.png'),
            _buildSlidItem('assets/images/intro3.png'),
            _buildSlidItem('assets/images/intro4.png'),
          ],
          done: Done(
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'START',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            home: BottomNavigator(),
          ),
          dotIndicator: const DotIndicator(
            size: 10,
            selectedColor: Colors.yellow,
            unselectedColor: Colors.grey,
          ),
          physics: const BouncingScrollPhysics(),
          back: const Back(
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'BACK',
                style: TextStyle(
                  color: Colors.black45,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          next: const Next(
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                'NEXT',
                style: TextStyle(
                  color: Colors.black45,
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
