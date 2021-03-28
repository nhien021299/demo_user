import 'package:demo_user/backend/services/user_service.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:injectable/injectable.dart';

abstract class UserDatasource {
  Future<List<User>> getList();

  Future<User> get(int id);
}

@LazySingleton(as: UserDatasource)
class UserDataSourceImpl implements UserDatasource {
  final UserService _userService;

  UserDataSourceImpl(this._userService);

  @override
  Future<List<User>> getList() => _userService.getUsers();

  @override
  Future<User> get(int id) => _userService.getUser(id);

}
