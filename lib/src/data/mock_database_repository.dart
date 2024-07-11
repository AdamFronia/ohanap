import 'package:flutter/material.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

import 'database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  List<Map<String, dynamic>> dataList = _createDataList();

  // simulierten Daten in der Datenbank
  List<Profile> profileList = [
    Profile(
        docID: "4",
        profilePicUrl:
            "https://ca.slack-edge.com/T044YC3MSLF-U0682A3SDAN-fe6928565c03-72",
        name: "Adam",
        readme: "hi bin adam",
        relationShip: "",
        city: "Berlin",
        hobby: "hobby",
        holiday: "holiday",
        job: "job",
        wishJob: "wishJob",
        color: Colors.red,
        birthdate: "11.11.1990",
        sleepTime: "abends",
        hasSiblings: true,
        likeSports: false,
        likesReading: true,
        aboutMe: "ueber mich blablabalbalblab",
        dataList: _createDataList(),
        tier: "hund",
        getraenke: 'saft',
        musik: 'techno',
        essen: '',
        goodies: 'flip',
        funnys: 'witzig',
        futures: 'future'),
    Profile(
        docID: "1",
        profilePicUrl:
            "https://ca.slack-edge.com/T044YC3MSLF-U04S160GVMH-353316879748-72",
        name: "Angie",
        readme: "hi bin angi",
        relationShip: "verlobt",
        city: "Berlin",
        hobby: "hobby",
        holiday: "holiday",
        job: "job",
        wishJob: "wishJob",
        color: Colors.green,
        birthdate: "11.11.1990",
        sleepTime: "abends",
        hasSiblings: true,
        likeSports: false,
        likesReading: true,
        aboutMe: "ueber mich blablabalbalblab",
        dataList: _createDataList(),
        getraenke: "saft",
        tier: "hund",
        musik: 'techno',
        essen: '',
        goodies: 'flip',
        funnys: 'witzig',
        futures: 'future'),
    Profile(
        docID: "2",
        profilePicUrl:
            "https://ca.slack-edge.com/T044YC3MSLF-U05GXAU2DH6-75f1f34f2c6f-192",
        name: "David",
        readme: "hi bin david",
        relationShip: "single",
        city: "Berlin",
        hobby: "hobby",
        holiday: "holiday",
        job: "job",
        wishJob: "wishJob",
        color: Colors.purple,
        birthdate: "11.11.1994",
        sleepTime: "morgens",
        hasSiblings: true,
        likeSports: false,
        likesReading: true,
        aboutMe: "ueber mich blablabalbalblab",
        dataList: _createDataList(),
        getraenke: "saft",
        tier: "hund",
        musik: 'techno',
        essen: '',
        goodies: 'flip',
        funnys: 'witzig',
        futures: 'future'),
  ];

  @override
  Future<List<Profile>> getAllProfiles() async {
    await Future.delayed(const Duration(seconds: 3));
    return profileList;
  }

  @override
  Future<void> updateToDoList(Map<String, dynamic> map, String docID) {
    // TODO: implement updateToDoList
    throw UnimplementedError();
  }

  @override
  Stream<Profile> getSpecificProfile(String docID) {
    // TODO: implement getSpecificProfile
    throw UnimplementedError();
  }

  @override
  Future<void> updateRelationshipStatus(
      String docID, String relationshipStatus) {
    // TODO: implement updateRelationshipStatus
    throw UnimplementedError();
  }

  @override
  Future<void> updateDiscription(String docID, String discription) {
    // TODO: implement updateDiscription
    throw UnimplementedError();
  }

  @override
  Future<void> updateCity(String docID, String city) {
    // TODO: implement updateCity
    throw UnimplementedError();
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
