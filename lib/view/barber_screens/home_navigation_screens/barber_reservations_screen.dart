import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/repositories/user_repo/customer_repository/csutomer_repo.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/reservation_card.dart';

class BarberReservations extends StatefulWidget {
  const BarberReservations({super.key});

  @override
  State<BarberReservations> createState() => _BarberReservationsState();
}

class _BarberReservationsState extends State<BarberReservations> {
  List<BookingModel> futureBookings = [];
  List<Customer> _listBarberCustomers = [];

  Map<String, Map<String, String>> customerInfoMap = {};

  bool isLodding = true;
  void _generateCustomerInfoMap() {
    for (var customer in _listBarberCustomers) {
      customerInfoMap[customer.id!] = {
        'name': customer.username,
        'phone': customer.phoneNumber,
      };
    }
  }

  getData() async {
    final _bookingRepo = BookingRepository();
    futureBookings = await _bookingRepo.getUpcomingToAccepctBookingsByBarberId(
        FirebaseAuth.instance.currentUser!.uid);
    final customerRepo = CustomerRepository();
    _listBarberCustomers = await customerRepo.getAllCustomers();

    _generateCustomerInfoMap();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLodding = false;
      });
    });

    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLodding == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: ListView.builder(
                      itemCount: futureBookings.length,
                      itemBuilder: (context, index) {
                        final booking = futureBookings[index];

                        final customerInfo =
                            customerInfoMap[booking.customerId] ??
                                {'name': 'Unknown', 'phone': 'Unknown'};

                        final customerName = customerInfo['name']!;
                        final customerPhone = customerInfo['phone']!;
                        return ReservationCard(booking: booking, customerName: customerName,customerPhone:customerPhone);
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
