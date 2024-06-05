import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/booking_card.dart';

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

  List<BookingModel> _listBookings1 = [];

  getData() async {
    _listBookings1 = await _bookingRepo.getUpcomingBookingsByCustomerId(
        FirebaseAuth.instance.currentUser!.uid);
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
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 1.6,
              ),
              itemCount: _listBookings1.length,
              itemBuilder: (context, index) {
                final booking = _listBookings1[index];
                return BookingCard(booking: booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CompletedSection extends StatefulWidget {
  const CompletedSection({super.key});

  @override
  State<CompletedSection> createState() => _CompletedSectionState();
}

class _CompletedSectionState extends State<CompletedSection> {
  final _bookingRepo = BookingRepository();

  List<BookingModel> _listCompletedBookings = [];

  getData() async {
    _listCompletedBookings =
        await _bookingRepo.getCompletedBookingsByCustomerId(
            FirebaseAuth.instance.currentUser!.uid);

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
              physics:
                  const ClampingScrollPhysics(), // Enable scrolling for GridView
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1, // Number of columns
                crossAxisSpacing: 10, // Horizontal spacing between cards
                childAspectRatio: 1.6, // Aspect ratio of each card
              ),
              itemCount: _listCompletedBookings.length,
              itemBuilder: (context, index) {
                final booking = _listCompletedBookings[index];
                return BookingCard(booking: booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CancelledSection extends StatefulWidget {
  const CancelledSection({super.key});
  @override
  State<CancelledSection> createState() => _CancelledSection();
}

class _CancelledSection extends State<CancelledSection> {
  final _bookingRepo = BookingRepository();
  List<BookingModel> _listCancelledBookings = [];

  getData() async {
    _listCancelledBookings =
        await _bookingRepo.getCancelledBookingsByCustomerId(
            FirebaseAuth.instance.currentUser!.uid);

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
              physics: const ClampingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 10,
                childAspectRatio: 1.6,
              ),
              itemCount: _listCancelledBookings.length,
              itemBuilder: (context, index) {
                final booking = _listCancelledBookings[index];
                return BookingCard(booking: booking);
              },
            ),
          ],
        ),
      ),
    );
  }
}
