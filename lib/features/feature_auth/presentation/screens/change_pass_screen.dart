import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../common/cubit/button_cubit.dart';
import '../../../../common/cubit/button_state.dart';
import '../../../../common/params/change_pass_params.dart';
import '../../../../locator.dart';
import '../../../../res/colors.dart';
import '../../../../widgets/custom_textfield_widget.dart';

import '../../domain/usecase/change_pass_usecase.dart';
import '../widgets/initial_button.dart';
import '../widgets/loading_button.dart';
import 'auth_screen.dart';

class ChangePassScreen extends StatefulWidget {
  const ChangePassScreen({super.key});

  static const routeName = 'ChangePassScreen';

  @override
  State<ChangePassScreen> createState() => _ChangePassScreenState();
}

class _ChangePassScreenState extends State<ChangePassScreen> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _pass2Controller = TextEditingController();

  @override
  void dispose() {
    _passController.dispose();
    _pass2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final email = ModalRoute.of(context)!.settings.arguments as String;
    final size = MediaQuery.of(context).size;
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonStateSuccess) {
          _dialog(
                  'Password Changed Successfully',
                  'Your password has been updated! You can now use your new password to log in.',
                  Colors.green)
              .then((_) {
            Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
          });
        }
        if (state is ButtonStateFailure) {
          _dialog(
                  'Oops! Something Went Wrong',
                  'We couldn’t update your password.Try again later',
                  Colors.green)
              .then((_) {
            Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
          });
        }
      },
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(40),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AuthScreen.routeName);
                },
                child: Icon(
                  Icons.close,
                  color: Colors.black,
                ),
              ),
              Gap(70),
              Text(
                'Create a new password',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const Gap(36),
              Text(
                'Enter your new password below.\nMake sure it’s strong and easy for you to remember.',
                style: TextStyle(
                  color: MyColors.grey,
                  fontSize: 16,
                ),
              ),
              const Gap(24),
              CustomTextFieldWidget(
                controller: _passController,
                hintText: 'New Password',
                prefixIcon: flu.FluentIcons.lock_solid,
                onChangeFunction: (value) {},
              ),
              const Gap(12),
              CustomTextFieldWidget(
                controller: _pass2Controller,
                hintText: 'Confirm New Password',
                prefixIcon: flu.FluentIcons.lock_solid,
                onChangeFunction: (value) {},
              ),
              BlocBuilder<ButtonCubit, ButtonState>(
                builder: (context, state) {
                  if (state is ButtonStateLoading) {
                    return LoadingButton();
                  } else {
                    return InitialButton(
                      title: 'Confirm',
                      onTap: () {
                        if (_passController.text == _pass2Controller.text) {
                          context.read<ButtonCubit>().execute(
                              usecase: sl<ChangePassUsecase>(),
                              params: ChangePassParams(
                                  email: email,
                                  password: _passController.text));
                        }
                      },
                    );
                  }
                },
              )
            ],
          ),
        ),
      )),
    );
  }

  Future<void> _dialog(String title, String content, Color contentColor) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
              title: Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              content: Text(
                content,
                textAlign: TextAlign.center,
              ),
              actions: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    height: 48,
                    width: 282,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: MyColors.mainColor,
                    ),
                    child: Text(
                      'OK',
                    ),
                  ),
                ),
              ],
            ));
  }
}
