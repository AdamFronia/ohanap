import 'friends.dart';

class Eintrag {
  Freund freund;
  String eintragText;
  DateTime datum;

  Eintrag(this.freund, this.eintragText, this.datum);

  void eintragAnzeigen() {
    print('Eintrag für ${freund.name} am $datum:');
    print(eintragText);
  }
}
