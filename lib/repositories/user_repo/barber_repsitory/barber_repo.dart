// ignore_for_file: unused_field

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:n3imn_project_team/model/user_model/barber_model.dart';
import 'package:n3imn_project_team/model/user_model/services_model.dart';
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
    Future<String?> getProfilePictureURL(String? userId) async {
      Reference reference =
          FirebaseStorage.instance.ref().child('profilePictures/$userId.jpg');

      try {
        String downloadURL = await reference.getDownloadURL();
        return downloadURL;
      } catch (e) {
        print('Error getting profile picture for user $userId: $e');
        return null;
      }
    }
    
  Future<List<BarberSalon>> getBarbers() async {
    QuerySnapshot users = await _barbersCollection.get();
    List<BarberSalon> usersList = [];

    for (var user in users.docs) {
      BarberSalon barber = BarberSalon.fromFirestore(user);

      String? pictureURL = await getProfilePictureURL(barber.id);

      barber.pictureUrl = pictureURL;

      usersList.add(barber);
    }

    return usersList;
  }

  Future<List<BarberSalon>> getTopBarbers() async {
    QuerySnapshot users =
        await _barbersCollection.where('rating', isEqualTo: 5).get();
    List<BarberSalon> usersList = [];

    for (var user in users.docs) {
      BarberSalon barber = BarberSalon.fromFirestore(user);
      String? pictureURL = await getProfilePictureURL(barber.id);
      barber.pictureUrl = pictureURL;
      usersList.add(barber);
    }

    return usersList;
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

      barberSalon.pictureUrl = await getProfilePictureURL(barberSalonId);

      return barberSalon;
    }



    Future<List<BarberSalon>> getReommendedBarbers() async {
      QuerySnapshot users =
          await _barbersCollection.where('rating', whereIn: [5, 4]).get();
      List<BarberSalon> usersList = [];

      for (var user in users.docs) {
        BarberSalon barber = BarberSalon.fromFirestore(user);
        String? pictureURL = await getProfilePictureURL(barber.id);
        barber.pictureUrl = pictureURL;
        usersList.add(barber);
      }

      return usersList;
    }

    Future<void> updateServices(String barberId, List<String> services) async {
      try {
        final serviceRef =
            FirebaseFirestore.instance.collection('services').doc(barberId);

        BarberService barberService = BarberService(services: services);

        await serviceRef.set(barberService.toJson());

        print('Barber services updated successfully!');
      } catch (error) {
        print('Error updating barber services: $error');
      }
    }

    Future<BarberService?> getBarberServices(String barberId) async {
      try {
        final DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('services')
            .doc(barberId)
            .get();

        if (doc.exists) {
          return BarberService.fromFirestore(doc);
        } else {
          print('No such document!');
          return null;
        }
      } catch (error) {
        print('Error getting barber services: $error');
        return null;
      }
    }
  }
