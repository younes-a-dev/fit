import 'package:flutter/material.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../../../common/params/reset_password_params.dart';
import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/responsive/responsive_context.dart';
import '../../../../core/utils/dialog_helper.dart';
import '../../../../core/utils/validators.dart';
import '../../../../res/colors.dart';
import '../../../../core/widgets/custom_textfield_widget.dart';

import '../../../../core/widgets/initial_button.dart';
import '../../../../core/widgets/loading_button.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../bloc/cubit/status/reset_password_status.dart';
import 'auth_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static const routeName = 'ChangePassScreen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _pass2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _passController.dispose();
    _pass2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final email = ModalRoute.of(context)!.settings.arguments as String;

    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.resetPasswordStatus is ResetPasswordCompleted) {
          context.read<AuthCubit>().resetAuthStatus();
          DialogHelper.showSuccessDialog(
            context,
            title: l10n.passwordChangedSuccessfully,
            content: l10n.passwordChangedSuccessfullyMessage,
          ).then((_) {
            Navigator.of(context).pushReplacementNamed(AuthScreen.routeName);
          });
        }
        if (state.resetPasswordStatus is ResetPasswordError) {
          context.read<AuthCubit>().resetAuthStatus();
          DialogHelper.showErrorDialog(
            context,
            title: l10n.passwordChangeFailed,
            content: l10n.passwordChangeFailedMessage,
          );
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.of(context)
                .pushReplacementNamed(AuthScreen.routeName),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            color: Colors.white,
            child: Center(
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
                        // Top section (scrollable content)
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Gap(
                                  context.responsive(
                                    mobile: 20,
                                    tablet: 30,
                                    desktop: 40,
                                  ),
                                ),
                                // Title
                                Text(
                                  l10n.createNewPassword,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: context.responsive(
                                      mobile: 24,
                                      tablet: 28,
                                      desktop: 32,
                                    ),
                                  ),
                                ),
                                Gap(
                                  context.responsive(
                                    mobile: 24,
                                    tablet: 32,
                                    desktop: 40,
                                  ),
                                ),
                                // Description
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: context.responsive(
                                      mobile: 16,
                                      tablet: 24,
                                      desktop: 32,
                                    ),
                                  ),
                                  child: Text(
                                    l10n.createNewPasswordDescription,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: MyColors.grey,
                                      fontSize: context.responsive(
                                        mobile: 14,
                                        tablet: 15,
                                        desktop: 16,
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(
                                  context.responsive(
                                    mobile: 32,
                                    tablet: 40,
                                    desktop: 48,
                                  ),
                                ),
                                // New Password Field
                                SizedBox(
                                  width: context.responsive(
                                    mobile: double.infinity,
                                    tablet: 400,
                                    desktop: 500,
                                  ),
                                  child: CustomTextFormFieldWidget(
                                    controller: _passController,
                                    hintText: l10n.newPassword,
                                    prefixIcon: flu.FluentIcons.lock_solid,
                                    obscureText: true,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) => Validators.password(
                                      value,
                                      l10n,
                                    ),
                                    onChangeFunction: (value) {},
                                  ),
                                ),
                                Gap(
                                  context.responsive(
                                    mobile: 16,
                                    tablet: 20,
                                    desktop: 24,
                                  ),
                                ),
                                // Confirm Password Field
                                SizedBox(
                                  width: context.responsive(
                                    mobile: double.infinity,
                                    tablet: 400,
                                    desktop: 500,
                                  ),
                                  child: CustomTextFormFieldWidget(
                                    controller: _pass2Controller,
                                    hintText: l10n.confirmNewPassword,
                                    prefixIcon: flu.FluentIcons.lock_solid,
                                    obscureText: true,
                                    textInputAction: TextInputAction.done,
                                    validator: (value) =>
                                        Validators.confirmPassword(
                                      value,
                                      _passController.text,
                                      l10n,
                                    ),
                                    onChangeFunction: (value) {},
                                  ),
                                ),
                                Gap(
                                  context.responsive(
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
                                if (state.resetPasswordStatus
                                    is ResetPasswordLoading) {
                                  return const LoadingButton();
                                }
                                return InitialButton(
                                  title: l10n.confirm,
                                  onTap: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context.read<AuthCubit>().resetPassword(
                                            ResetPasswordParams(
                                              resetToken: '',
                                              newPassword: _passController.text,
                                            ),
                                          );
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
