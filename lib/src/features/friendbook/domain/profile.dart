import 'dart:ui';

class Profile {
  // Attribute
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
  // Konstruktor
  Profile({
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
  });
}
