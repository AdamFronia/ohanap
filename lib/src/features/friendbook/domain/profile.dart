import 'dart:ui';

class Profile {
  // Attribute
  String futures;
  String funnys;
  String goodies;
  String essen;
  String getraenke;
  String musik;
  String tier;
  String profilePicUrl;
  String name;
  String readme;
  String relationShip;
  String city;
  String hobby;
  String holiday;
  String job;
  String wishJob;
  Color color;
  String birthdate;
  String sleepTime;
  bool hasSiblings;
  bool likeSports;
  bool likesReading;
  String aboutMe;
  List<Map<String, dynamic>> dataList;
  String? thatsMyStrengths;
  String? funnyFact;
  String? futuretime;
  // Konstruktor
  Profile({
    required this.futures,
    required this.funnys,
    required this.goodies,
    required this.profilePicUrl,
    required this.name,
    required this.readme,
    required this.relationShip,
    required this.city,
    required this.hobby,
    required this.holiday,
    required this.job,
    required this.wishJob,
    required this.color,
    required this.birthdate,
    required this.sleepTime,
    required this.hasSiblings,
    required this.likeSports,
    required this.likesReading,
    required this.aboutMe,
    required this.dataList,
    required this.tier,
    required this.getraenke,
    required this.musik,
    required this.essen,
    this.thatsMyStrengths,
    this.funnyFact,
    this.futuretime,
  });
}
