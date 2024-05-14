// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/utils/Dialogs/dialgos.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/exception_hadller.dart';

class CustomerEditInfoViewModel with ChangeNotifier {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _username = TextEditingController();

  TextEditingController get emailController => _email;
  TextEditingController get phoneController => _phone;
  TextEditingController get nameController => _username;

  final CustomerRepository _customerRepository = CustomerRepository();
  final user = FirebaseAuth.instance.currentUser?.uid;
  Future<void> updateCustomerProfile(
      BuildContext context, GlobalKey<FormState> formState) async {
    if (formState.currentState!.validate()) {
      ExceptionHandller.handle(() async {
        await _customerRepository.updateCustomerProfileById(user!,
            nameController.text ,emailController.text, phoneController.text);
      }, context);
      Dialogs.showAuthenticationErrorDialog(
          context, "Profile updated successfully!", 'Done Update');
    }
  }

  Future<Customer?> loadCustomerData() async {
    Customer? customer = await _customerRepository.fetchCustomerProfile(user!);
    return customer;
  }
}
