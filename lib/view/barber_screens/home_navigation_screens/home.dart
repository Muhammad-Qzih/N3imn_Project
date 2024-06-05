import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';
import 'package:n3imn_project_team/repositories/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/barber_appointment_card.dart';

class BarberHome extends StatefulWidget {
  const BarberHome({super.key});

  @override
  State<BarberHome> createState() => _BarberHomeState();
}

class _BarberHomeState extends State<BarberHome> {
  List<BookingModel> _listUpcommingBookings = [];
  List<Customer> _listBarberCustomers = [];
  bool isLodding = true;
  Map<String, Map<String, String>> customerInfoMap = {};

  getData() async {
    final bookingRepo = BookingRepository();
    _listUpcommingBookings = await bookingRepo
        .getUpcomingBookingsByBarberId(FirebaseAuth.instance.currentUser!.uid);

    final customerRepo = CustomerRepository();
    _listBarberCustomers = await customerRepo.getAllCustomers();

    _generateCustomerInfoMap();

    _listUpcommingBookings.sort((a, b) {
      int numberA = _extractNumber(a.date);
      int numberB = _extractNumber(b.date);
      return numberA.compareTo(numberB);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLodding = false;
      });
    });

    setState(() {});
  }

  int _extractNumber(String date) {
    final RegExp regExp = RegExp(r'(\d+)');
    final Match? match = regExp.firstMatch(date);
    if (match != null) {
      return int.parse(match.group(0)!);
    }
    return 0;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  void _generateCustomerInfoMap() {
    for (var customer in _listBarberCustomers) {
      customerInfoMap[customer.id!] = {
        'name': customer.username,
        'phone': customer.phoneNumber,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.TEXT_SECONDARY,
      body: isLodding == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Customers reservations",
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColor.TEXT_PRIMARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: ListView.builder(
                      itemCount: _listUpcommingBookings.length,
                      itemBuilder: (context, index) {
                        final booking = _listUpcommingBookings[index];

                        final customerInfo =
                            customerInfoMap[booking.customerId] ??
                                {'name': 'Unknown', 'phone': 'Unknown'};

                        final customerName = customerInfo['name']!;
                        final customerPhone = customerInfo['phone']!;
                        return BarberAppointmentCard(
                          date: "${booking.date}, ${booking.startBookingTime}",
                          services: booking.services,
                          timeRequired: "1h",
                          cusotmerName: customerName,
                          customerPhoneNumber: customerPhone,
                          width:
                              double.infinity, // Make the card take full width
                          height: 180,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
    );
  }
}
