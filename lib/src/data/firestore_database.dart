import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ohanap/src/data/database_repository.dart';
import 'package:ohanap/src/features/friendbook/domain/profile.dart';

class FirestoreDatabase implements DatabaseRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Profile>> getAllProfiles() async {
    final snapshot = await firestore.collection('profiles').get();
    List<Profile> profiles =
        snapshot.docs.map((doc) => Profile.fromMap(doc.data())).toList();

    return profiles;
  }
}
