import 'package:flutter/material.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

import 'database_repository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  // simulierten Daten in der Datenbank
  List<Profile> profileList = [
    Profile(
      profilePicUrl:
          "https://ca.slack-edge.com/T044YC3MSLF-U0682A3SDAN-fe6928565c03-72",
      name: "Adam",
      readme: "hi bin adam",
      relationShip: "verheiratet",
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
    ),
    Profile(
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
    ),
    Profile(
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
    ),
  ];

  @override
  List<Profile> getAllProfiles() {
    return profileList;
  }
}
