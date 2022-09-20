import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:workout/view/forget_password_screen.dart';
import '../../bottom_navigator.dart';
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

class _AuthScreenState extends State<AuthScreen> {

  bool isRemember = false;
  AuthMode _authMode = AuthMode.login;

  Widget _buildTextField (IconData icon,String hintText){
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: TextField(
        keyboardType: TextInputType.visiblePassword,
        //textAlign: TextAlign.start,
        cursorHeight: 22,
        cursorColor: Colors.yellow,
        style: const TextStyle(
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.black45,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none,
                width: 0),
          ),
          //contentPadding: EdgeInsets.only(bottom: 10),
          contentPadding: EdgeInsets.fromLTRB(20, 30, 20, 20),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none,
                width: 0),
          ),
          disabledBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.transparent,
                style: BorderStyle.none,
                width: 0),
          ),
          prefixIcon:  Icon(
            icon,
            color: Colors.white,
          ),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Gap(Get.size.height / 6.5),
            const Icon(
              flu.FluentIcons.hexagon,
              color: Colors.yellow,
              size: 100,
            ),
            const Gap(20),
            RichText(
              text:  TextSpan(
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 45,
                ),
                children: [
                  const TextSpan(
                    text: 'SIGN',

                  ),
                  TextSpan(
                    text: _authMode == AuthMode.login ? 'IN' : 'UP',
                    style: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(100),
            _buildTextField(flu.FluentIcons.mail_solid, 'Email Address'),
            _buildTextField(flu.FluentIcons.lock, 'Password'),
            if(_authMode == AuthMode.signup)
              _buildTextField(flu.FluentIcons.lock, 'Confirm Password'),
            Container(
              alignment: Alignment.centerRight,
              margin: EdgeInsets.only(right: 35, left: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Checkbox(
                    value: isRemember,
                    fillColor: MaterialStateProperty.all(Colors.black45),
                    checkColor: Colors.yellow,
                    onChanged: (value) {
                      setState(() {
                        isRemember = value!;
                      });
                    },
                  ),
                  Text(
                    'Remember me',
                    style: TextStyle(
                        color: Colors.black87, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Get.to(() => const ForgetPasswordScreen());
                    },
                    child: const Text(
                      'Forget password?',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 35, right: 35, top: 80),
              height: 60,
              width: Get.size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => IntroSlider(),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black87),
                  elevation: MaterialStateProperty.all(0),
                ),
                child:  Text(
                  _authMode == AuthMode.login ?'Sign in' : 'Sign Up',
                  style: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
            const Gap(10),
            GestureDetector(
              onTap: () {
                setState(() {
                  if(_authMode == AuthMode.login){
                    _authMode = AuthMode.signup;
                  }else if(_authMode == AuthMode.signup){
                    _authMode = AuthMode.login;
                  }
                });
              },
              child: Container(
                alignment: Alignment.centerRight,
                margin: const EdgeInsets.only(right: 35),
                child: RichText(
                  text:  TextSpan(
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: _authMode == AuthMode.login ?
                        'Don\'t have an Account? ' : 'Have a Account?',
                        // style: TextStyle(
                        //   color: Colors.yellow,
                        //   fontWeight: FontWeight.bold,
                        //   fontSize: 34,
                        // ),
                      ),
                      TextSpan(
                        text: _authMode == AuthMode.login ? 'Sign Up' :
                        'Sign In',
                        style: TextStyle(
                          color: Colors.yellow,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
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
