// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class RestPasswordViewModel extends ChangeNotifier {
  final TextEditingController _email = TextEditingController();

  TextEditingController get emailController => _email;

}
