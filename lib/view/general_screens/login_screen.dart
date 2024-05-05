// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/ApplicationLogo.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_icon_text_field.dart';
import 'package:n3imn_project_team/view_model/auth_models/signin_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final signInViewModel = SignInViewModel();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: formState,
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 15),
                  ApplicationLogo(width: 200, height: 200),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Welcome !",
                            style: theme.textTheme.displayLarge
                                ?.copyWith(color: AppColor.TEXT_SECONDARY)),
                        Text(
                          'Sign in to continue',
                          style: theme.textTheme.displayLarge
                              ?.copyWith(color: AppColor.TEXT_SECONDARY),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 500,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(9)),
                            boxShadow: [
                              BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground
                                      .withOpacity(0.2),
                                  spreadRadius: 3,
                                  blurRadius: 1,
                                  offset: const Offset(3, 3)),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                _buildUsernameTextField(
                                    "Email",
                                    false,
                                    Icons.email_outlined,
                                    theme.colorScheme.primary,
                                    signInViewModel.emailController),
                                const SizedBox(
                                  height: 10,
                                ),
                                _buildUsernameTextField(
                                    "Passsowrd",
                                    true,
                                    Icons.lock_outline_rounded,
                                    theme.colorScheme.primary,
                                    signInViewModel.passwordController),
                                _buildTextForgetPasswrod(
                                    theme.textTheme.titleMedium),
                                const SizedBox(
                                  height: 30,
                                ),
                                _buildSginInButton(),
                                const SizedBox(
                                  height: 20,
                                ),
                              _buildRegisterSection(context, theme),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}

Widget _buildUsernameTextField(String hintText, bool obsecureText,
    IconData iconData, Color color, TextEditingController controller) {
  return CustomIconTextField(
    hintText: hintText,
    obsecureText: obsecureText,
    icon: Icon(iconData, color: color),
    textEditingController: controller,
  );
}

Widget _buildTextForgetPasswrod(TextStyle? textStyle) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {},
        child: Text("Forgot Password?", style: textStyle),
      )
    ],
  );
}

Widget _buildSginInButton() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 100),
    child: Column(
      children: [
        CsutomAuthButton(
          buttonText: 'Sign in',
        ),
      ],
    ),
  );
}



Widget _buildRegisterSection(BuildContext context, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account? ",
        style: theme.textTheme.titleSmall,
      ),
      const SizedBox(
        width: 5,
      ),
      InkWell(
        onTap: () {
          // Handle onTap event
        },
        child: Text(
          "Sign up",
          style: TextStyle(
            color: Color.fromARGB(255, 2, 116, 209),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    ],
  );
}
