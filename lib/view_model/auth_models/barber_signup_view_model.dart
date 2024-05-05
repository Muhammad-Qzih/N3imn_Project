import 'package:flutter/material.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';

class BarberSignUpViewModel extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _location = TextEditingController();
  AuthResultStatus? _status;

  TextEditingController get emailController => _email;
  TextEditingController get passwordController => _password;
  TextEditingController get phoneController => _phone;
  TextEditingController get locationController => _location;
  TextEditingController get usernameContrller => _username;
}
