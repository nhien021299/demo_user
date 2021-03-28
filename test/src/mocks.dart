import 'package:demo_user/backend/services/user_service.dart';
import 'package:demo_user/modules/user/data/datasources/user_datasoucre.dart';
import 'package:demo_user/modules/user/data/repositories/user_repository.dart';
import 'package:demo_user/modules/user/domain/usecases/get_users_usecase.dart';
import 'package:mockito/mockito.dart';

class UserRepositoryMock extends Mock implements UserRepository{}

class UserDatasourceMock extends Mock implements UserDatasource {}

class GetUserUsecaseMock extends Mock implements GetUsersUsecase{}

class UserServiceMock extends Mock implements UserService{}