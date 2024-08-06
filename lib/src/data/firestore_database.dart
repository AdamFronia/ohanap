import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

class FirestoreDatabase implements DatabaseRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  late String docId;

  Future userId() async {
    UserCredential userCredential = (firebaseAuth) as UserCredential;
    User? user = userCredential.user;
    docId = user!.uid;
  }

  @override
  Future<void> updateAboutMe(
      String firestoreKey, String value, String docID) async {
    await firestore.collection("profiles").doc(docID).update({
      firestoreKey: value,
    });
  }

  @override
  Future<List<Profile>> getAllProfiles() async {
    try {
      final snapshot = await firestore.collection('profiles').get();
      final profiles = snapshot.docs.map((doc) {
        final data = doc.data();
        log('Fetched profile data: $data');
        return Profile.fromMap(data, doc.id); // Pass the document ID here
      }).toList();
      return profiles;
    } catch (e) {
      log('Error fetching profiles: $e');
      rethrow;
    }
  }

  @override
  Future<void> updateToDoList(
      List<Map<String, dynamic>> listToDO, String docID) async {
    await firestore
        .collection("profiles")
        .doc(docID)
        .update({"dataList": listToDO});
  }

  @override
  Stream<Profile> getSpecificProfile(String docID) {
    return firestore
        .collection("profiles")
        .doc(docID)
        .snapshots()
        .map((snapshot) => Profile.fromMap(snapshot.data()!, docID));
  }

  @override
  Future<void> updateRelationshipStatus(
      String docID, String relationshipStatus) async {
    await firestore.collection("profiles").doc(docID).update(
      {
        "relationShip": relationshipStatus,
      },
    );
  }

  @override
  Future<void> updateCity(String docID, String city) async {
    await firestore.collection("profiles").doc(docID).update({
      "city": city,
    });
  }

  Future<void> updateFavoriteHobby(String docID, String hobby) async {
    await firestore.collection("profiles").doc(docID).update({
      "hobby": hobby,
    });
  }

  Future<void> updateFavoriteHolidayLocation(
      String docID, String holiday) async {
    await firestore.collection("profiles").doc(docID).update({
      "holiday": holiday,
    });
  }

  Future<void> updateJob(String docID, String job) async {
    await firestore.collection("profiles").doc(docID).update({
      "job": job,
    });
  }

  Future<void> updateWishJob(String docID, String wishJob) async {
    await firestore.collection("profiles").doc(docID).update({
      "wishJob": wishJob,
    });
  }

  Future<void> updateFavoriteColor(String docID, int colorValue) async {
    await firestore.collection("profiles").doc(docID).update({
      "color": colorValue,
    });
  }

  Future<void> updateBirthdate(String docID, String birthdate) async {
    await firestore.collection("profiles").doc(docID).update({
      "birthdate": birthdate,
    });
  }

  Future<void> updateSleepTime(String docID, String sleepTime) async {
    await firestore.collection("profiles").doc(docID).update({
      "sleepTime": sleepTime,
    });
  }

  Future<void> updateFavorites(
      String docID, Map<String, dynamic> favorites) async {
    await firestore.collection("profiles").doc(docID).update(favorites);
  }

  Future<void> updateGoodies(String docID, String goodies) async {
    await firestore.collection("profiles").doc(docID).update({
      "goodies": goodies,
    });
  }

  Future<void> updateFunnys(String docID, String funnys) async {
    await firestore.collection("profiles").doc(docID).update({
      "funnys": funnys,
    });
  }

  Future<void> updateFutures(String docID, String futures) async {
    await firestore.collection("profiles").doc(docID).update({
      "futures": futures,
    });
  }

  @override
  Future<void> updateDescription(String docID, String description) async {
    try {
      await firestore.collection('profiles').doc(docID).update({
        'readme': description,
      });
    } catch (e) {
      print('Failed to update description: $e');
      rethrow;
    }
  }

  @override
  profilesStream() {
    // TODO: implement profilesStream
    throw UnimplementedError();
  }
}
