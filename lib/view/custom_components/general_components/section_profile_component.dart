import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class SectionProfile extends StatelessWidget {
  final String sectionName;
  final IconData icon;
  final String routeName;
  const SectionProfile(
      {super.key,
      required this.sectionName,
      required this.icon,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context,routeName);
      },
      child: ListTile(
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: AppColor.PRIMARY.withOpacity(0.1)),
          child: Icon(
            icon,
            color: AppColor.PRIMARY,
          ),
        ),
        title: Text(
          sectionName,
          style: const TextStyle(color: AppColor.TEXT_PRIMARY),
        ),
        trailing: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 198, 195, 219).withOpacity(0.1)),
          child: const Icon(
            Icons.chevron_right,
            color: AppColor.PRIMARY,
          ),
        ),
      ),
    );
  }
}