import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class Dialogs {
  static void showAuthenticationErrorDialog(
      BuildContext context, String errorMessage, String title) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.noHeader,
      animType: AnimType.topSlide,
      title: title,
      desc: errorMessage,
    ).show();
  }
}     
