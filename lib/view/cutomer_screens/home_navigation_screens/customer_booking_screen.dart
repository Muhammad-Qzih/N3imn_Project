import 'package:flutter/material.dart';
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

class UpcomingSection extends StatelessWidget {
  const UpcomingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 1),
      child: SingleChildScrollView(
        child: Column(
          children: [
            UpCommeingAppointmentCard(),
            SizedBox(height: 10),
            UpCommeingAppointmentCard(),
            SizedBox(height: 10),
            UpCommeingAppointmentCard(),
            SizedBox(height: 10),
            UpCommeingAppointmentCard(),
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
