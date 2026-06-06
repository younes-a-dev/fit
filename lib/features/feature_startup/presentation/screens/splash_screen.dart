import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../bottom_navigator.dart';
import '../../../../res/colors.dart';
import '../../../feature_auth/presentation/bloc/cubit/auth_cubit.dart';
import '../../../feature_auth/presentation/bloc/cubit/status/auth_status.dart';
import '../../../feature_auth/presentation/screens/auth_screen.dart';
import '../../../language/presentation/screens/language_selection_page.dart';
import '../../domain/entity/app_state_entity.dart';
import '../cubit/startup_cubit.dart';
import '../cubit/status/check_app_state_status.dart';
import '../cubit/status/check_first_time_status.dart';
import '../cubit/status/check_internet_status.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<StartupCubit, SplashState>(
          listener: (context, state) {
            // Handle Update Dialog
            if (state.checkAppStateStatus is CheckAppStateUpdate &&
                !_isDialogShowing) {
              _isDialogShowing = true;
              final updateState =
                  state.checkAppStateStatus as CheckAppStateUpdate;
              _showUpdateDialog(
                context,
                updateState.appStatus,
                updateState.isUpdateForce,
              ).then((_) {
                _isDialogShowing = false;
              });
              return;
            }

            // Handle Server Unavailable Dialog
            if (state.checkAppStateStatus is CheckAppStateAvailability &&
                !_isDialogShowing) {
              _isDialogShowing = true;
              final errorState =
                  state.checkAppStateStatus as CheckAppStateAvailability;
              _showServerUnavailableDialog(context, errorState.message)
                  .then((_) {
                _isDialogShowing = false;
              });
              return;
            }

            // check first time
            if (state.checkFirstTimeStatus is CheckFirstTimeCompleted) {
              final isFirstTime =
                  (state.checkFirstTimeStatus as CheckFirstTimeCompleted)
                      .isFirstTime;
              if (isFirstTime) {
                Navigator.pushNamed(context, LanguageSelectionPage.routeName);
              } else {
                context.read<AuthCubit>().checkLoggedIn();
              }
            }

            // Handle Errors
            if (state.checkAppStateStatus is CheckAppStateError) {
              _showErrorDialog(
                  context,
                  (state.checkAppStateStatus as CheckAppStateError)
                      .errorMessage);
            }
            if (state.checkFirstTimeStatus is CheckFirstTimeError) {
              _showErrorDialog(
                  context,
                  (state.checkFirstTimeStatus as CheckFirstTimeError)
                      .errorMessage);
            }
          },
        ),
        // Check Logged in - User Authenticated or Not
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.authStatus is AuthAuthenticated) {
              context.read<AuthCubit>().resetIsLoggedInStatus();
              Navigator.pushNamed(context, BottomNavigator.routeName);
            } else if (state.authStatus is AuthUnauthenticated) {
              context.read<AuthCubit>().resetIsLoggedInStatus();
              Navigator.pushNamed(context, AuthScreen.routeName);
            } else if (state.authStatus is AuthError) {
              final message = (state.authStatus as AuthError).message;
              _showErrorDialog(context, message).then((_){
                context.read<AuthCubit>().resetIsLoggedInStatus();
              });
            }
          },
        )
      ],
      child: BlocBuilder<StartupCubit, SplashState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48),
                      child: DelayedWidget(
                        delayDuration: const Duration(milliseconds: 200),
                        animationDuration: const Duration(milliseconds: 1000),
                        animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
                        child: Image.asset(
                          'assets/images/HexFit Logo.png',
                          color: MyColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                  // Bottom section
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 40,
                    ),
                    child: Column(
                      children: [
                        _buildStatusText(state),
                        const SizedBox(height: 16),
                        if (state.checkInternetStatus is CheckInternetLoading ||
                            state.checkAppStateStatus is CheckAppStateLoading ||
                            state.checkFirstTimeStatus is CheckFirstTimeLoading)
                          LoadingAnimationWidget.progressiveDots(
                            color: MyColors.mainColor,
                            size: 24,
                          ),
                        if (state.checkInternetStatus is CheckInternetError)
                          TextButton.icon(
                            onPressed: () {
                              context.read<StartupCubit>().resetStatus();
                              context.read<StartupCubit>().startSplash();
                            },
                            icon: const Icon(
                              Icons.refresh,
                              color: Colors.black,
                            ),
                            label: const Text(
                              'Try Again',
                              style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildStatusText(SplashState state) {
  if (state.checkInternetStatus is CheckInternetError) {
    return const Text(
      'No internet connection',
      textAlign: TextAlign.center,
    );
  }

  if (state.checkInternetStatus is CheckInternetLoading) {
    return const Text(
      'Checking internet connection...',
      textAlign: TextAlign.center,
    );
  }

  if (state.checkInternetStatus is CheckInternetWaiting) {
    return const Text(
      'Waiting for internet connection...',
      textAlign: TextAlign.center,
    );
  }

  if (state.checkAppStateStatus is CheckAppStateLoading) {
    return const Text(
      'Checking app status...',
      textAlign: TextAlign.center,
    );
  }

  if (state.checkFirstTimeStatus is CheckFirstTimeLoading) {
    return const Text(
      'Checking user status...',
      textAlign: TextAlign.center,
    );
  }

  return const SizedBox.shrink();
}

Future<void> _showUpdateDialog(
    BuildContext context, AppStateEntity appStatus, bool isForceUpdate) async {
  await showDialog(
    context: context,
    barrierDismissible: !isForceUpdate,
    builder: (context) => AlertDialog(
      title: Text(isForceUpdate ? 'Update Required' : 'Update Available',),
      titleTextStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isForceUpdate
                ? 'A new version is required to continue using the app.'
                : 'A new version is available for download.',
          ),
          const SizedBox(height: 12),
          Text(
            'Current version: 1.0.0\nLatest version: ${appStatus.latestVersion}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      actions: [
        if (!isForceUpdate)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<StartupCubit>().continueWithoutUpdate();
            },
            child:  const Text('Later',style:TextStyle(fontSize: 16, color: Colors.grey),),
          ),
        ElevatedButton(
          onPressed: () {
            // TODO: Add URL launcher
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: MyColors.mainColor,
          ),
          child: const Text('Update Now'),
        ),
      ],
    ),
  );
}

Future<void> _showServerUnavailableDialog(
    BuildContext context, String message) async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Server Maintenance'),
      titleTextStyle: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: 16),
          const Text(
            'Please check back later.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // Close the app or retry
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
          child: const Text('Exit',style: TextStyle(fontSize: 16, color: Colors.grey),),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Retry
            context.read<StartupCubit>().resetStatus();
            context.read<StartupCubit>().startSplash();
          },
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}

// void _openAppStore() async {
//   // For Android
//   const androidUrl =
//       'https://play.google.com/store/apps/details?id=com.example.workout';
//   // For iOS (if needed)
//   const iosUrl = 'https://apps.apple.com/app/idYOUR_APP_ID';
//
//   try {
//     if (Platform.isAndroid) {
//       await launchUrl(Uri.parse(androidUrl));
//     } else if (Platform.isIOS) {
//       await launchUrl(Uri.parse(iosUrl));
//     } else {
//       // For web - open website
//       await launchUrl(Uri.parse('https://yourwebsite.com/download'));
//     }
//   } catch (e) {
//     print('Error opening store: $e');
//   }
// }

Future<void> _showErrorDialog(BuildContext context, String message) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<StartupCubit>().resetStatus();
            context.read<StartupCubit>().startSplash();
          },
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}
