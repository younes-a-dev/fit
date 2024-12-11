import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:workout/common/params/change_pass_params.dart';
import 'package:workout/features/feature_auth/presentation/widgets/initial_button.dart';

import '../../../../bottom_navigator.dart';
import '../../../../common/cubit/button_cubit.dart';
import '../../../../common/cubit/button_state.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../locator.dart';
import '../../domin/usecase/sign_up_usecase.dart';
import '../widgets/loading_button.dart';
import 'auth_screen.dart';
import 'change_pass_screen.dart';

class CodeVerificationScreen extends StatefulWidget {
  const CodeVerificationScreen({super.key});

  static const routeName = 'CodeVerificationScreen';

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  final TextEditingController _codeController = TextEditingController();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = routeArgs['email'];
    // pass is empty? its means user wants to reset password if not user wants to signup
    final pass = routeArgs['pass'] ?? '';
    final cCode = routeArgs['cCode'];
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonStateSuccess) {
            if (pass != '') {
              // pass is not empty, user signed up and token fetched
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => BottomNavigator()));
            }
          }
          if (state is ButtonStateFailure) {
            _dialog(
              '''Try again!\n The code you entered is Wrong''',
              const Color(0xffe63230),
            );
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: SizedBox(
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  // Back Button
                  Positioned(
                    top: 30,
                    left: 20,
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(AuthScreen.routeName);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                  ),
                  Positioned(
                    left: 30,
                    right: 30,
                    top: 140,
                    child: SizedBox(
                        height: 200,
                        width: 300,
                        child:
                            SvgPicture.asset('assets/images/verify-code.svg')),
                  ),
                  Positioned(
                    top: 345,
                    left: 30,
                    right: 30,
                    child: Column(
                      children: [
                        Text(
                          'Please type the verification code sent to \n $email',
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                        const Gap(36),
                        SizedBox(
                          width: size.width / 2,
                          child: TextField(
                            controller: _codeController,
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            textInputAction: TextInputAction.done,
                            textAlignVertical: TextAlignVertical.center,
                            maxLength: 6,
                            style: const TextStyle(
                                color: Color(0xff00a996),
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                            cursorColor: const Color(0xff00a996),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0x128909090),
                              hintText: '* * * * * *',
                              hintStyle: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide.none,
                              ),
                              counterText: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BlocBuilder<ButtonCubit, ButtonState>(
                    builder: (context, state) {
                      if (state is ButtonStateLoading) {
                        return Positioned(
                            bottom: 100,
                            left: 15,
                            right: 15,
                            child: LoadingButton());
                      }
                      return Positioned(
                        bottom: 100,
                        left: 15,
                        right: 15,
                        child: InitialButton(
                            title: 'Confirm',
                            onTap: () {
                              if (cCode == _codeController.text) {
                                if (pass == '') {
                                  Navigator.of(context).pushReplacementNamed(
                                      ChangePassScreen.routeName,
                                      arguments: email);
                                  return state = ButtonStateSuccess();
                                }
                                context.read<ButtonCubit>().execute(
                                    usecase: sl<SignUpUsecase>(),
                                    params: SignUpParams(
                                        email: email, password: pass));
                              }
                            }),
                      );
                    },
                  )
                ],
              ),
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
                      color: const Color(0xff00a996),
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
