// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class UserSignOutViewModel extends ChangeNotifier {
  final _userAuthService = getIt<AuthService>();

  Future<void> signOut(BuildContext context) async {
    ExceptionHandller.handle(() async {
      await _userAuthService.signOut();
      Navigator.of(context).pushReplacementNamed("customerlogin");
    }, context);
  }
}
