import 'entry.dart' show Eintrag;

class Friendbook {
  List<Eintrag> eintraege = [];

  void eintragHinzufuegen(Eintrag eintrag) {
    eintraege.add(eintrag);
  }

  void freundebuchAnzeigen() {
    print('Freundebuch:');
    for (var eintrag in eintraege) {
      eintrag.eintragAnzeigen();
    }
  }
}
