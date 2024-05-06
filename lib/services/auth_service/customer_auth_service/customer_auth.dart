// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';

import 'package:n3imn_project_team/services/auth_service/abstract_auth/customer_abstract_service.dart';

class CustomerAuthService implements ICustomerAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  @override
  Future<UserCredential> signUp(String email, String password) {
    // TODO: implement signUp
    throw UnimplementedError();
  }
}

