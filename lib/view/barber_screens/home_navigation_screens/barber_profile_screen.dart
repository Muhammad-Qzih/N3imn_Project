import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/section_profile_component.dart';

class BarberProfile extends StatefulWidget {
  const BarberProfile({super.key});

  @override
  State<BarberProfile> createState() => _BarberProfileState();
}

class _BarberProfileState extends State<BarberProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    
                    // child: const Image(
                    //     image: AssetImage(
                    //         ""))
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Muhamamd Qzih",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColor.TEXT_PRIMARY),
              ),
              const Text(
                "muhammaghqzih@gmail.com",
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColor.TEXT_SECONDARY_LIGHT),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.PRIMARY,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: const Text("Edit Picture",
                      style: TextStyle(
                          color: AppColor.TEXT_SECONDARY,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Color.fromARGB(255, 231, 227, 227),
              ),
              const SizedBox(
                height: 20,
              ),
              const SectionProfile(
                  sectionName: 'Edit Information',
                  icon: Icons.person,
                  routeName: 'barbereditinformation'),
              const SizedBox(
                height: 10,
              ),
              const SectionProfile(
                  sectionName: 'Edit Services',
                  icon: Icons.settings,
                  routeName: 'barbereditservices'),
              const SizedBox(
                height: 10,
              ),
              const SectionProfile(
                  sectionName: 'Change Password',
                  icon: Icons.lock,
                  routeName: 'barberresetpassword'),
            ],
          ),
        ),
      ),
    );
  }
}