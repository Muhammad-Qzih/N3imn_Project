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

  Future<DocumentSnapshot?> getCustomerDocumentByID(String customerId) async {
    return await _customerCollection.doc(customerId).get();
  }

  Future<bool> doesCustomerExist(String email) async {
    QuerySnapshot<Object?> querySnapshot =
        await _customerCollection.where('email', isEqualTo: email).get();

    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> updateCustomerProfileById(String user, String nameController,
      String emailController, String phoneController) async {
    await _customerCollection.doc(user).update({
      'username': nameController,
      'email': emailController,
      'phoneNumber': phoneController,
    });
  }

  Future<Customer?> fetchCustomerProfile(String customerId) async {
    DocumentSnapshot<Object?> user =
        await _customerCollection.doc(customerId).get();
    return Customer.fromJson(user.data() as Map<String, dynamic>);
  }
  
  Future<List<Customer>> getAllCustomers() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection("customers").get();

    return querySnapshot.docs
        .map((doc) => Customer.fromFirestore(doc))
        .toList();
  }
}
