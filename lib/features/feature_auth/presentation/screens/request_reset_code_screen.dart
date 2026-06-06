import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluent_ui/fluent_ui.dart' as flu;

import '../../../../core/localization/l10n/app_localizations.dart';
import '../../../../core/responsive/responsive_context.dart';
import '../../../../core/utils/dialog_helper.dart';
import '../../../../core/utils/validators.dart';
import '../../../../res/colors.dart';
import '../../../../core/widgets/custom_textfield_widget.dart';
import '../bloc/cubit/auth_cubit.dart';
import '../bloc/cubit/status/request_reset_code_status.dart';
import '../../../../core/widgets/initial_button.dart';
import '../../../../core/widgets/loading_button.dart';
import 'verify_code_screen.dart';

class RequestResetCodeScreen extends StatefulWidget {
  const RequestResetCodeScreen({super.key});

  static const routeName = '/RequestResetCodeScreen';

  @override
  State<RequestResetCodeScreen> createState() => _RequestResetCodeScreenState();
}

class _RequestResetCodeScreenState extends State<RequestResetCodeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.requestResetCodeStatus is RequestResetCodeCompleted) {
          context.read<AuthCubit>().resetAuthStatus();
          DialogHelper.showInfoDialog(
            context,
            title: l10n.checkYourEmail,
            content: l10n.resetCodeSent,
          ).then((_) => Navigator.of(context)
              .pushReplacementNamed(VerifyCodeScreen.routeName));
        }
        if (state.requestResetCodeStatus is RequestResetCodeError) {
          final message =
              (state.requestResetCodeStatus as RequestResetCodeError).message;
          DialogHelper.showErrorDialog(
            context,
            title: l10n.error,
            content: message,
          ).then((_) {
            context.read<AuthCubit>().resetAuthStatus();
          });
        }
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: context.responsive(
                        mobile: 42,
                        tablet: 46,
                        desktop: 54,
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: context.responsive(
                          mobile: double.infinity,
                          tablet: 500,
                          desktop: 600,
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.forgotYourPassword,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: context.responsive(
                                mobile: 28,
                                tablet: 32,
                                desktop: 38,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: context.responsive(
                              mobile: 42,
                              tablet: 46,
                              desktop: 54,
                            ),
                          ),
                          Text(
                            l10n.resetPasswordDescription,
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
                          SizedBox(
                            height: context.responsive(
                              mobile: 42,
                              tablet: 46,
                              desktop: 54,
                            ),
                          ),
                          CustomTextFormFieldWidget(
                            controller: _emailController,
                            hintText: l10n.emailAddress,
                            prefixIcon: flu.FluentIcons.mail_solid,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            validator: (value) => Validators.email(
                              value,
                              l10n,
                            ),
                            onChangeFunction: (value) {},
                          ),
                          SizedBox(
                            height: context.responsive(
                              mobile: 42,
                              tablet: 46,
                              desktop: 54,
                            ),
                          ),
                          BlocBuilder<AuthCubit, AuthState>(
                            builder: (context, state) {
                              if (state.requestResetCodeStatus
                                  is RequestResetCodeLoading) {
                                return const LoadingButton();
                              } else {
                                return InitialButton(
                                  title: l10n.send,
                                  onTap: () {
                                    if (_formKey.currentState?.validate() ??
                                        false) {
                                      context
                                          .read<AuthCubit>()
                                          .requestResetCode(
                                            _emailController.text.trim(),
                                          );
                                    }
                                  },
                                );
                              }
                            },
                          ),
                          SizedBox(
                            height: context.responsive(
                              mobile: 24,
                              tablet: 32,
                              desktop: 40,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
