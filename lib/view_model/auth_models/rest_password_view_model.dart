// ignore_for_file: unused_field, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class RestPasswordViewModel extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final _authService = getIt<AuthService>();
  TextEditingController get emailController => _email;

  Future<void> resetPassowrd(
      GlobalKey<FormState> formState, BuildContext context) async {
    ExceptionHandller.handle(() async {
      await _authService.resetPassword(emailController.text);

      Navigator.of(context).pushReplacementNamed("customerlogin");
    }, context);
  }
}
