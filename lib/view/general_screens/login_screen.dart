// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/utils/validations/auth_validator.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/ApplicationLogo.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_icon_text_field.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_methode.dart';
import 'package:n3imn_project_team/view_model/auth_models/csutomer_google_view_model.dart';
import 'package:n3imn_project_team/view_model/auth_models/signin_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final signInViewModel = SignInViewModel();
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  final GoogleSignInViewModel _googleSignInViewModel = GoogleSignInViewModel();

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
                      _buildSizedBox(15),
                      ApplicationLogo(width: 200, height: 150),
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
                            _buildSizedBox(20),
                            Container(
                              height: 500,
                              width: 400,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(9)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.shade900
                                          .withOpacity(0.199),
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
                                    _buildSizedBox(20),
                                    _buildIconTextField(
                                        "Email",
                                        false,
                                        Icons.email,
                                        theme.colorScheme.primary,
                                        signInViewModel.emailController,
                                        AuthValidator.isValidEmail),
                                    _buildSizedBox(10),
                                    _buildIconTextField(
                                        "Passsowrd",
                                        true,
                                        Icons.lock,
                                        theme.colorScheme.primary,
                                        signInViewModel.passwordController,
                                        AuthValidator.isValidPassword),
                                    _buildTextForgetPasswrod(
                                        theme.textTheme.titleMedium, context),
                                    _buildSizedBox(25),
                                    _buildSginInButton(
                                        signInViewModel, formState, context),
                                    _buildSizedBox(20),
                                    _buildDivider(),
                                    _buildSizedBox(20),
                                    _googleAppleSignIn(context,_googleSignInViewModel),
                                    _buildSizedBox(20),
                                    _buildSignUpAsCustomer(context, theme),
                                    _buildSignUpAsBarber(context, theme),
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

Widget _buildIconTextField(
  String hintText,
  bool obsecureText,
  IconData iconData,
  Color color,
  TextEditingController controller,
  String? Function(String?)? validator,
) {
  return CustomIconTextField(
    hintText: hintText,
    obsecureText: obsecureText,
    icon: Icon(iconData, color: color),
    textEditingController: controller,
    validator: validator,
  );
}

Widget _buildTextForgetPasswrod(TextStyle? textStyle, BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      InkWell(
        onTap: () {
          Navigator.pushNamed(context, "customerresetpassword");
        },
        child: Text("Forgot Password?", style: textStyle),
      )
    ],
  );
}

Widget _buildSizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _buildSginInButton(SignInViewModel signInViewModel,
    GlobalKey<FormState> formState, BuildContext context) {
  return Padding(
    padding: EdgeInsets.symmetric(
      horizontal: 100,
    ),
    child: Column(
      children: [
        CsutomAuthButton(
          buttonText: 'Sign in',
          onPressed: () {
            signInViewModel.signIn(context, formState);
          },
        ),
      ],
    ),
  );
}

Widget _buildSignUpAsBarber(BuildContext context, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Sign up as a barber? ",
        style: theme.textTheme.titleSmall,
      ),
      const SizedBox(
        width: 5,
      ),
      InkWell(
        onTap: () {
          // Handle onTap event
          Navigator.pushReplacementNamed(context, "barbersignup");
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

Widget _buildSignUpAsCustomer(BuildContext context, ThemeData theme) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Sign up as a customer? ",
        style: theme.textTheme.titleSmall,
      ),
      const SizedBox(
        width: 5,
      ),
      InkWell(
        onTap: () {
          // Handle onTap event
          Navigator.pushReplacementNamed(context, "customersignup");
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

Widget _googleAppleSignIn(
    BuildContext context, GoogleSignInViewModel _googleSignInViewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CustomMethode(
          imagePath: "Images/google-icon-1.png",
          onPressed: () async {
            await _googleSignInViewModel.signInWithGoogle(context);
          }),
      const SizedBox(
        width: 20,
      ),
      CustomMethode(
        imagePath: "Images/apple-icon-4.png",
        onPressed: () {
          // Implement Apple sign-in logic
        },
      ),
    ],
  );
}

Widget _buildDivider() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0),
    child: Row(
      children: [
        Expanded(
            child: Divider(
          thickness: 0.5,
          color: Colors.grey[500],
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Or Continue With",
            style: TextStyle(color: Colors.grey[800], fontSize: 12),
          ),
        ),
        Expanded(
            child: Divider(
          thickness: 0.5,
          color: Colors.grey[500],
        ))
      ],
    ),
  );
}
