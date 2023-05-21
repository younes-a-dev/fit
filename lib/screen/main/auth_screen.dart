import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:workout/screen/forget_password_screen.dart';
import '../../res/colors.dart';
import '../../widgets/custom_textfield_widget.dart';
import '../intro_slider.dart';

enum AuthMode {
  signup,
  login,
}

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isRemember = false;
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
        ));
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Get.size.height / 9.5),
            SizedBox(
              height: size.height * .2,
              width: size.width * .7,
              child: Image.asset(
                'assets/images/HexFit Logo.png',
                color: MyColors.mainColor,
              ),
            ),
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
            AnimatedContainer(
              height: _authMode == AuthMode.login
                  ? size.height * .23
                  : size.height * .3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              // constraints: BoxConstraints(
              //   minHeight: authMode == AuthMode.login ? size.height * .2 : size
              //       .height * .3,
              // ),
              child: Column(
                children: [
                  CustomTextFieldWidget(
                    controller: _emailController,
                    hintText: 'Email Address',
                    prefixIcon: flu.FluentIcons.mail_solid,
                    onChangeFunction: (value) {},
                  ),
                  const Gap(20),
                  CustomTextFieldWidget(
                    controller: _passwordController,
                    hintText: 'Password',
                    prefixIcon: flu.FluentIcons.lock_solid,
                    onChangeFunction: (value) {},
                  ),
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
                              controller: _passwordController,
                              hintText: 'Confirm Password',
                              prefixIcon: flu.FluentIcons.lock_solid,
                              onChangeFunction: (value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 35, left: 35),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Checkbox(
                          value: isRemember,
                          fillColor: MaterialStateProperty.all(
                            Theme.of(context).canvasColor,
                          ),
                          checkColor: MyColors.mainColor,
                          onChanged: (value) {
                            setState(() {
                              isRemember = value!;
                            });
                          },
                        ),
                        Text(
                          'Remember me',
                          style: TextStyle(
                            color: Theme.of(context).canvasColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(ForgetPasswordScreen.routeName);
                          },
                          child: Text(
                            'Forget password?',
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
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 40),
              height: 60,
              width: Get.size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(IntroSlider.routeName);
                },
                child: Text(
                  _authMode == AuthMode.login ? 'Sign in' : 'Sign Up',
                ),
              ),
            ),
            const Gap(10),
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
                        text:
                            _authMode == AuthMode.login ? 'Sign Up' : 'Sign In',
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
    );
  }
}
