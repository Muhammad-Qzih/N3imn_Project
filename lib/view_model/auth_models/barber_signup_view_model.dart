// ignore_for_file: unused_field, unused_local_variable, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/model/user_model/user_types.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/services/auth_service/barber_auth_service/barber_auth.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class BarberSignUpViewModel extends ChangeNotifier {
  final _barberAuthService = getIt<BarberAuthService>();
  // final _barberRepository = getIt<BarberRepository>();
  final _barberRepository = BarberRepository();
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

  Future<void> barberSignUp(
      BuildContext context, GlobalKey<FormState> formState) async {
    ExceptionHandller.handle(() async {
      BarberSalon barberSalon = BarberSalon(
        email: emailController.text,
        passwrod: passwordController.text,
        phoneNumber: phoneController.text,
        location: locationController.text,
        shopName: usernameContrller.text,
        userType: UserType.barber.index,
      );

      UserCredential userCredential = await _barberAuthService.signUp(
          barberSalon.email, barberSalon.passwrod);

      final user = userCredential.user;

      if (user != null) {
        await _barberRepository.addBarber(
            userCredential.user!.uid, barberSalon);
        _status = AuthResultStatus.successful;
        Navigator.of(context).pushReplacementNamed("barberhomepage");
      } else {
        _status = AuthResultStatus.undefined;
      }
    }, context);
  }
}
