// ignore_for_file: file_names, library_private_types_in_public_api

import 'dart:io';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:n3imn_project_team/model/user_model/customer_model.dart';
import 'package:n3imn_project_team/themes/colors_theme.dart';
import 'package:n3imn_project_team/view/custom_components/general_components/section_profile_component.dart';
import 'package:n3imn_project_team/view/cutomer_screens/home_navigation_screens/customer_edit_info_screen.dart';
import 'package:n3imn_project_team/view_model/customer_edit_info_view_model.dart';
import 'package:n3imn_project_team/view_model/sotrage_view_models/fetch_picture_view_model.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? imageUrl;
  File? file;

  Customer? customer = null;

  Future<String?> uploadSingleImage() async {
    String fileName = '${FirebaseAuth.instance.currentUser!.uid}.jpg';

    Reference reference =
        FirebaseStorage.instance.ref().child('profilePictures').child(fileName);

    UploadTask uploadTask = reference.putFile(file!);

    await uploadTask.whenComplete(() async {
      imageUrl = await uploadTask.snapshot.ref.getDownloadURL();
    });

    return imageUrl;
  }

  getImage() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? xFile =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (xFile != null) {
      setState(() {
        file = File(xFile.path);
      });

      await uploadSingleImage();
    }

    setState(() {});
  }

  bool isLodding = true;
  Future<void> fetchProfilePicture() async {
    try {
      CustomerEditInfoViewModel customerEditInfoViewModel =
          CustomerEditInfoViewModel();
      customer = (await customerEditInfoViewModel.loadCustomerData());
      String userId = FirebaseAuth.instance.currentUser!.uid;

      Reference reference =
          FirebaseStorage.instance.ref().child('profilePictures/$userId.jpg');

      bool pictureExists = await reference
          .getDownloadURL()
          .then((_) => true)
          .catchError((_) => false);

      if (pictureExists) {
        String downloadUrl = await reference.getDownloadURL();

        setState(() {
          imageUrl = downloadUrl;
        });
      } else {
        print('Profile picture does not exist.');

        setState(() {
          imageUrl = '';
        });
      }
    } catch (e) {
      print('Error fetching profile picture: $e');
      setState(() {
        imageUrl = '';
      });
    }
  }

  final pictureViewModel = FetchPictureStorageViewModel();
  @override
  void initState() {
    super.initState();

    fetchProfilePicture();
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
          : Center(
              child: Container(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      child: Stack(children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 4, color: AppColor.TEXT_SECONDARY),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color:
                                      AppColor.TEXT_PRIMARY.withOpacity(0.1)),
                            ],
                            shape: BoxShape.circle,
                          ),
                          child: imageUrl != null && imageUrl!.isNotEmpty
                              ? ClipOval(
                                  child: Image.network(
                                    imageUrl!,
                                    width: 130,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : const Placeholder(), // Replace Placeholder with this condition
                        ),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () async {
                                await getImage();
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 4,
                                        color: AppColor.TEXT_SECONDARY),
                                    color: AppColor.PRIMARY),
                                child: const Icon(
                                  Icons.edit,
                                  color: AppColor.TEXT_SECONDARY,
                                ),
                              ),
                            ))
                      ]),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      customer!.username,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColor.TEXT_PRIMARY),
                    ),
                    Text(
                      customer!.email,
                      style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: AppColor.TEXT_SECONDARY_LIGHT),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 231, 227, 227),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const SectionProfile(
                        sectionName: 'Edit Information',
                        icon: Icons.person,
                        routeName: 'customereditinformation'),
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SectionProfile(
                        sectionName: 'Change Password',
                        icon: Icons.lock,
                        routeName: 'customerresetpassword'),
                  ],
                ),
              ),
            ),
    );
  }
}
