import 'dart:developer';

class Profile {
  // Attributes
  String futures;
  String funnys;
  String goodies;
  String essen;
  String drink;
  String musik;
  String animal;
  String name;
  String readme;
  String relationShip;
  String city;
  String hobby;
  String holiday;
  String job;
  String wishJob;
  String color;
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
  String? mainProfileURL;
  String? secondImageProfileURL;

  // Document ID
  final String docID;

  // Constructor
  Profile({
    required this.futures,
    required this.funnys,
    required this.goodies,
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
    required this.animal,
    required this.drink,
    required this.musik,
    required this.essen,
    required this.docID,
    this.thatsMyStrengths,
    this.funnyFact,
    this.futuretime,
    this.mainProfileURL,
    this.secondImageProfileURL,
  });

  // Method to convert Profile to Map
  Map<String, dynamic> toMap() {
    return {
      "futures": futures,
      "funnys": funnys,
      "goodies": goodies,
      "essen": essen,
      "drink": drink,
      "musik": musik,
      "tier": animal,
      "name": name,
      "readme": readme,
      "relationShip": relationShip,
      "city": city,
      "hobby": hobby,
      "holiday": holiday,
      "job": job,
      "wishJob": wishJob,
      "color": color,
      "birthdate": birthdate,
      "sleepTime": sleepTime,
      "hasSiblings": hasSiblings,
      "likeSports": likeSports,
      "likesReading": likesReading,
      "aboutMe": aboutMe,
      "dataList": dataList,
      "thatsMyStrengths": thatsMyStrengths,
      "funnyFact": funnyFact,
      "futuretime": futuretime,
      "mainProfileURL": mainProfileURL,
      "secondImageProfileURL": secondImageProfileURL,
    };
  }

  // Factory method to create Profile from Map
  factory Profile.fromMap(Map<String, dynamic> map, String docID) {
    try {
      return Profile(
        docID: docID,
        futures: map['futures'] ?? '',
        funnys: map['funnys'] ?? '',
        goodies: map['goodies'] ?? '',
        essen: map['essen'] ?? '',
        drink: map['drink'] ?? '',
        musik: map['musik'] ?? '',
        animal: map['tier'] ?? '',
        name: map['name'] ?? '',
        readme: map['readme'] ?? '',
        relationShip: map['relationShip'] ?? '',
        city: map['city'] ?? '',
        hobby: map['hobby'] ?? '',
        holiday: map['holiday'] ?? '',
        job: map['job'] ?? '',
        wishJob: map['wishJob'] ?? '',
        color: map['color'] ?? '',
        birthdate: map['birthdate'] ?? '',
        sleepTime: map['sleepTime'] ?? '',
        hasSiblings: map['hasSiblings'] ?? false,
        likeSports: map['likeSports'] ?? false,
        likesReading: map['likesReading'] ?? false,
        aboutMe: map['aboutMe'] ?? '',
        dataList: List<Map<String, dynamic>>.from(map['dataList'] ?? []),
        thatsMyStrengths: map['thatsMyStrengths'],
        funnyFact: map['funnyFact'],
        futuretime: map['futuretime'],
        mainProfileURL: map["mainProfileURL"],
        secondImageProfileURL: map["secondImageProfileURL"],
      );
    } catch (e) {
      log('Error creating Profile from map: $e');
      rethrow;
    }
  }
}
