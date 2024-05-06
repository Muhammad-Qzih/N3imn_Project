// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class DrawerMenu extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        backgroundColor: AppColor.PRIMARY,
        child: Column( mainAxisAlignment: MainAxisAlignment.end,
          children: [ 
            _buildDrawerItem(
              title: "Sign Out",
              icon: Icons.exit_to_app,
              onTap: () {
                // Add sign out logic here
              },
            ),
            const SizedBox(height: 100,)
          ],
        ),
      ),
    );
  }
  Widget _buildDrawerItem({
    required String title,
    IconData? icon,
    required VoidCallback onTap,
  }) {
    return ListTile(
      title: Text(title),
      leading: icon != null ? Icon(icon) : null,
      onTap: onTap,
    );
  }
}
