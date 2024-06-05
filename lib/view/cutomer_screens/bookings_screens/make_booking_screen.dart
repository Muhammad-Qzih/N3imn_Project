import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_add_model.dart';
import 'package:n3imn_project_team/model/bookings_model.dart/booking_status.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/booking_repo/booking_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/booking_details_card.dart';

class MakeBookingScreen extends StatefulWidget {
  const MakeBookingScreen({super.key});

  @override
  State<MakeBookingScreen> createState() => _MakeBookingScreenState();
}

class _MakeBookingScreenState extends State<MakeBookingScreen> {
  int _currentStep = 0;
  final Set<String> _selectedServices = {};
  int _totalTime = 0;
  String? _selectedTime;

  String? _selectedDate;

  List<String> generateDates(int year, int month) {
    List<String> dates = [];
    int daysInMonth = DateTime(year, month + 1, 0).day;
    for (int i = 1; i <= daysInMonth; i++) {
      dates.add(DateFormat('MMM d, yyyy').format(DateTime(year, month, i)));
    }
    return dates;
  }

  late List<String> daysOfFebruary2024;

  int currentIndex = 0;

  List<String> availableTimes = [];

  Future<List<String>> fetchBookedTimes(String date) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('bookings')
        .where('date', isEqualTo: date)
        .get();

