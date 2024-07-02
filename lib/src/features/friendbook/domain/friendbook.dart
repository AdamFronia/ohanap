import 'entry.dart' show Eintrag;

class Friendbook {
  List<Eintrag> eintraege = [];

  Friendbook({
    required this.eintraege,
  });

  void eintragHinzufuegen(Eintrag eintrag) {
    eintraege.add(eintrag);
  }

  List<Map<String, dynamic>> toList() {
    List<Map<String, dynamic>> mapList = [];
    for (Eintrag eintrag in eintraege) {
      mapList.add(eintrag.toMap());
    }
    return mapList;
  }

  factory Friendbook.fromList(List<Map<String, dynamic>> list) {
    List<Eintrag> eintraege = [];
    for (Map<String, dynamic> map in list) {
      eintraege.add(Eintrag.fromMap(map));
    }
    return Friendbook(eintraege: eintraege);
  }
}
