import 'friends.dart';

class Eintrag {
  Freund freund;
  String eintragText;
  DateTime datum;

  Eintrag({
    required this.freund,
    required this.eintragText,
    required this.datum,
  });

  Map<String, dynamic> toMap() {
    return {
      "freund": freund.toMap(),
      "eintragText": eintragText,
      "datum": datum, // Datum als String speichern
    };
  }

  factory Eintrag.fromMap(Map<String, dynamic> map) {
    return Eintrag(
      freund: Freund(
        map['freund']['name'],
        map['freund']['age'],
        map['freund']['hobby'],
      ),
      eintragText: map['eintragText'],
      datum: map['datum'],
    );
  }
}
