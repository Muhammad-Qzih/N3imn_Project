import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view_model/bookings_dash_view_model.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarberDashbored extends StatefulWidget {
  const BarberDashbored({super.key});

  @override
  State<BarberDashbored> createState() => _BarberDashboredState();
}

class _BarberDashboredState extends State<BarberDashbored> {
  final bookingDashViewModel = BookingDashViewModel();
  late int upcomingCount = 0;
  late int cancelledCount = 0;
  late int completedCount = 0;
  late double rate = 0.0;
  List<BookingDashbord> data = [];
  bool isLodding = true;
  late int customersCount;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> getData() async {
    final userId = FirebaseAuth.instance.currentUser!.uid;

    final int? upcoming =
    await bookingDashViewModel.getUpcommingBookingsCountByBarberId(userId);
    final int? cancelled =
    await bookingDashViewModel.getCancelledBookingsCountByBarberId(userId);
    final int? completed =
    await bookingDashViewModel.getCompletedBookingsCountByBarberId(userId);
    final List<double>? rates =
    await bookingDashViewModel.getRatesByBarberId(userId);
    final double barberRate = bookingDashViewModel.computeAverageRate(rates!);

    final int barberCustomersCount =
    await bookingDashViewModel.getCustomersCountByBarberId(userId);

    if (mounted) {
      setState(() {
        upcomingCount = upcoming ?? 0;
        cancelledCount = cancelled ?? 0;
        completedCount = completed ?? 0;
        rate = barberRate;
        customersCount = barberCustomersCount;
        data = [
          BookingDashbord('Completed', completedCount, Colors.red),
          BookingDashbord('Cancelled', cancelledCount, Colors.yellow),
          BookingDashbord('Upcoming', upcomingCount, Colors.blue),
        ];
      });
    }

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        isLodding = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: isLodding == true
          ? const Center(
        child: CircularProgressIndicator(),
      )
          : Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Rating',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Icon(
                          Icons.star,
                          color: AppColor.PRIMARY,
                          size: 30,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$rate',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      children: [
                        const Text(
                          'Customers',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(height: 10),
                        const Icon(
                          Icons.person,
                          color: AppColor.PRIMARY,
                          size: 30,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '$customersCount',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Text(
                      'Booking Statistics',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: SfCircularChart(
                        legend: const Legend(
                          isVisible: true,
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                          overflowMode: LegendItemOverflowMode.wrap,
                        ),
                        series: <CircularSeries>[
                          PieSeries<BookingDashbord, String>(
                            dataSource: data,
                            xValueMapper: (BookingDashbord data, _) =>
                            data.status,
                            yValueMapper: (BookingDashbord data, _) =>
                            data.count,
                            pointColorMapper: (BookingDashbord data, _) =>
                            data.color,
                            dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingDashbord {
  final String status;
  final int count;
  final Color color;

  BookingDashbord(this.status, this.count, this.color);
}
