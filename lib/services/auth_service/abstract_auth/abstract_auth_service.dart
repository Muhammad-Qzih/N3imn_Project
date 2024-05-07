import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuth {
  Future<UserCredential> signUp(String email, String password);
  Future<UserCredential> signIn(String email, String password);
  Future<void> signOut();
  Future<AuthCredential?> getGoogleSignInCredentials();
  Future<UserCredential> signInWithCredential(AuthCredential credential);
}
