import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ohanap/src/features/home/presentation/home_screen.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;

  AuthRepository(this._firebaseAuth);

  late String userUid;

  String get getUserUid => userUid;

  /// Returns the currently logged in [User]
  /// or `null` if no user is logged in
  User? getCurrentUser() {
    final currentUser = _firebaseAuth.currentUser;
    if (currentUser != null) {
      userUid = currentUser.uid;
    }
    return currentUser;
  }

  List<Map<String, dynamic>> dataList = _createDataList();

  Future<void> signUpWithEmailAndPassword(String email, String pw, context) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((userCredential) {
      userUid = userCredential.user!.uid;
      FirebaseFirestore.instance.collection("profiles").doc(userUid).set({
        "readme": "",
        "profilePicUrlBig": "",
        "profilePicUrlSmall": "",
        "name": "",
        "relationShip": "",
        "city": "",
        "hobby": "",
        "holiday": "",
        "job": "",
        "wishJob": "",
        "color": "",
        "birthdate": "",
        "sleepTime": "",
        "hasSiblings": false,
        "likeSports": false,
        "likesReading": false,
        "aboutMe": "",
        "dataList": _createDataList(),
        "animal": "",
        "drink": '',
        "musik": '',
        "essen": '',
        "goodies": '',
        "funnys": '',
        "futures": ''
      });
    }).then((_) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }

  Future<void> loginWithEmailAndPassword(String email, String pw) {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pw)
        .then((userCredential) {
      userUid = userCredential.user!.uid;
    });
  }

  Future<void> logout() {
    return _firebaseAuth.signOut();
  }

  Stream<User?> authStateChanges() {
    return _firebaseAuth.authStateChanges();
  }
}

List<Map<String, dynamic>> _createDataList() {
  List<String> itemTitles = [
    "Ich habe Geschwister",
    "Ich mache gerne Sport",
    "Ich lese gerne",
    "Ich mag Tiere",
    "Ich bin immer pünktlich",
    "Ich esse gerne Obst",
    "Ich bin Hilfsbereit",
    "Ich schlafe gerne",
    "Ich Kuschel gerne",
    "Ich treffe mich gerne mit meinen Freunden",
  ];
  List<Map<String, dynamic>> dataList = [];
  for (int i = 0; i < itemTitles.length; i++) {
    dataList.add({
      "title": itemTitles[i],
      "isChecked": false,
    });
  }
  return dataList;
}
