import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:workout/features/feature_auth/presentation/widgets/initial_button.dart';
import 'package:workout/features/feature_auth/presentation/widgets/loading_button.dart';

import '../../../../common/cubit/button_cubit.dart';
import '../../../../common/cubit/button_state.dart';
import '../../../../locator.dart';
import '../../../../res/colors.dart';
import '../../../../widgets/custom_textfield_widget.dart';
import '../../domin/usecase/pass_change_code_usecase.dart';
import 'code_verification_screen.dart';

class EnterEmailForPassResetScreen extends StatefulWidget {
  const EnterEmailForPassResetScreen({super.key});

  static const routeName = '/ForgetPasswordScreen';

  @override
  State<EnterEmailForPassResetScreen> createState() =>
      _EnterEmailForPassResetScreenState();
}

class _EnterEmailForPassResetScreenState
    extends State<EnterEmailForPassResetScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonStateSuccess) {
          _dialog(
                  'Check Your Email',
                  'We’ve sent a code to your email address to reset your password',
                  MyColors.mainColor)
              .then((_) => Navigator.of(context).pushReplacementNamed(
                      CodeVerificationScreen.routeName,
                      arguments: {
                        'email': _emailController.text,
                        'cCode': state.data,
                        'pass': '',
                      }));
        }
        if (state is ButtonStateFailure) {
          _dialog(
            'Somthing went wrong',
            'Try again',
            const Color(0xffe63230),
          );
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                // Back Button
                Positioned(
                  top: 30,
                  left: 20,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      )),
                ),
                Positioned(
                  top: size.width / 3.5,
                  left: 30,
                  right: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Gap(36),
                      Text(
                        'Forgot your password?',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                      const Gap(16),
                      Text(
                        'Enter your registered email below\nand we’ll send you a code to reset your password.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: MyColors.grey),
                      ),
                      const Gap(36),
                      // text field
                      CustomTextFieldWidget(
                        controller: _emailController,
                        hintText: 'Email Address',
                        prefixIcon: flu.FluentIcons.mail_solid,
                        onChangeFunction: (value) {},
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 70,
                  right: 30,
                  left: 30,
                  child: BlocBuilder<ButtonCubit, ButtonState>(
                    builder: (context, state) {
                      if (state is ButtonStateLoading) {
                        return LoadingButton();
                      } else {
                        return InitialButton(
                            title: 'Send',
                            onTap: () {
                              context.read<ButtonCubit>().execute(
                                    usecase: sl<PassChangeCodeUsecase>(),
                                    params: _emailController.text,
                                  );
                            });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
