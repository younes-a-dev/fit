import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:workout/features/feature_user/presentation/cubit/get_current_user_status.dart';

import '../../../../bottom_navigator.dart';
import '../../../../common/params/sign_in_params.dart';
import '../../../../common/params/sign_up_params.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/responsive/responsive_context.dart';
import '../../../../core/utils/dialog_helper.dart';
import '../../../../core/utils/validators.dart';
import '../../../feature_user/presentation/cubit/user_cubit.dart';
import '../../../feature_user/presentation/screen/initial_profile_setup_screen.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../bloc/cubit/status/sign_in_with_email_status.dart';
import '../bloc/cubit/status/sign_up_with_email_status.dart';
import 'request_reset_code_screen.dart';
import '../../../../res/colors.dart';
import '../../../../core/widgets/custom_textfield_widget.dart';
import '../../../../core/widgets/initial_button.dart';
import '../../../../core/widgets/loading_button.dart';
import 'verify_code_screen.dart';

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
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  AuthMode _authMode = AuthMode.login;
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state.signInWithEmailStatus is SignInWithEmailCompleted) {
              context.read<UserCubit>().getCurrentUserEvent();
              context.read<AuthCubit>().resetAuthStatus();
            }
            if (state.signUpWithEmailStatus is SignUpWithEmailCompleted) {
              context.read<AuthCubit>().resetAuthStatus();
              DialogHelper.showInfoDialog(
                context,
                title: '',
                content:
                    '${l10n.checkYourEmail}\n${l10n.verificationCodeSent} ${_emailController.text}',
              ).then((_) => Navigator.of(context).pushReplacementNamed(
                    VerifyCodeScreen.routeName,
                  ));
            }
            if (state.signUpWithEmailStatus is SignUpWithEmailError) {
              final message =
                  (state.signUpWithEmailStatus as SignUpWithEmailError).message;

              DialogHelper.showErrorDialog(
                context,
                title: l10n.error,
                content: message,
              ).then((_) {
                context.read<AuthCubit>().resetAuthStatus();
              });
            }
            if (state.signInWithEmailStatus is SignInWithEmailError) {
              final message =
                  (state.signInWithEmailStatus as SignInWithEmailError).message;

              DialogHelper.showErrorDialog(
                context,
                title: 'Error',
                content: message,
              ).then((_) {
                context.read<AuthCubit>().resetAuthStatus();
              });
            }
          },
        ),
        BlocListener<UserCubit, UserState>(
          listener: (context, state) {
            if (state.getCurrentUserStatus is GetCurrentUserCompleted) {
              final user =
                  (state.getCurrentUserStatus as GetCurrentUserCompleted).user;
              if (!user.initialSetupCompleted) {
                Navigator.of(context)
                    .pushReplacementNamed(InitialProfileSetupScreen.routeName);
                context.read<UserCubit>().resetStatus();
              } else {
                Navigator.pushReplacementNamed(
                    context, BottomNavigator.routeName);
                context.read<UserCubit>().resetStatus();
              }
            }
          },
        ),
      ],
      child: Scaffold(
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.horizontalPadding,
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: context.contentMaxWidth,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildLogo(),
                          _buildTitle(),
                          Gap(
                            context.responsive(
                              mobile: 32,
                              tablet: 36,
                              desktop: 32,
                            ),
                          ),
                          _buildForm(l10n),
                          Gap(4),
                          _buildForgotButton(l10n),
                          SizedBox(
                            height: context.responsive(
                              mobile: 35,
                              tablet: 35,
                              desktop: 35,
                            ),
                          ),
                          _buildSignUpInButton(l10n),
                          const SizedBox(height: 10),
                          _buildSwitchSignUpInButton(l10n),
                          SizedBox(
                            height: context.responsive(
                              mobile: 20,
                              tablet: 30,
                              desktop: 40,
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(InitialProfileSetupScreen.routeName);
                              },
                              child: Text('init screen'))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: context.responsive(
        mobile: 100,
        tablet: 120,
        desktop: 160,
      ),
      width: context.responsive(
        mobile: 220,
        tablet: 300,
        desktop: 350,
      ),
      child: Image.asset(
        'assets/images/HexFit Logo.png',
        color: MyColors.mainColor,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitle() {
    final l10n = AppLocalizations.of(context)!;
    return l10n.localeName == 'en'
        ? RichText(
            text: TextSpan(
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: context.responsive(
                  mobile: 40,
                  tablet: 45,
                  desktop: 55,
                ),
                fontWeight: FontWeight.bold,
                fontFamily: 'Raleway',
              ),
              children: [
                const TextSpan(text: 'SIGN'),
                TextSpan(
                  text: _authMode == AuthMode.login ? 'IN' : 'UP',
                  style: const TextStyle(
                    color: MyColors.mainColor,
                    fontFamily: 'Raleway',
                  ),
                ),
              ],
            ),
          )
        : Text(
            _authMode == AuthMode.login ? l10n.signInTitle : l10n.signUpTitle,
            style: TextStyle(
              color: MyColors.black,
              fontSize: context.responsive(
                mobile: 40,
                tablet: 45,
                desktop: 55,
              ),
              fontWeight: FontWeight.bold,
              fontFamily: 'Raleway',
            ),
            textAlign: TextAlign.center,
          );
  }

  Widget _buildForm(AppLocalizations l10n) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Column(
        children: [
          CustomTextFormFieldWidget(
            controller: _emailController,
            hintText: l10n.emailAddress,
            prefixIcon: flu.FluentIcons.mail_solid,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            validator: (value) => Validators.email(
              value,
              l10n,
            ),
            onChangeFunction: (value) {},
          ),
          const SizedBox(height: 16),
          CustomTextFormFieldWidget(
            controller: _passwordController,
            hintText: l10n.password,
            prefixIcon: flu.FluentIcons.lock_solid,
            textInputAction: _authMode == AuthMode.login
                ? TextInputAction.done
                : TextInputAction.next,
            validator: (value) => Validators.password(
              value,
              l10n,
            ),
            obscureText: true,
            onChangeFunction: (value) {},
          ),
          // Only show confirm password field when in signup mode
          if (_authMode == AuthMode.signup) ...[
            const SizedBox(height: 16),
            CustomTextFormFieldWidget(
              controller: _confirmPasswordController,
              hintText: l10n.confirmPassword,
              prefixIcon: flu.FluentIcons.lock_solid,
              obscureText: true,
              validator: (value) => Validators.confirmPassword(
                value,
                _passwordController.text,
                l10n,
              ),
              onChangeFunction: (value) {},
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildForgotButton(AppLocalizations l10n) {
    return Container(
      alignment: l10n.localeName == 'en'
          ? Alignment.centerRight
          : Alignment.centerLeft,
      margin: EdgeInsets.symmetric(
        horizontal: context.responsive(
          mobile: 20,
          tablet: 30,
          desktop: 35,
        ),
      ),
      child: TextButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RequestResetCodeScreen.routeName);
        },
        child: Text(
          l10n.forgotPassword,
          style: TextStyle(
            color: Theme.of(context).canvasColor,
            fontSize: context.responsive(
              mobile: 13,
              tablet: 14,
              desktop: 15,
            ),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpInButton(AppLocalizations l10n) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state.signUpWithEmailStatus is SignUpWithEmailLoading ||
            state.signInWithEmailStatus is SignInWithEmailLoading) {
          return const LoadingButton();
        } else {
          return InitialButton(
            onTap: () {
              // Validate the form
              if (_formKey.currentState?.validate() ?? false) {
                if (_authMode == AuthMode.login) {
                  context.read<AuthCubit>().signInWithEmail(
                        SignInWithEmailParams(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        ),
                      );
                } else {
                  // Signup mode - validation already covers confirm password
                  context.read<AuthCubit>().signUpWithEmail(
                        SignUpWithEmailParams(
                          email: _emailController.text.trim(),
                          password: _passwordController.text,
                        ),
                      );
                }
              }
            },
            title: _authMode == AuthMode.login ? l10n.signIn : l10n.signUp,
          );
        }
      },
    );
  }

  Widget _buildSwitchSignUpInButton(AppLocalizations l10n) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (_authMode == AuthMode.login) {
            _authMode = AuthMode.signup;
          } else {
            _authMode = AuthMode.login;
            // Clear confirm password when switching to login
            _confirmPasswordController.clear();
          }
          // Reset form validation state
          _formKey.currentState?.reset();
        });
      },
      child: Container(
        alignment: l10n.localeName == 'en'
            ? Alignment.centerRight
            : Alignment.centerLeft,
        margin: EdgeInsets.only(
          right: context.responsive(
            mobile: 20,
            tablet: 30,
            desktop: 35,
          ),
        ),
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              color: Theme.of(context).canvasColor,
              fontSize: context.responsive(
                mobile: 13,
                tablet: 14,
                desktop: 15,
              ),
            ),
            children: [
              TextSpan(
                text: _authMode == AuthMode.login
                    ? l10n.dontHaveAccount
                    : l10n.haveAccount,
              ),
              TextSpan(
                text: _authMode == AuthMode.login ? l10n.signUp : l10n.signIn,
                style: const TextStyle(
                  color: MyColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
