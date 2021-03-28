import 'package:demo_user/modules/user/data/repositories/user_repository.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUsersUsecase {
  final UserRepository _userRepository;

  GetUsersUsecase(this._userRepository);

  Future<List<User>> call() =>  _userRepository.getList();
}