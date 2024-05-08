// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';
import 'package:n3imn_project_team/utils/Dialogs/dialgos.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class RestPasswordViewModel extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final _customerRep = CustomerRepository();
  final _authService = getIt<AuthService>();
  TextEditingController get emailController => _email;

  Future<bool> resetPassowrd(
      GlobalKey<FormState> formState, BuildContext context) async {
    if (formState.currentState!.validate()) {
      ExceptionHandller.handle(() async {
        if (await _customerRep.doesCustomerExist(emailController.text)) {
          Dialogs.showAuthenticationErrorDialog(context,
              "Please check your email.", "Password Reset Verification");
          await _authService.resetPassword(emailController.text);
          Navigator.of(context).pushReplacementNamed("customerlogin");
          return true;
        }
        Dialogs.showAuthenticationErrorDialog(
            context, "Please provide email exist .", "Email not found .");
        return false;
      }, context);
    }
    return false;
  }
}
