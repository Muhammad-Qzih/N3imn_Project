import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:n3imn_project_team/dep_injection/dependency_injection.dart';
import 'package:n3imn_project_team/services/auth_service/auth_service.dart';

class FetchPictureStorageViewModel  {
//   String? _imageUrl;
//   File? _file;

//   String? get imageUrl => _imageUrl;

//   Future<String?> uploadSingleImage() async {
//     //Set File Name
//     String fileName = '${FirebaseAuth.instance.currentUser!.uid}.jpg';

//     //Create Reference
//     Reference reference =
//         FirebaseStorage.instance.ref().child('profilePictures').child(fileName);

//     //Now We have to check status of UploadTask
//     UploadTask uploadTask = reference.putFile(_file!);

//     await uploadTask.whenComplete(() async {
//       _imageUrl = await uploadTask.snapshot.ref.getDownloadURL();
//     });

//     return imageUrl;
//   }



//   getImage() async {
//     final ImagePicker imagePicker = ImagePicker();
//     final XFile? xFile =
//         await imagePicker.pickImage(source: ImageSource.camera);

//     if (xFile != null) {
//       setState(() {
//         file = File(xFile.path);
//       });
//       // var storage = FirebaseStorage.instance.ref("1.jpg");
//       // await storage.putFile(file!);

//       await uploadSingleImage();
//     }

//     setState(() {});
//   }



//   Future<void> fetchProfilePicture(BuildContext context) async {
//     try {
//       String userId = FirebaseAuth.instance.currentUser!.uid;
//       Reference reference =
//           FirebaseStorage.instance.ref().child('profilePictures/$userId.jpg');

//       bool pictureExists = await reference.getDownloadURL().then((_) => true).catchError((_) => false);

//       if (pictureExists) {
//         _imageUrl = await reference.getDownloadURL();
//       } else {
//         print('Profile picture does not exist.');
//         _imageUrl = null; // Set imageUrl to null if picture does not exist
//       }
//        // Notify listeners on imageUrl change
//     } catch (e) {
//       print('Error fetching profile picture: $e');
//     }
//   }
}