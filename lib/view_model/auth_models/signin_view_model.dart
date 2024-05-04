// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';

class SignInViewModel extends ChangeNotifier {
  
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  AuthResultStatus? _status;
  
  TextEditingController get emailController => _email;
  TextEditingController get passwordController => _password;

  //singIn methodes
}

