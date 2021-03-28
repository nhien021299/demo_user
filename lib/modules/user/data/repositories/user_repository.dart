import 'package:demo_user/modules/user/data/datasources/user_datasoucre.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UserRepository{
  final UserDatasource _userDatasource;

  UserRepository(this._userDatasource);

  Future<List<User>> getList() => _userDatasource.getList();

  Future<User> get(int id) => _userDatasource.get(id);
}