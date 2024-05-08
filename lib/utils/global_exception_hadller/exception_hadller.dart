// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/utils/Dialogs/dialgos.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/message_generator.dart';

class ExceptionHandller {
  static void handle(Function fn, BuildContext context) async {
    AuthResultStatus status;

    try {
      await fn();
    } on FirebaseAuthException catch (e) {
      status = ExceptionGenarator.handleException(e);

      Dialogs.showAuthenticationErrorDialog(
          context,
          ExceptionGenarator.generateExceptionMessage(status),
          "Authentication Error");
                print(e);
    } on Exception catch (e) {
      status = ExceptionGenarator.handleException(e);

      Dialogs.showAuthenticationErrorDialog(
          context,
          ExceptionGenarator.generateExceptionMessage(status),
          "UnExpected Error");
      print(e);
    }
  }
}