    List<String> bookedTimes = [];
    for (var doc in snapshot.docs) {
      bookedTimes.add(doc['startBookingTime'] + ' - ' + doc['endBookingTime']);
    }
    return bookedTimes;
  }

  void _filterAvailableTimes() async {
    List<String> bookedTimes =
        await fetchBookedTimes(daysOfFebruary2024[currentIndex]);

    setState(() {
      availableTimes = mergedArray[0]['times']!
          .where((time) => !bookedTimes.contains(time))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    daysOfFebruary2024 = generateDates(2024, 2);
    _filterAvailableTimes();
  }

  final List<Map<String, List<String>>> mergedArray = [
    {
      'times': [
        '08:00 AM - 09:00 AM',
        '10:00 AM - 11:00 AM',
        '11:00 AM - 12:00 AM',
        '12:00 AM - 01:00 AM',
        '01:00 PM - 02:00 PM',
        '02:00 PM - 03:00 PM',
        '03:00 PM - 04:00 PM',
        '04:00 PM - 05:00 PM',
        '05:00 PM - 06:00 PM',
        '06:00 PM - 07:00 PM',
        '07:00 PM - 08:00 PM',
        '08:00 PM - 09:00 PM',
        '09:00 PM - 10:00 PM',
      ]
    },
  ];

  void previousDate() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
        _filterAvailableTimes();
      });
    }
  }

  void nextDate() {
    if (currentIndex < daysOfFebruary2024.length - 1) {
      setState(() {
        currentIndex++;
        _filterAvailableTimes();
      });
    }
  }

  void _nextStep() {
    if (_currentStep == 0 && _selectedServices.isEmpty) {
      return;
    }
    if (_currentStep < 2) {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep -= 1;
      });
    }
  }

  void _confirmStep(BarberSalon barber) async {
    _nextStep();
    BookingRepository bookingRepository = BookingRepository();

    await bookingRepository.addCustomerBooking(BookingModel(
        location: barber.location,
        barberSalonName: barber.shopName,
        customerId: FirebaseAuth.instance.currentUser!.uid,
        barberId: barber.id!,
        startBookingTime: _selectedTime!.split(" - ")[0],
        endBookingTime: _selectedTime!.split(" - ")[1],
        services: _selectedServices,
        status: BookingStatus.upcommingToAccept.index,
        date: _selectedDate!));

    Navigator.of(context).pushReplacementNamed("customerhomepage");
  }

  void _toggleServiceSelection(String service, int time) {
    setState(() {
      if (_selectedServices.contains(service)) {
        _selectedServices.remove(service);
        _totalTime -= time;
      } else {
        _selectedServices.add(service);
        _totalTime += time;
      }
    });
  }

  void _selectTime(String time, int currentIndex) {
    setState(() {
      _selectedTime = time;
      _selectedDate = daysOfFebruary2024[currentIndex];
    });
  }

  Widget _buildStepper() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Row(
          children: [
            _buildStep(index),
            if (index != 2) _buildLine(),
          ],
        );
      }),
    );
  }

  Widget _buildStep(int step) {
    bool isActive = step == _currentStep;
    bool isCompleted = step < _currentStep;

    return Column(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive ? AppColor.PRIMARY : AppColor.PRIMARY_LIGHT,
              width: isActive ? 4.0 : 2.0,
            ),
          ),
          child: CircleAvatar(
            radius: isActive ? 22 : 20,
            backgroundColor: isActive || isCompleted
                ? AppColor.PRIMARY
                : AppColor.TEXT_SECONDARY,
            child: Text(
              '0${step + 1}',
              style: TextStyle(
                  color:
                      isActive || isCompleted ? Colors.white : AppColor.PRIMARY,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLine() {
    return Container(
      width: 100,
      height: 2,
      color: AppColor.PRIMARY_LIGHT,
    );
  }

  Widget _buildContent(BarberSalon barberId, List<String> services) {
    switch (_currentStep) {
      case 0:
        return Expanded(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                "Choose Services:",
                style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              ...services.map((service) {
                return CheckboxListTile(
                  title: Text(service),
                  value: _selectedServices.contains(service),
                  onChanged: (bool? value) {
                    _toggleServiceSelection(service, 30);
                  },
                );
              }),
              if (_selectedServices.isNotEmpty)
                Text(
                  'Total time: ${_totalTime ~/ 60} hour(s) and ${_totalTime % 60} minute(s)',
                  style: const TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 16,
                  ),
                ),
            ],
          ),
        );
      case 1:
        return Expanded(
          child: Column(
            children: [
              const Text(
                "Select a Date:",
                style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: previousDate,
                        icon: const Icon(Icons.arrow_back_ios),
                        color: const Color.fromARGB(255, 192, 191, 199),
                        iconSize: 50,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        daysOfFebruary2024[currentIndex],
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: nextDate,
                        icon: const Icon(Icons.arrow_forward_ios),
                        color: const Color.fromARGB(255, 192, 191, 199),
                        iconSize: 50,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Select a Time:",
                style: TextStyle(
                    color: AppColor.TEXT_PRIMARY,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView(
                  children: availableTimes.map((time) {
                    bool isSelected = _selectedTime == time;
                    bool isDisabled = false;

                    return GestureDetector(
                      onTap: isDisabled
                          ? null
                          : () => _selectTime(time, currentIndex),
                      child: Card(
                        color: isSelected
                            ? AppColor.PRIMARY
                            : isDisabled
                                ? Colors.grey
                                : Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                time,
                                style: TextStyle(
                                  color: isSelected || isDisabled
                                      ? Colors.white
                                      : AppColor.TEXT_PRIMARY,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: isDisabled
                                    ? null
                                    : () => _selectTime(time, currentIndex),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: isSelected
                                      ? AppColor.PRIMARY
                                      : Colors.white,
                                  backgroundColor: isSelected
                                      ? Colors.white
                                      : AppColor.PRIMARY,
                                ),
                                child: const Text('Select'),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        );
      case 2:
        return Expanded(
            child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            BookingDetailsCard(
              selectedServices: _selectedServices,
              selectedTime: _selectedTime,
              timeRequired: _totalTime,
              selectedDate: _selectedDate,
              barberSalon: barberId,
            ),
          ],
        ));
      default:
        return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    final argment = ModalRoute.of(context)!.settings.arguments as Map;
    final barber = argment["barber"];
    final services = argment["services"];

    return Scaffold(
      backgroundColor: AppColor.TEXT_SECONDARY,
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
        backgroundColor: AppColor.PRIMARY,
        title: const Text(
          "Make a Booking",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.TEXT_SECONDARY,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildStepper(),
            const SizedBox(height: 20),
            _buildContent(barber, services),
            Padding(
              padding: const EdgeInsets.only(bottom: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  if (_currentStep != 0)
                    CustomAuthButton(
                      buttonText: 'Back',
                      onPressed: _previousStep,
                    ),
                  if (_currentStep == 2)
                    CustomAuthButton(
                      buttonText: 'Confirm',
                      onPressed: () => {_confirmStep(barber)},
                    ),
                  if (_currentStep != 2)
                    CustomAuthButton(
                      buttonText: 'Next',
                      onPressed: (_currentStep == 0
                          ? _selectedServices.isNotEmpty
                              ? _nextStep
                              : null
                          : (_selectedTime != null)
                              ? _nextStep
                              : null),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomAuthButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback? onPressed;

  const CustomAuthButton({
    super.key,
    required this.buttonText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColor.TEXT_SECONDARY,
        backgroundColor: AppColor.PRIMARY,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 17),
        minimumSize: const Size(100, 60),
        textStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      child: Text(buttonText),
    );
  }
}
