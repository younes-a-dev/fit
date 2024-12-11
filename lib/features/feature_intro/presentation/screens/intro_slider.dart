import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../common/utils/prefs_opreator.dart';
import '../../../../locator.dart';
import '../../../feature_auth/presentation/screens/auth_screen.dart';
import '../bloc/intro_cubit/intro_cubit.dart';
import '../widgets/intro_page.dart';

class IntroSlider extends StatefulWidget {
  IntroSlider({Key? key}) : super(key: key);

  static const routeName = 'IntroSlider';

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final PageController _pageController = PageController();

  final List<Widget> _introPages = const [
    IntroPage(
      imageUrl: 'assets/images/intro-1.svg',
    ),
    IntroPage(
      imageUrl: 'assets/images/intro-2.svg',
    ),
    IntroPage(
      imageUrl: 'assets/images/intro-3.svg',
    ),
    IntroPage(
      imageUrl: 'assets/images/intro-4.svg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => IntroCubit(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Stack(
              children: [
                Positioned(
                  top: 0,
                  child: SizedBox(
                    width: size.width,
                    height: size.height,
                    child: PageView(
                      controller: _pageController,
                      children: _introPages,
                      onPageChanged: (index) {
                        if (index == 3) {
                          BlocProvider.of<IntroCubit>(context)
                              .changeGetStart(true);
                        } else {
                          BlocProvider.of<IntroCubit>(context)
                              .changeGetStart(false);
                        }
                      },
                    ),
                  ),
                ),
                Positioned(
                  bottom: size.height * 0.05,
                  right: 30,
                  left: 30,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        child: Text('Back'),
                        onPressed: () {
                          if (_pageController.page!.round() > 0) {
                            _pageController.animateToPage(
                              _pageController.page!.round() - 1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      ),
                      // Dot Indicator
                      DelayedWidget(
                          delayDuration:
                              const Duration(milliseconds: 300), // Not required
                          animationDuration:
                              const Duration(seconds: 1), // Not required
                          animation: DelayedAnimations
                              .SLIDE_FROM_BOTTOM, // Not required
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 4,
                            effect: ExpandingDotsEffect(
                                dotWidth: 10,
                                dotHeight: 10,
                                spacing: 5,
                                activeDotColor: Colors.amber),
                          )),
                      BlocBuilder<IntroCubit, IntroState>(
                        builder: (context, state) {
                          if (state.showGetStart) {
                            return TextButton(
                              child: Text('OK'),
                              onPressed: () {
                                PrefsOperator prefsOperator =
                                    sl<PrefsOperator>();
                                prefsOperator.changeIntroState();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AuthScreen.routeName,
                                  ModalRoute.withName("AuthScreen"),
                                );
                              },
                            );
                          } else {
                            return TextButton(
                                child: Text(
                                  'Next',
                                ),
                                onPressed: () {
                                  _pageController.animateToPage(
                                    _pageController.page!.round() + 1,
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeInOut,
                                  );
                                });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
