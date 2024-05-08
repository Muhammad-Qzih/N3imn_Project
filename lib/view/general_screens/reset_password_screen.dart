import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/utils/Dialogs/dialgos.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_icon_text_field.dart';
import 'package:n3imn_project_team/view_model/auth_models/rest_password_view_model.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final restPasswordViewModel = RestPasswordViewModel();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      appBar: AppBar(
        backgroundColor: AppColor.PRIMARY,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formState,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Forget Password',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge
                    ?.copyWith(color: AppColor.TEXT_SECONDARY),
              ),
              Text(
                'Enter your email to continue',
                textAlign: TextAlign.center,
                style: theme.textTheme.displayLarge
                    ?.copyWith(color: AppColor.TEXT_SECONDARY),
              ),
              const SizedBox(height: 100),
              Center(
                child: Container(
                  height: 250,
                  width: 380,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade900.withOpacity(0.199),
                          spreadRadius: 3,
                          blurRadius: 1,
                          offset: const Offset(3, 3)),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CustomIconTextField(
                          hintText: "Email",
                          obsecureText: false,
                          icon: const Icon(Icons.email_outlined,
                              color: AppColor.PRIMARY),
                          textEditingController:
                              restPasswordViewModel.emailController),
                      const SizedBox(height: 30),
                      CsutomAuthButton(
                        buttonText: 'Send',
                        onPressed: () async {
                          restPasswordViewModel.resetPassowrd(
                              formState, context);
                          Dialogs.showAuthenticationErrorDialog(
                              context,
                              "Please check your email.",
                              "Password Reset Verification");
                        },
                        backgroundColor: AppColor.PRIMARY,
                        textStyle: theme.textTheme.titleMedium
                            ?.copyWith(color: AppColor.TEXT_SECONDARY),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
