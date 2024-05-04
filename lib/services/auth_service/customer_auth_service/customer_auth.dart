// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';
import 'package:n3imn_project_team/services/abstract_auth.dart';

class CustomerAuthService implements IUserAuth{
  final FirebaseAuth _auth = FirebaseAuth.instance;
}

