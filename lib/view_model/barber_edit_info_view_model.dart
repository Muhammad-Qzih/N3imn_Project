// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/utils/Dialogs/dialgos.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class BarberSalonEditInfoViewModel with ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _shopName = TextEditingController();
  final TextEditingController _location = TextEditingController();

  TextEditingController get emailController => _email;
  TextEditingController get phoneController => _phone;
  TextEditingController get shopNameController => _shopName;
    TextEditingController get locationController => _location;


  final BarberRepository _barberRepository = BarberRepository();
  final user = FirebaseAuth.instance.currentUser?.uid;
  Future<void> updateBarberProfile(
      BuildContext context, GlobalKey<FormState> formState) async {
    if (formState.currentState!.validate()) {
      ExceptionHandller.handle(() async {
        await _barberRepository.updateBarberProfileById(user!,
            shopNameController.text ,emailController.text, phoneController.text,locationController.text);
      }, context);
      Dialogs.showAuthenticationErrorDialog(
          context, "Profile updated successfully!", 'Done Update');
    }
  }

  Future<BarberSalon?> loadBarberData() async {
    BarberSalon? barberSalon = await _barberRepository.fetchBarberProfile(user!);
    return barberSalon;
  }
  
}
