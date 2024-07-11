// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view_model/auth_models/logout_view_model.dart';

class DrawerMenu extends StatelessWidget {
  final signOutViewModel = UserSignOutViewModel();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColor.PRIMARY,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildDrawerItem(
            title: "Sign Out",
            icon: Icons.exit_to_app,
            onTap: () async {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
              await signOutViewModel.signOut(context);
            },
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required String title,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      iconColor: AppColor.TEXT_SECONDARY,
      title: Text(title, style: const TextStyle(color:  AppColor.TEXT_SECONDARY),),
      leading: icon != null ? Icon(icon) : null,
      onTap: onTap,
    );
  }
}
