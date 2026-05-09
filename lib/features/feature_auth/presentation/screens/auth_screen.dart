import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import '../../../../bottom_navigator.dart';
import '../../../../common/cubit/button_cubit.dart';
import '../../../../common/cubit/button_state.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../locator.dart';
import 'enter_email_for_pass_reset_screen.dart';
import '../../../../res/colors.dart';
import '../../../../widgets/custom_textfield_widget.dart';
import '../../domain/usecase/send_email_usecase.dart';
import '../../domain/usecase/signin_usecase.dart';
import '../widgets/initial_button.dart';
import '../widgets/loading_button.dart';
import 'code_verification_screen.dart';

enum AuthMode {
  signup,
  login,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const routeName = 'AuthScreen';

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  AuthMode _authMode = AuthMode.login;
  late Animation<Offset> _slidAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );
    _slidAnimation =
        Tween<Offset>(begin: const Offset(0, -1.5), end: const Offset(0, 0))
            .animate(CurvedAnimation(
                parent: _animationController, curve: Curves.fastOutSlowIn));
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  // Future<void> _submit() async {
  //   // if (!_formKey.currentState.validate()) {
  //   //   // Invalid!
  //   //   return;
  //   // }
  //   _formKey.currentState?.save();
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   try {
  //     if (_authMode == AuthMode.login) {
  //       // Log user in
  //       await Provider.of<Auth>(context, listen: false).login(
  //         _authData['email'],
  //         _authData['password'],
  //       );
  //     } else {
  //       // Sign user up
  //       await Provider.of<Auth>(context, listen: false).signup(
  //         _authData['email'],
  //         _authData['password'],
  //       );
  //     }
  //   } on HttpException catch (error) {
  //     var errorMessage = 'Authentication failed';
  //     if (error.toString().contains('EMAIL_EXISTS')) {
  //       errorMessage = 'This email address is already in use.';
  //     } else if (error.toString().contains('INVALID_EMAIL')) {
  //       errorMessage = 'This is not a valid email address';
  //     } else if (error.toString().contains('WEAK_PASSWORD')) {
  //       errorMessage = 'This password is too weak.';
  //     } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
  //       errorMessage = 'Could not find a user with that email.';
  //     } else if (error.toString().contains('INVALID_PASSWORD')) {
  //       errorMessage = 'Invalid password.';
  //     }
  //     _showErrorDialog(errorMessage);
  //   } catch (error) {
  //     const errorMessage =
  //         'Could not authenticate you. Please try again later.';
  //     _showErrorDialog(errorMessage);
  //   }

  //   setState(() {
  //     _isLoading = false;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonStateSuccess) {
            if (_authMode == AuthMode.login) {
              Navigator.of(context)
                  .pushReplacementNamed(BottomNavigator.routeName);
            } else {
              _dialog('Check Your Email\nWe’ve sent a 6-digit verification code to ${_emailController.text}',
                      MyColors.mainColor)
                  .then((_) => Navigator.of(context).pushReplacementNamed(
                          CodeVerificationScreen.routeName,
                          arguments: {
                            'email': _emailController.text,
                            'pass': _passwordController.text,
                            'cCode': state.data,
                          }));
            }
          }
          if (state is ButtonStateFailure) {
            _dialog(
              '''Somthing went wrong\nTry again''',
              const Color(0xffe63230),
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Gap(size.height / 9.5),
                // logo image
                SizedBox(
                  height: size.height * .2,
                  width: size.width * .7,
                  child: Image.asset(
                    'assets/images/HexFit Logo.png',
                    color: MyColors.mainColor,
                  ),
                ),
                // sign up-in text 
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                    ),
                    children: [
                      const TextSpan(
                        text: 'SIGN',
                      ),
                      TextSpan(
                        text: _authMode == AuthMode.login ? 'IN' : 'UP',
                        style: const TextStyle(
                            color: MyColors.mainColor, fontFamily: 'Raleway'),
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                // text fields and forgot pass btn
                AnimatedContainer(
                  height: _authMode == AuthMode.login
                      ? size.height * .23
                      : size.height * .3,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  child: Column(
                    children: [
                      // Email ttext field
                      CustomTextFieldWidget(
                        controller: _emailController,
                        hintText: 'Email Address',
                        prefixIcon: flu.FluentIcons.mail_solid,
                        onChangeFunction: (value) {},
                      ),
                      const Gap(20),
                      // Pass text field
                      CustomTextFieldWidget(
                        controller: _passwordController,
                        hintText: 'Password',
                        prefixIcon: flu.FluentIcons.lock_solid,
                        onChangeFunction: (value) {},
                      ),
                      // Confirm pass text field with animation 
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        constraints: BoxConstraints(
                          minHeight: _authMode == AuthMode.signup ? 40 : 0,
                          maxHeight: _authMode == AuthMode.signup ? 80 : 0,
                        ),
                        child: FadeTransition(
                          opacity: _opacityAnimation,
                          child: SlideTransition(
                            position: _slidAnimation,
                            child: Column(
                              children: [
                                const Gap(20),
                                CustomTextFieldWidget(
                                  controller: _confirmPasswordController,
                                  hintText: 'Confirm Password',
                                  prefixIcon: flu.FluentIcons.lock_solid,
                                  onChangeFunction: (value) {},
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Forgot password text button
                      Container(
                        alignment: Alignment.centerRight,
                        margin: const EdgeInsets.only(right: 35, left: 35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    EnterEmailForPassResetScreen.routeName);
                              },
                              child: Text(
                                'Forget password ?',
                                style: TextStyle(
                                    color: Theme.of(context).canvasColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Sign in-up Button
                BlocBuilder<ButtonCubit, ButtonState>(
                    builder: (context, state) {
                  if (state is ButtonStateLoading) {
                    return LoadingButton();
                  } else {
                    return InitialButton(
                      onTap: () {
                        if (_authMode == AuthMode.login) {
                          context.read<ButtonCubit>().execute(
                              usecase: sl<SigninUsecase>(),
                              params: SignInParams(
                                  email: _emailController.text,
                                  password: _passwordController.text));
                        } else {
                          if (_passwordController.text ==
                              _confirmPasswordController.text) {
                            context.read<ButtonCubit>().execute(
                                usecase: sl<SendEmailUsecase>(),
                                params: _emailController.text);
                          }
                        }
                      },
                      title:
                          _authMode == AuthMode.login ? 'Sign in' : 'Sign Up',
                    );
                  }
                }),

                const Gap(10),
                // TextButton for switch Sign up-in 
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_authMode == AuthMode.login) {
                        _authMode = AuthMode.signup;
                        _animationController.forward();
                      } else if (_authMode == AuthMode.signup) {
                        _authMode = AuthMode.login;
                        _animationController.reverse();
                      }
                    });
                  },
                  child: Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 35),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Theme.of(context).canvasColor,
                          fontSize: 13,
                        ),
                        children: [
                          TextSpan(
                            text: _authMode == AuthMode.login
                                ? 'Don\'t have an Account? '
                                : 'Have a Account? ',
                          ),
                          TextSpan(
                            text: _authMode == AuthMode.login
                                ? 'Sign Up'
                                : 'Sign In',
                            style: const TextStyle(
                              color: MyColors.mainColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _dialog(String content, Color contentColor) {
    return showDialog(
        context: context,
        builder: (_) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 26),
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
