import 'package:flutter/material.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class CustomerBookingsScreen extends StatefulWidget {
  const CustomerBookingsScreen({super.key});

  @override
  State<CustomerBookingsScreen> createState() => _CustomerBookingsScreenState();
}

class _CustomerBookingsScreenState extends State<CustomerBookingsScreen> with SingleTickerProviderStateMixin {
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
          UpcomingTasks(),
          CompletedTasks(),
          CancelledTasks(),
        ],
      ),
    );
  }
}

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Upcoming Tasks"));
  }
}

class CompletedTasks extends StatelessWidget {
  const CompletedTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Completed Tasks"));
  }
}

class CancelledTasks extends StatelessWidget {
  const CancelledTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Cancelled Tasks"));
  }
}
