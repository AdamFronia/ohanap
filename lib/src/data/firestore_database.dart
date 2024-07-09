import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

class FirestoreDatabase implements DatabaseRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Profile>> getAllProfiles() async {
    final snapshot = await firestore.collection('profiles').get();
    List<Profile> profiles = snapshot.docs
        .map((doc) => Profile.fromMap(doc.data(), doc.id))
        .toList();

    return profiles;
  }

  @override
  Future<void> updateToDoList(Map<String, dynamic> map, String docID) async {
    await firestore.collection("profiles").doc(docID).update(map);
  }

  @override
  Stream<Profile> getSpecificProfile(String docID) {
    return firestore
        .collection("profiles")
        .doc(docID)
        .snapshots()
        .map((snapshot) => Profile.fromMap(snapshot.data()!, docID));
  }

  // Method to update relationship status
  @override
  Future<void> updateRelationshipStatus(
      String docID, String relationshipStatus) async {
    await firestore.collection("profiles").doc(docID).update(
      {
        "relationShip": relationshipStatus,
      },
    );
  }

  // Method to update city
  Future<void> updateCity(String docID, String city) async {
    await firestore.collection("profiles").doc(docID).update({
      "city": city,
    });
  }

  // Method to update favorite hobby
  Future<void> updateFavoriteHobby(String docID, String hobby) async {
    await firestore.collection("profiles").doc(docID).update({
      "hobby": hobby,
    });
  }

  // Method to update favorite holiday location
  Future<void> updateFavoriteHolidayLocation(
      String docID, String holiday) async {
    await firestore.collection("profiles").doc(docID).update({
      "holiday": holiday,
    });
  }

  // Method to update job
  Future<void> updateJob(String docID, String job) async {
    await firestore.collection("profiles").doc(docID).update({
      "job": job,
    });
  }

  // Method to update wish job
  Future<void> updateWishJob(String docID, String wishJob) async {
    await firestore.collection("profiles").doc(docID).update({
      "wishJob": wishJob,
    });
  }

  // Method to update favorite color
  Future<void> updateFavoriteColor(String docID, int colorValue) async {
    await firestore.collection("profiles").doc(docID).update({
      "color": colorValue,
    });
  }

  // Method to update birthdate
  Future<void> updateBirthdate(String docID, String birthdate) async {
    await firestore.collection("profiles").doc(docID).update({
      "birthdate": birthdate,
    });
  }

  // Method to update sleep time
  Future<void> updateSleepTime(String docID, String sleepTime) async {
    await firestore.collection("profiles").doc(docID).update({
      "sleepTime": sleepTime,
    });
  }

  // Method to update favorites
  Future<void> updateFavorites(
      String docID, Map<String, dynamic> favorites) async {
    await firestore.collection("profiles").doc(docID).update(favorites);
  }

  // Method to update about me
  Future<void> updateAboutMe(String docID, String aboutMe) async {
    await firestore.collection("profiles").doc(docID).update({
      "aboutMe": aboutMe,
    });
  }

  // Method to update goodies
  Future<void> updateGoodies(String docID, String goodies) async {
    await firestore.collection("profiles").doc(docID).update({
      "goodies": goodies,
    });
  }

  // Method to update funnys
  Future<void> updateFunnys(String docID, String funnys) async {
    await firestore.collection("profiles").doc(docID).update({
      "funnys": funnys,
    });
  }

  // Method to update futures
  Future<void> updateFutures(String docID, String futures) async {
    await firestore.collection("profiles").doc(docID).update({
      "futures": futures,
    });
  }

  @override
  Future<void> updateDiscription(String docID, String discription) async {
    await firestore.collection("profiles").doc(docID).update(
      {
        "readme": discription,
      },
    );
  }
}
