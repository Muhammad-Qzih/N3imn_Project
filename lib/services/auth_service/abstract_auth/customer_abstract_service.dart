import 'package:firebase_auth/firebase_auth.dart';

abstract class ICustomerAuth {
  Future<UserCredential> signUp(String email, String password);
}
