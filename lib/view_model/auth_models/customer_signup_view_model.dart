// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';
import 'package:n3imn_project_team/model/user_model/user_types.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/services/auth_service/customer_auth_service/customer_auth.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class CustomerSignUpViewModle extends ChangeNotifier {
  
  final CustomerRepository _customerRepository = CustomerRepository();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  late final AuthResultStatus _status;
  final _customerAuthService = getIt<CustomerAuthService>();

  TextEditingController get nameController => _username;

  TextEditingController get emailController => _email;

  TextEditingController get passwordController => _password;

  TextEditingController get phoneController => _phone;

  Future<void> customerSingUp(
      BuildContext context, GlobalKey<FormState> formState) async {
    ExceptionHandller.handle(() async {
      Customer customer = Customer(
          userType: UserType.customer.index,
          username: nameController.text,
          email: emailController.text,
          phoneNumber: phoneController.text,
          password: passwordController.text);

      UserCredential userCredential =
          await _customerAuthService.signUp(customer.email, customer.password);

      final user = userCredential.user;

      if (user != null) {
        await _customerRepository.addCustomer(
            userCredential.user!.uid, customer);
        Navigator.of(context).pushReplacementNamed("customerlogin");
      }
    }, context);
  }
}
