import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/model/user_model/services_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberSalonBageInformation extends StatefulWidget {
  const BarberSalonBageInformation({super.key});

  @override
  State<BarberSalonBageInformation> createState() =>
      _BarberSalonBageInformationState();
}

class _BarberSalonBageInformationState
    extends State<BarberSalonBageInformation> {
  final List<String> _services = [];
  late final BarberSalon barber;
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
  }

  getServices(String? barberid) async {
    try {
      BarberRepository barberRepository = BarberRepository();
      final BarberService? services =
          await barberRepository.getBarberServices(barberid!);

      if (services != null) {
        setState(() {
          _services.addAll(services.services);
        });
      } else {
        setState(() {});
      }
    } catch (e) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      barber = ModalRoute.of(context)!.settings.arguments as BarberSalon;
      getServices(barber.id);
      _initialized = true;
    }

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
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.grey.shade100,
                    width: 2,
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                      barber.pictureUrl ?? 'Iamges/logo.png',
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
                    children: _services
                        .map((service) => _buildChip(service))
                        .toList(),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),

              const SizedBox(height: 50),

              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      "cutomerbooking",
                      arguments: {
                        'barber': barber,
                        'services': _services,
                      },
                    );
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
    child: Text(label, style: const TextStyle(color: Colors.white)),
  );
}
