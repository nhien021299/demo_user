import 'package:demo_user/modules/user/data/repositories/user_repository.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserDetailUsecase{
  final UserRepository _userRepository;

  GetUserDetailUsecase(this._userRepository);

  Future<User> call(int id) => _userRepository.get(id);
}