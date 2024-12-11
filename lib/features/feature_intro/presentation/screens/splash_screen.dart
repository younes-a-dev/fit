import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:delayed_widget/delayed_widget.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../bottom_navigator.dart';
import '../../../../common/utils/prefs_opreator.dart';
import '../../../../locator.dart';
import '../../../../res/colors.dart';
import '../../../feature_auth/presentation/bloc/cubit/auth_cubit.dart';
import '../../../feature_auth/presentation/screens/auth_screen.dart';
import '../bloc/splash_cubit/splash_cubit.dart';
import 'intro_slider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<SplashCubit>(context).checkConnectionEvent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: DelayedWidget(
            delayDuration: const Duration(milliseconds: 200),
            animationDuration: const Duration(milliseconds: 1000),
            animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
            child: Image.asset(
              'assets/images/HexFit Logo.png',
              color: MyColors.mainColor,
            ),
          )),
          BlocConsumer<SplashCubit, SplashState>(builder: (context, state) {
            /// if user is online
            if (state.connectionStatus is ConnectionInitial ||
                state.connectionStatus is ConnectionOn) {
              // return Directionality(
              //   textDirection: TextDirection.ltr,
              //   child: LoadingAnimationWidget.progressiveDots(
              //     color: MyColors.mainColor,
              //     size: 24,
              //   ),
              // );
              return BlocConsumer<AuthCubit, AuthState>(
                  builder: (context, state) {
                if (state.authStatus is AppInitialState) {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: LoadingAnimationWidget.progressiveDots(
                      color: MyColors.mainColor,
                      size: 24,
                    ),
                  );
                }
                return Container();
              }, listener: (context, state) {
                if (state.authStatus is AuthenticatedState) {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => BottomNavigator()));
                }
                if(state.authStatus is UnAuthenticatedState){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => AuthScreen()));
                }
              });
            }

            /// if user is offline
            if (state.connectionStatus is ConnectionOff) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Cant connect to the internet',
                    style: TextStyle(color: Colors.red),
                  ),
                  IconButton(
                      splashColor: Colors.red,
                      onPressed: () {
                        /// check that we are online or not
                        BlocProvider.of<SplashCubit>(context)
                            .checkConnectionEvent();
                      },
                      icon: const Icon(
                        Icons.autorenew,
                        color: Colors.red,
                      ))
                ],
              );
            }

            /// default value
            return Container();
          }, listener: (context, state) {
            if (state.connectionStatus is ConnectionOn) {
              gotoHome();
            }
          }),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Future<void> gotoHome() async {
    PrefsOperator prefsOperator = sl<PrefsOperator>();
    var shouldShowIntro = await prefsOperator.getIntroState();

    return Future.delayed(const Duration(seconds: 3), () {
      if (shouldShowIntro) {
        Navigator.pushNamedAndRemoveUntil(
          context,
          IntroSlider.routeName,
          ModalRoute.withName("IntroSlider"),
        );
      } else {
        // Navigator.pushNamedAndRemoveUntil(
        //   context,
        //   AuthScreen.routeName,
        //   ModalRoute.withName("AuthScreen"),
        // );
        context.read<AuthCubit>().checkAppStateEvent();
      }
    });
  }
}
