import 'entry.dart' show Eintrag;

class Friendbook {
  List<Eintrag> eintraege = [];

  void eintragHinzufuegen(Eintrag eintrag) {
    eintraege.add(eintrag);
  }
}
