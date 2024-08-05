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

  Future<void> signUpWithEmailAndPassword(String email, String pw, context) {
    return _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((userCredential) {
      userUid = userCredential.user!.uid;
      FirebaseFirestore.instance.collection("profiles").doc(userUid).set({
        "readme": "",
        "profilePicUrl":
            "https://ca.slack-edge.com/T044YC3MSLF-U0682A3SDAN-fe6928565c03-72",
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
        "dataList": [],
        //createDataList(),
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
