import 'package:ohanap/src/features/friendbook/domain/profile.dart';

abstract class DatabaseRepository {
  List<Profile> getAllProfiles();
}
