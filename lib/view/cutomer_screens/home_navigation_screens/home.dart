import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/repositories/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/barber_date_card.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/salon_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BookingModel> _listUpcommingBookings = [];
  List<BarberSalon> _listBarberSalons = [];
  List<BarberSalon> _listRecomendedBarberSalons = [];
  bool isLodding = true;
  getData() async {
    final bookingRepo = BookingRepository();
    _listUpcommingBookings = await bookingRepo.getUpcomingBookingsByCustomerId(
        FirebaseAuth.instance.currentUser!.uid);

    final barberRepo = BarberRepository();
    _listBarberSalons = await barberRepo.getTopBarbers();

    _listRecomendedBarberSalons = await barberRepo.getReommendedBarbers();

    setState(() {});
  }

  @override
  void initState() {
    getData();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLodding = false;
      });
    });
    super.initState();
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
                    "My Haircut Dates",
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColor.TEXT_PRIMARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.76,
                      ),
                      itemCount: _listUpcommingBookings.length,
                      itemBuilder: (context, index) {
                        final booking = _listUpcommingBookings[index];
                        return BarberDateCard(
                          date: "${booking.date}, ${booking.startBookingTime}",
                          salonName: booking.barberSalonName,
                          services: booking.services,
                          location: booking.location,
                          onPressed: () {},
                          width: 300,
                          height: 160,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Top Barber Shops",
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColor.TEXT_PRIMARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: _listBarberSalons.length,
                      itemBuilder: (context, index) {
                        final barber = _listBarberSalons[index];
                        return SalonCard(
                          salonName: barber.shopName,
                          location: barber.location,
                          rating: barber.rating,
                          onPressed: () {
                            Navigator.of(context).pushNamed("barberinformation",
                                arguments: barber);
                          },
                          width: 300,
                          height: 160,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: Text(
                    "Recommendation",
                    style: TextStyle(
                      fontSize: 23,
                      color: AppColor.TEXT_PRIMARY,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 140,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 5,
                        childAspectRatio: 0.9,
                      ),
                      itemCount: _listRecomendedBarberSalons.length,
                      itemBuilder: (context, index) {
                        final barber = _listRecomendedBarberSalons[index];
                        return SalonCard(
                          salonName: barber.shopName,
                          location: barber.location,
                          rating: barber.rating,
                          onPressed: () {
                            Navigator.of(context).pushNamed("barberinformation",
                                arguments: barber);
                          },
                          width: 300,
                          height: 160,
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
