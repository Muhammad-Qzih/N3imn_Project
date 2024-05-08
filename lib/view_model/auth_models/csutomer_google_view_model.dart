import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class GoogleSignInViewModel extends ChangeNotifier {
  final CustomerRepository _userRepository = CustomerRepository();
  final AuthService _authService = AuthService();
  

  Future<void> signInWithGoogle(BuildContext context) async {
    ExceptionHandller.handle(() async {
      AuthCredential? authCredential =
          await _authService.getGoogleSignInCredentials();
      if (authCredential != null) {
        UserCredential userCredential =
            await _authService.signInWithCredential(authCredential);
        // Optional: Handle the userCredential (e.g., update your repository)
        Navigator.of(context)
            .pushNamedAndRemoveUntil("customerhomepage", (route) => false);
      }
    }, context);
  }
}