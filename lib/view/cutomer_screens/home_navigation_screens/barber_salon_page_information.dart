import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberSalonBageInformation extends StatefulWidget {
  const BarberSalonBageInformation({super.key});

  @override
  State<BarberSalonBageInformation> createState() =>
      _BarberSalonBageInformationState();
}

class _BarberSalonBageInformationState
    extends State<BarberSalonBageInformation> {
  @override
  Widget build(BuildContext context) {
    final barber = ModalRoute.of(context)!.settings.arguments as BarberSalon;
    return Scaffold(
      backgroundColor: AppColor.TEXT_SECONDARY,
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
        backgroundColor: AppColor.PRIMARY,
        title: Text(
          "${barber.shopName} Salon",
          style: const TextStyle(
            fontSize: 20,
            color: AppColor.TEXT_SECONDARY,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade100, // Choose your border color
                    width: 2, // Choose your border width
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      barber.pictureUrl ??
                          'Iamges/logo.png', // Use a default image URL if pictureUrl is null
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Salon name
              Center(
                child: Text(
                  barber.shopName,
                  style: const TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                "Salon Information",
                style: TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.location_on, color: AppColor.PRIMARY),
                  const SizedBox(width: 8),
                  Text("${barber.location} "),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.access_time, color: AppColor.PRIMARY),
                  SizedBox(width: 8),
                  Text("9:30AM - 8:00PM"),
                ],
              ),
              const SizedBox(height: 8),
              const Row(
                children: [
                  Icon(Icons.calendar_today, color: AppColor.PRIMARY),
                  SizedBox(width: 8),
                  Text(
                    "Monday",
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.phone, color: AppColor.PRIMARY),
                  const SizedBox(width: 8),
                  Text("${barber.phoneNumber} "),
                ],
              ),
              const SizedBox(height: 50),
              const Text(
                "Salon Services",
                style: TextStyle(
                  color: AppColor.TEXT_PRIMARY,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildChip("Haircut"),
                      _buildChip("Beard Style"),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      _buildChip("Hair Style"),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("cutomerbooking");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.PRIMARY,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 15),
                  ),
                  child: const Text(
                    "Book Now",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildChip(String label) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(50.0),
      color: AppColor.PRIMARY,
    ),
    child: Text(label, style: TextStyle(color: Colors.white)),
  );
}
