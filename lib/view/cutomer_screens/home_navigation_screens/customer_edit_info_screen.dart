// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/utils/validations/auth_validator.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_edit_text_field.dart';
import 'package:n3imn_project_team/view_model/customer_edit_info_view_model.dart';

class CustomerEditInfoScreen extends StatefulWidget {
  const CustomerEditInfoScreen({super.key});

  @override
  State<CustomerEditInfoScreen> createState() => _CustomerEditInfoScreen();
}

class _CustomerEditInfoScreen extends State<CustomerEditInfoScreen> {
  final CustomerEditInfoViewModel customerEditInfoViewModel =
      CustomerEditInfoViewModel();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  getData() async {
    final customer = await customerEditInfoViewModel.loadCustomerData();
    customerEditInfoViewModel.nameController.text = customer!.username;
    customerEditInfoViewModel.emailController.text = customer.email;
    customerEditInfoViewModel.phoneController.text = customer.phoneNumber;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme:
              const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
          backgroundColor: AppColor.PRIMARY,
          title: const Text(
            "ُEdit Services",
            style: TextStyle(
              fontSize: 20,
              color: AppColor.TEXT_SECONDARY,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        backgroundColor: AppColor.TEXT_SECONDARY,
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                Form(
                    key: formState,
                    child: Column(children: [
                      CustomEditTextField(
                        labelName: "Customer name",
                        validator: AuthValidator.isValidName,
                        textEditingController:
                            customerEditInfoViewModel.nameController,
                        obsecureText: false,
                        icon: Icons.person_outline,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEditTextField(
                        labelName: "E-Mail",
                        validator: AuthValidator.isValidEmail,
                        textEditingController:
                            customerEditInfoViewModel.emailController,
                        obsecureText: false,
                        icon: Icons.email_outlined,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomEditTextField(
                        labelName: "Phone Number",
                        validator: AuthValidator.isValidPhone,
                        textEditingController:
                            customerEditInfoViewModel.phoneController,
                        obsecureText: false,
                        icon: Icons.phone_outlined,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CsutomAuthButton(
                          buttonText: 'Update Informaition',
                          textStyle: const TextStyle(
                            color: AppColor.TEXT_SECONDARY,
                            fontSize: 20,
                          ),
                          onPressed: () async {
                            await customerEditInfoViewModel
                                .updateCustomerProfile(context, formState);
                          })
                    ])),
              ],
            ),
          ),
        ));
  }
}
