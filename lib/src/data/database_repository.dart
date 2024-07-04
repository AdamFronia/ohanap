import 'package:ohanap/src/features/friendbook/domain/profile.dart';

abstract class DatabaseRepository {
  Future<List<Profile>> getAllProfiles();
  Future<void> updateToDoList(Map<String, dynamic> map, String docID);
  Stream<Profile> getSpecificProfile(String docID);
  Future<void> updateRelationshipStatus(
      String docID, String relationshipStatus);
}
