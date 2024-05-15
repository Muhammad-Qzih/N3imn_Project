// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/custom_auth_button.dart';

class BarbershopsScreen extends StatefulWidget {
  const BarbershopsScreen({super.key});

  @override
  _BarbershopsScreenState createState() => _BarbershopsScreenState();
}

class _BarbershopsScreenState extends State<BarbershopsScreen> {
  final _barberSalonsFuture = BarberRepository();

  List<BarberSalon> _listBarbers = [];

  getData() async {
    _listBarbers =
        await _barberSalonsFuture.getBarbers();
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
      backgroundColor: AppColor.TEXT_SECONDARY,
      body: GridView.builder(
        itemCount: _listBarbers.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1, mainAxisExtent: 370),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
              onTap: () {},
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                color: Colors.black,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.PRIMARY.withOpacity(0.4),
                        spreadRadius: 1.5,
                        blurRadius: 1,
                        offset: const Offset(3, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        child: Image.asset(
                          'Images/logo.png',
                          height: 100,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                      ListTile(
                        title: Text(
                          "${_listBarbers[i].shopName} Salone",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: AppColor.PRIMARY,
                                ),
                                const SizedBox(
                                    width:
                                        5), // Add some space between icon and text
                                Expanded(
                                  child: Text(
                                    _listBarbers[i].location,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 19,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const SizedBox(width: 10),
                                Text(
                                  _listBarbers[i].status == 1
                                      ? 'Open'
                                      : 'Closed',
                                  style: TextStyle(
                                    color: _listBarbers[i].status == 1
                                        ? Colors.green
                                        : Colors.red,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: List.generate(_listBarbers[i].rating,
                                  (index) {
                                if (index == 0) {
                                  const Row(
                                    children: [
                                      SizedBox(width: 10),
                                      Icon(Icons.star,
                                          color: Colors.amber, size: 20),
                                      // Add a SizedBox after the first Icon
                                    ],
                                  );
                                }
                                return const Icon(Icons.star,
                                    color: Colors.amber, size: 20);
                              }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: CsutomAuthButton(
                                buttonText: 'Book now',
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 145,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
