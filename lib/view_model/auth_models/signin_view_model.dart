// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class SignInViewModel extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final BarberRepository _barberRepository = BarberRepository();
  final CustomerRepository _customerRepository = CustomerRepository();
  AuthResultStatus? _status;

  TextEditingController get emailController => _email;
  TextEditingController get passwordController => _password;

  final AuthService _barberAuthService = AuthService();
//mtn@gmail.com // Mtn1234@M
//mtnn@gmail.com // Mtn1234@M
  Future<void> signIn(
      BuildContext context, GlobalKey<FormState> formState) async {
    if (formState.currentState!.validate()) {
      ExceptionHandller.handle(() async {
        UserCredential userCredential = await _barberAuthService.signIn(
            emailController.text, passwordController.text);

        final user = userCredential.user;
        if (user != null) {
          var userType = await getUserType(user.uid);
          
          if (userType == 0) {
            Navigator.of(context).pushReplacementNamed("barberhomepage");
          }

          if (userType == 1) {
            Navigator.of(context).pushReplacementNamed("customerhomepage");
          }
        }
      }, context);
    }
  }

  Future<int?> getUserType(String userId) async {
    var barberDocument = await _barberRepository.getBarberDocumentByID(userId);

    if (barberDocument != null && barberDocument.exists) {
      return 0;
    }

    var customerDocument =
        await _customerRepository.getCustomerDocumentByID(userId);

    if (customerDocument != null && customerDocument.exists) {
      return 1;
    }
    return null;
  }
}
