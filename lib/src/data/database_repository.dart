import 'package:ohanap/src/features/friendbook/domain/profile.dart';

abstract class DatabaseRepository {
  Future<List<Profile>> getAllProfiles();
  Future<void> updateToDoList(List<Map<String, dynamic>> map, String docID);
  Stream<Profile> getSpecificProfile(String docID);
  Future<void> updateDescription(String docID, String description);
  Future<void> updateRelationshipStatus(
      String docID, String relationshipStatus);

  Future<void> updateCity(String docID, String city);
  Future<void> updateAboutMe(String key, String value);
}
