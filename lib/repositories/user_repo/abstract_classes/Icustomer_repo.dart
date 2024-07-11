// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';

abstract class ICustomerRepository {
  Future<void> addCustomer(String userId, Customer customer);
  Future<DocumentSnapshot?> getCustomerDocumentByID(String customerId);
  Future<bool> doesCustomerExist(String email);
  Future<void> updateCustomerProfileById(String user, String nameController,
      String emailController, String phoneController);
  Future<Customer?> fetchCustomerProfile(String customerId);
  Future<List<Customer>> getAllCustomers();
}
