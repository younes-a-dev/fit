import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import '../../../../bottom_navigator.dart';
import '../../../../common/params/verify_email_params.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/responsive/responsive_context.dart';
import '../../../../core/utils/dialog_helper.dart';
import '../../../../core/widgets/initial_button.dart';
import '../../../../core/widgets/loading_button.dart';
import '../../../../res/colors.dart';
import '../../../../core/widgets/custom_textfield_widget.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../bloc/cubit/status/verify_email_status.dart';
import '../bloc/cubit/status/verify_reset_code_status.dart';
import 'auth_screen.dart';
import 'reset_password_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({super.key});

  static const routeName = 'CodeVerificationScreen';

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final TextEditingController _codeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final email = routeArgs['email'];
    // pass is empty? its means user wants to reset password if not user wants to signup
    final pass = routeArgs['pass'] ?? '';
    final vCode = routeArgs['vCode'];

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.verifyEmailStatus is VerifyEmailCompleted) {
          if (pass.isNotEmpty) {
            // pass is not empty, user signed up and token fetched
            context.read<AuthCubit>().resetAuthStatus();
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (_) => BottomNavigator()));
          }
        }
        if (state.verifyResetCodeStatus is VerifyResetCodeCompleted) {
          context.read<AuthCubit>().resetAuthStatus();
          Navigator.of(context).pushReplacementNamed(
              ResetPasswordScreen.routeName,
              arguments: {'email': email});
        }
        if (state.verifyEmailStatus is VerifyEmailError) {
          final message = (state.verifyEmailStatus as VerifyEmailError).message;
          DialogHelper.showErrorDialog(
            context,
            title: l10n.error,
            content: message,
          ).then((_) {
            context.read<AuthCubit>().resetAuthStatus();
          });
        }
        if (state.verifyResetCodeStatus is VerifyResetCodeError) {
          final message =
              (state.verifyResetCodeStatus as VerifyResetCodeError).message;
          DialogHelper.showErrorDialog(
            context,
            title: '',
            content: message,
          ).then((_) {
            context.read<AuthCubit>().resetAuthStatus();
          });
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(AuthScreen.routeName),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              height: MediaQuery.of(context).size.height -
                  AppBar().preferredSize.height -
                  MediaQuery.of(context).padding.top,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.horizontalPadding,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: context.contentMaxWidth,
                  ),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Top section (content that scrolls)
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: context.responsive(
                                    mobile: 20,
                                    tablet: 40,
                                    desktop: 60,
                                  ),
                                ),
                                // SVG Illustration
                                SizedBox(
                                  height: context.responsive(
                                    mobile: 180,
                                    tablet: 220,
                                    desktop: 260,
                                  ),
                                  child: SvgPicture.asset(
                                    'assets/images/verify-code.svg',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Gap(
                                  context.responsive(
                                    mobile: 24,
                                    tablet: 32,
                                    desktop: 40,
                                  ),
                                ),
                                // Description Text
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.responsive(
                                      mobile: 16,
                                      tablet: 24,
                                      desktop: 32,
                                    ),
                                  ),
                                  child: Text(
                                    l10n.verifyCodeDescription,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: context.responsive(
                                        mobile: 14,
                                        tablet: 15,
                                        desktop: 16,
                                      ),
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ),
                                Gap(
                                  context.responsive(
                                    mobile: 8,
                                    tablet: 10,
                                    desktop: 12,
                                  ),
                                ),
                                // Email Display
                                Text(
                                  email,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.responsive(
                                      mobile: 16,
                                      tablet: 18,
                                      desktop: 20,
                                    ),
                                    color: MyColors.mainColor,
                                  ),
                                ),
                                Gap(
                                  context.responsive(
                                    mobile: 32,
                                    tablet: 40,
                                    desktop: 48,
                                  ),
                                ),
                                // Code Input Field
                                SizedBox(
                                  width: context.responsive(
                                    mobile: double.infinity,
                                    tablet: 400,
                                    desktop: 500,
                                  ),
                                  child: CustomTextFormFieldWidget(
                                    controller: _codeController,
                                    hintText: '* * * * * *',
                                    prefixIcon: null,
                                    maxLen: 6,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.done,
                                    obscureText: false,
                                    textAlign: TextAlign.center,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return l10n.verificationCodeRequired;
                                      }
                                      if (value.length != 6) {
                                        return l10n.verificationCodeLength;
                                      }
                                      if (!RegExp(r'^[0-9]+$')
                                          .hasMatch(value)) {
                                        return l10n.verificationCodeNumbersOnly;
                                      }
                                      return null;
                                    },
                                    onChangeFunction: (value) {},
                                  ),
                                ),
                                SizedBox(
                                  height: context.responsive(
                                    mobile: 40,
                                    tablet: 60,
                                    desktop: 80,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // Bottom section (confirm button)
                        Padding(
                          padding: EdgeInsets.only(
                            bottom: context.responsive(
                              mobile: 24,
                              tablet: 32,
                              desktop: 40,
                            ),
                          ),
                          child: SizedBox(
                            width: context.responsive(
                              mobile: double.infinity,
                              tablet: 400,
                              desktop: 500,
                            ),
                            child: BlocBuilder<AuthCubit, AuthState>(
                              builder: (context, state) {
                                if (state.verifyResetCodeStatus
                                        is VerifyResetCodeLoading ||
                                    state.verifyEmailStatus
                                        is VerifyEmailLoading) {
                                  return const LoadingButton();
                                }
                                return InitialButton(
                                  title: l10n.confirm,
                                  onTap: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      if (vCode == _codeController.text) {
                                        if (pass.isEmpty) {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                            ResetPasswordScreen.routeName,
                                            arguments: email,
                                          );
                                        } else {
                                          // Verify Email
                                          context
                                              .read<AuthCubit>()
                                              .verifyEmail(VerifyEmailParams(
                                                email: email,
                                                code: _codeController.text,
                                              ));
                                        }
                                      } else {
                                        DialogHelper.showErrorDialog(
                                          context,
                                          title: l10n.invalidCode,
                                          content: l10n.invalidCodeMessage,
                                        );
                                      }
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
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
}
