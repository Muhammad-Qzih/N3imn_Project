// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/abstract_classes/Icustomer_repo.dart';


class CustomerRepository implements ICustomerRepository {
    final CollectionReference _customerCollection =
      FirebaseFirestore.instance.collection('customers');

  @override
  Future<void> addCustomer(String userId, Customer customer) async {
    await _customerCollection.doc(userId).set(
      customer.toJson(),
    );
  }
}
