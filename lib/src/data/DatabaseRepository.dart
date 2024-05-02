import '../features/friendbook/domain/friendbook.dart';

abstract class DatabaseRepository {
  void createFriendsBook(Friendbook friendbook);
  List<Friendbook> showFriendsbook();
}
