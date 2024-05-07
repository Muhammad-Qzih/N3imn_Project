// ignore_for_file: unused_field, non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:n3imn_project_team/services/auth_service/abstract_auth/abstract_auth_service.dart';

class AuthService implements IAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Future<UserCredential> signUp(String email, String password) async {
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return userCredential;
  }

  @override
  Future<UserCredential> signIn(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }
}
