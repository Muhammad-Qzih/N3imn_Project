import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/enums/status_exceptoin.dart';
import 'package:n3imn_project_team/utils/global_exception_hadller/message_generator.dart';

class ExceptionHandller {
  static void handle(Function fn, BuildContext context) async {
    AuthResultStatus status;

    try {
      await fn();
    } on FirebaseAuthException catch (e) {
      status = ExceptionGenarator.handleException(e);
      // Dialogs.showAwesomeErrorDialog(
      //     context, ExceptionGenarator.generateExceptionMessage(status));
    } on Exception catch (e) {
      status = ExceptionGenarator.handleException(e);

      // Dialogs.showAwesomeErrorDialog(
      //     context, AuthExceptionHandler.generateExceptionMessage(status));
    }
  }
}
