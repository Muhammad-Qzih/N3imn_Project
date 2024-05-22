import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/appointement_upcomming_card.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/appointment_completed_card.dart';

class CustomerBookingsScreen extends StatefulWidget {
  const CustomerBookingsScreen({super.key});

  @override
  State<CustomerBookingsScreen> createState() => _CustomerBookingsScreenState();
}

class _CustomerBookingsScreenState extends State<CustomerBookingsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.TEXT_SECONDARY,
      appBar: AppBar(
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: "Upcoming"),
            Tab(text: "Completed"),
            Tab(text: "Cancelled"),
          ],
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(
              color: AppColor.PRIMARY,
              width: 2.0,
            ),
            insets: EdgeInsets.symmetric(horizontal: 90),
          ),
          labelStyle: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.normal,
          ),
          labelColor: AppColor.TEXT_PRIMARY,
          unselectedLabelColor: Colors.grey,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          UpcomingSection(),
          CompletedSection(),
          CancelledSection(),
        ],
      ),
    );
  }
}

class UpcomingSection extends StatefulWidget {
  const UpcomingSection({super.key});

  @override
  State<UpcomingSection> createState() => _UpcomingSectionState();
}

class _UpcomingSectionState extends State<UpcomingSection> {
  final _bookingRepo = BookingRepository();

  List<Booking> _listBookings = [];

  getData() async {
    _listBookings = await _bookingRepo
        .getBookingsByCustomerId(FirebaseAuth.instance.currentUser!.uid);
    print(FirebaseAuth.instance.currentUser!.uid);
    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

 @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(), // Enable scrolling for GridView
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 10, // Horizontal spacing between cards
                childAspectRatio: 1.6, // Aspect ratio of each card
              ),
              itemCount: _listBookings.length,
              itemBuilder: (context, index) {
                final booking = _listBookings[index];
                return UpCommeingAppointmentCard(booking: booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}


class CompletedSection extends StatelessWidget {
  const CompletedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CompletedAppointmentCard(),
            SizedBox(height: 10),
            CompletedAppointmentCard(),
            SizedBox(height: 10),
            CompletedAppointmentCard(),
            SizedBox(height: 10),
            CompletedAppointmentCard(),
          ],
        ),
      ),
    );
  }
}

class CancelledSection extends StatelessWidget {
  const CancelledSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Cancelled Tasks"));
  }
}
