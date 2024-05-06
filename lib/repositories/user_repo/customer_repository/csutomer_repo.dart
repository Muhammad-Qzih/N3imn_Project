// ignore_for_file: unused_field

import 'package:firebase_auth/firebase_auth.dart';

import 'package:n3imn_project_team/repositories/user_repo/abstract_classes/Icustomer_repo.dart';


class CustomerRepository implements ICustomerRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
}
