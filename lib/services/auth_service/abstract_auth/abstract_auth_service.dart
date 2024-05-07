import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<UserCredential> signUp(String email, String password);
  Future<UserCredential> signIn(String email, String password);
}
