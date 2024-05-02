import '../features/friendbook/domain/friendbook.dart';
import 'DatabaseRepository.dart';

class MockDatabaseRepository implements DatabaseRepository {
  List<Friendbook> listOfFriendbooks = [];

  @override
  void createFriendsBook(Friendbook friendbook) {
    listOfFriendbooks.add(friendbook);
  }

  @override
  List<Friendbook> showFriendsbook() {
    return listOfFriendbooks;
  }
}
