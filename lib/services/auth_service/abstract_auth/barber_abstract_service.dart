import 'package:firebase_auth/firebase_auth.dart';

abstract class IBarberAuth {
  Future<UserCredential> signUp(String email, String password);
}
