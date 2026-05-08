import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../../bottom_navigator.dart';
import '../../../../res/colors.dart';
import '../../../feature_auth/presentation/screens/auth_screen.dart';
import '../../../language/presentation/screens/language_selection_page.dart';
import '../../domain/entity/app_state_entity.dart';
import '../cubit/startup_cubit.dart';
import '../cubit/status/check_app_state_status.dart';
import '../cubit/status/check_first_time_status.dart';
import '../cubit/status/check_internet_status.dart';
import '../cubit/status/check_logged_in_status.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isDialogShowing = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashCubit, SplashState>(
      listener: (context, state) {
        // Handle Update Dialog
        if (state.checkAppStateStatus is CheckAppStateUpdate && !_isDialogShowing) {
          _isDialogShowing = true;
          final updateState = state.checkAppStateStatus as CheckAppStateUpdate;
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
        if (state.checkAppStateStatus is CheckAppStateAvailability && !_isDialogShowing) {
          _isDialogShowing = true;
          final errorState = state.checkAppStateStatus as CheckAppStateAvailability;
          _showServerUnavailableDialog(context, errorState.message).then((_) {
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
            context.read<SplashCubit>().checkLoggedIn();
          }
        }

        // Check Logged in
        if (state.checkLoggedInStatus is CheckLoggedInCompleted) {
          final isLoggedIn =
              (state.checkLoggedInStatus as CheckLoggedInCompleted).isLoggedIn;
          if (isLoggedIn) {
            Navigator.pushNamed(context, BottomNavigator.routeName);
          } else {
            Navigator.pushNamed(context, AuthScreen.routeName);
          }
        }

        // Handle Errors
        if (state.checkInternetStatus is CheckInternetError) {
          _showErrorDialog(context,
              'No Internet Connection. Please check your connection and try again.');
        }

        if (state.checkAppStateStatus is CheckAppStateError) {
          _showErrorDialog(
              context, (state.checkAppStateStatus as CheckAppStateError).errorMessage);
        }

        if (state.checkFirstTimeStatus is CheckFirstTimeError) {
          _showErrorDialog(context,
              (state.checkFirstTimeStatus as CheckFirstTimeError).errorMessage);
        }

        if (state.checkLoggedInStatus is CheckLoggedInError) {
          _showErrorDialog(context,
              (state.checkLoggedInStatus as CheckLoggedInError).errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
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
                const SizedBox(height: 20),
                _buildStatusText(state),
                const SizedBox(height: 20),
                if (state.checkInternetStatus is CheckInternetLoading ||
                    state.checkAppStateStatus is CheckAppStateLoading ||
                    state.checkFirstTimeStatus is CheckFirstTimeLoading ||
                    state.checkLoggedInStatus is CheckLoggedInLoading)
                  Directionality(
                    textDirection: TextDirection.ltr,
                    child: LoadingAnimationWidget.progressiveDots(
                      color: MyColors.mainColor,
                      size: 24,
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}

Widget _buildStatusText(SplashState state) {
  if (state.checkInternetStatus is CheckInternetLoading) {
    return const Text('Checking internet connection...');
  }
  if (state.checkAppStateStatus is CheckAppStateLoading) {
    return const Text('Checking app status...');
  }
  if (state.checkFirstTimeStatus is CheckFirstTimeLoading) {
    return const Text('Checking user status...');
  }
  if (state.checkLoggedInStatus is CheckLoggedInLoading) {
    return const Text('Checking login status...');
  }
  return const SizedBox.shrink();
}

Future<void> _showUpdateDialog(
    BuildContext context, AppStateEntity appStatus, bool isForceUpdate)async {
  await showDialog(
    context: context,
    barrierDismissible: !isForceUpdate,
    builder: (context) => AlertDialog(
      title: Text(isForceUpdate ? 'Update Required' : 'Update Available'),
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
          Text(
            'Minimum required version: ${appStatus.minVersion}',
            style: const TextStyle(fontSize: 12, color: Colors.orange),
          ),
        ],
      ),
      actions: [
        if (!isForceUpdate)
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              context.read<SplashCubit>().continueWithoutUpdate();
            },
            child: const Text('Later'),
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

Future<void> _showServerUnavailableDialog(BuildContext context, String message)async {
  await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Server Maintenance'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.build, size: 48, color: Colors.orange),
          const SizedBox(height: 16),
          Text(message),
          const SizedBox(height: 12),
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
          child: const Text('Exit'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Retry
            context.read<SplashCubit>().resetStatus();
            context.read<SplashCubit>().startSplash();
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

void _showErrorDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => AlertDialog(
      title: const Text('Error'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            context.read<SplashCubit>().resetStatus();
            context.read<SplashCubit>().startSplash();
          },
          child: const Text('Retry'),
        ),
      ],
    ),
  );
}
