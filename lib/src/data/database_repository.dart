import 'package:ohanap/src/features/friendbook/domain/profile.dart';

abstract class DatabaseRepository {
  Future<List<Profile>> getAllProfiles();
}
