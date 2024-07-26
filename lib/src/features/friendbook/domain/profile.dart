class Profile {
  // Attribute
  String futures;
  String funnys;
  String goodies;
  String essen;
  String drink;
  String musik;
  String animal;
  String profilePicUrl;
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

  // Document ID
  final String docID;

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
    required this.animal,
    required this.drink,
    required this.musik,
    required this.essen,
    required this.docID,
    this.thatsMyStrengths,
    this.funnyFact,
    this.futuretime,
  });

//Methodes

  Map<String, dynamic> toMap() {
    return {
      "futures": futures,
      "funnys": funnys,
      "goodies": goodies,
      "essen": essen,
      "getraenke": drink,
      "musik": musik,
      "tier": animal,
      "profilePicUrl": profilePicUrl,
      "name": name,
      "readme": readme,
      "relationShip": relationShip,
      "city": city,
      "hobby": hobby,
      "holiday": holiday,
      "job": job,
      "wishJob": wishJob,
      "color": color, // Color als int speichern
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
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map, String docID) {
    return Profile(
      docID: docID,
      futures: map['futures'],
      funnys: map['funnys'],
      goodies: map['goodies'],
      essen: map['essen'],
      drink: map['Getraenke'],
      musik: map['musik'],
      animal: map['tier'],
      profilePicUrl: map['profilePicUrl'],
      name: map['name'],
      readme: map['readme'],
      relationShip: map['relationShip'],
      city: map['city'],
      hobby: map['hobby'],
      holiday: map['holiday'],
      job: map['job'],
      wishJob: map['wishJob'],
      color: map['color'], // Color von int wiederherstellen
      birthdate: map['birthdate'],
      sleepTime: map['sleepTime'],
      hasSiblings: map['hasSiblings'],
      likeSports: map['likeSports'],
      likesReading: map['likesReading'],
      aboutMe: map['aboutMe'],
      dataList: List<Map<String, dynamic>>.from(map['dataList']),
      thatsMyStrengths: map['thatsMyStrengths'],
      funnyFact: map['funnyFact'],
      futuretime: map['futuretime'],
    );
  }
}
