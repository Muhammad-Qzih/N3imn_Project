import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/ApplicationLogo.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_icon_text_field.dart';
import 'package:n3imn_project_team/view_model/auth_models/customer_signup_view_model.dart';

class SignUpCustomer extends StatefulWidget {
  const SignUpCustomer({super.key});

  @override
  State<SignUpCustomer> createState() => _SignUpCustomerState();
}

class _SignUpCustomerState extends State<SignUpCustomer> {
  final customerSignUpViewModel = CustomerSignUpViewModle();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.PRIMARY,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
                child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSizedBox(10),
                  const ApplicationLogo(width: 200, height: 150),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Create a new account",
                          style: TextStyle(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _buildSizedBox(30),
                        Container(
                          height: 520,
                          width: 400,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(9)),
                            boxShadow: [
                              BoxShadow(
                                  color:
                                      Colors.grey.shade900.withOpacity(0.199),
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
                                    "User name",
                                    false,
                                    Icons.person,
                                    AppColor.PRIMARY,
                                    customerSignUpViewModel.nameController),
                                _buildSizedBox(10),
                                _buildIconTextField(
                                    "Email",
                                    false,
                                    Icons.email,
                                    AppColor.PRIMARY,
                                    customerSignUpViewModel.emailController),
                                _buildSizedBox(10),
                                _buildIconTextField(
                                    "Phone Number",
                                    false,
                                    Icons.phone,
                                    AppColor.PRIMARY,
                                    customerSignUpViewModel.phoneController),
                                _buildSizedBox(10),
                                _buildIconTextField(
                                    "Passsowrd",
                                    true,
                                    Icons.lock,
                                    AppColor.PRIMARY,
                                    customerSignUpViewModel.passwordController),
                                _buildSizedBox(30),
                                _buildSginUpButton(),
                                _buildSizedBox(20),
                                _buildSignupFooter(context),
                              ],
                            ),
                          ),
                        )
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

Widget _buildIconTextField(String hintText, bool obsecureText,
    IconData iconData, Color color, TextEditingController controller) {
  return CustomIconTextField(
    hintText: hintText,
    obsecureText: obsecureText,
    icon: Icon(iconData, color: color),
    textEditingController: controller,
  );
}

Widget _buildSizedBox(double height) {
  return SizedBox(
    height: height,
  );
}

Widget _buildSginUpButton() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 40),
    child: Column(
      children: [
        CsutomAuthButton(
          buttonText: 'Sign up',
        ),
      ],
    ),
  );
}

Widget _buildSignupFooter(BuildContext  context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Already have an aaccount?",
        style: TextStyle(color: Colors.grey[700], fontSize: 14),
      ),
      const SizedBox(
        width: 5,
      ),
      InkWell(
        onTap: () {
    Navigator.pushReplacementNamed(context, "customerlogin");
  },
        child: const Text("Sign in",
            style: TextStyle(
                color: Color.fromARGB(255, 2, 116, 209),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
      )
    ],
  );
}
