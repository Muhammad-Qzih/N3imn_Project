// ignore_for_file: file_names

import 'package:n3imn_project_team/model/user_model/customer_model.dart';

abstract class ICustomerRepository {
  Future<void> addCustomer(String userId, Customer customer);
}
