// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/repositories/user_repo/abstract_classes/Ibarber_repo.dart';

class BarberRepository implements IBarberRepository {
  final CollectionReference _barbersCollection =
      FirebaseFirestore.instance.collection('barbers');

  @override
  Future<void> addBarber(String userId, BarberSalon barberSalon) async {
    await _barbersCollection.doc(userId).set(
          barberSalon.toJson(),
        );
  }

  Future<DocumentSnapshot?> getBarberDocumentByID(String barberId) async {
    return await _barbersCollection.doc(barberId).get();
  }

  // Future<List<BarberSalon>> getBarbers() async {
  //   QuerySnapshot users = await _barbersCollection.get();
  //   List<BarberSalon> usersList = [];
  //   for (var user in users.docs) {
  //     usersList.add(BarberSalon.fromFirestore(user));
  //   }
  //   return usersList;
  // }
  Future<List<BarberSalon>> getBarbers() async {
    QuerySnapshot users = await _barbersCollection.get();
    List<BarberSalon> usersList = [];

    for (var user in users.docs) {
      BarberSalon barber = BarberSalon.fromFirestore(user);

      // Get the URL for the barber's profile picture
      String? pictureURL = await getProfilePictureURL(barber.id);

      // Assign the picture URL to the barber object
      barber.pictureUrl = pictureURL;

      usersList.add(barber);
    }

    return usersList;
  }

  Future<String?> getProfilePictureURL(String? userId) async {
    // Construct the reference to the image using the userId
    Reference reference =
        FirebaseStorage.instance.ref().child('profilePictures/$userId.jpg');

    try {
      // Get the download URL for the image
      String downloadURL = await reference.getDownloadURL();
      return downloadURL;
    } catch (e) {
      // Handle errors if the image doesn't exist or other issues
      print('Error getting profile picture for user $userId: $e');
      return null; // Or return a default image URL
    }
  }

  Future<void> updateBarberProfileById(
      String user,
      String shopNameController,
      String emailController,
      String phoneController,
      String locationController) async {
    await _barbersCollection.doc(user).update({
      'shopName': shopNameController,
      'email': emailController,
      'phoneNumber': phoneController,
      'location': locationController,
    });
  }

  Future<BarberSalon?> fetchBarberProfile(String barberSalonId) async {
    DocumentSnapshot<Object?> user =
        await _barbersCollection.doc(barberSalonId).get();

    BarberSalon? barberSalon =
        BarberSalon.fromJson(user.data() as Map<String, dynamic>);

    barberSalon.pictureUrl =  await getProfilePictureURL(barberSalonId);
    
    return barberSalon;
  }
}
