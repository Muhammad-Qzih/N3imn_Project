// ignore_for_file: library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:n3imn_project_team/model/user_model/services_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/barber_repsitory/barber_repo.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';

class BarberEditServiceScreen extends StatefulWidget {
  const BarberEditServiceScreen({super.key});

  @override
  _BarberEditServiceScreenState createState() =>
      _BarberEditServiceScreenState();
}

class _BarberEditServiceScreenState extends State<BarberEditServiceScreen> {
  final List<String> _services = [];
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _editController = TextEditingController();
  final BarberRepository barberRepository = BarberRepository();

  bool isLoading = true;

  @override
  void dispose() {
    _controller.dispose();
    _editController.dispose();
    super.dispose();
  }

  void getService() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      BarberService? services =
          await barberRepository.getBarberServices(userId);
      print(services?.services.length);
      if (services != null) {
        setState(() {
          _services.addAll(services.services);
          isLoading = false;
        });
      }
    }
  }

  void updateService() async {
    await barberRepository.updateServices(
        FirebaseAuth.instance.currentUser!.uid, _services);
  }

  @override
  void initState() {
    getService();
    super.initState();
  }

  void _addService() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _services.add(_controller.text);
        _controller.clear();
      });

      updateService();
      Navigator.of(context).pop();
    }
  }

  void _editService(int index) {
    _editController.text = _services[index];
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Edit Service',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _editController,
                  decoration: const InputDecoration(
                    labelText: 'Service Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _services[index] = _editController.text;
                        });
                        Navigator.of(context).pop();
                        updateService();
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _deleteService(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Confirm Delete',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Are you sure you want to delete this service?'),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _services.removeAt(index);
                        });

                        Navigator.of(context).pop();
                        updateService();
                      },
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showAddServiceModal() {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(20.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Add New Service',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                    labelText: 'Service Name',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: _addService,
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.TEXT_SECONDARY,
      appBar: AppBar(
        iconTheme:
            const IconThemeData(color: AppColor.TEXT_SECONDARY, size: 30),
        backgroundColor: AppColor.PRIMARY,
        title: const Text(
          "Edit Services",
          style: TextStyle(
            fontSize: 20,
            color: AppColor.TEXT_SECONDARY,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      body: isLoading == true
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(height: 80),
                  Expanded(
                    child: _services.isEmpty
                        ? const Center(child: Text('No services added yet.'))
                        : ListView.builder(
                            itemCount: _services.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  padding: const EdgeInsets.all(16.0),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12.0),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            AppColor.PRIMARY.withOpacity(0.23),
                                        blurRadius: 8.0,
                                        offset: const Offset(3, 0),
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          _services[index],
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.edit,
                                            color: AppColor.PRIMARY, size: 30),
                                        onPressed: () => _editService(index),
                                      ),
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: AppColor.PRIMARY, size: 30),
                                        onPressed: () => _deleteService(index),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddServiceModal,
        child: const Icon(Icons.add),
        backgroundColor: AppColor.PRIMARY,
      ),
    );
  }
}
