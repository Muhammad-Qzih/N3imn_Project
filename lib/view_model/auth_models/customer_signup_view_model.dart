// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';

class BarberSignUpViewModel extends ChangeNotifier {
  final BarberRepository _barberRepository = getIt<BarberRepository>();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  late final AuthResultStatus _status;

  TextEditingController get nameController => _username;

  TextEditingController get emailController => _email;

  TextEditingController get passwordController => _password;

  TextEditingController get phoneController => _password;

}
