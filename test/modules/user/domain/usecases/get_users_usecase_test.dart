import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:demo_user/modules/user/domain/usecases/get_users_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  UserRepositoryMock userRepository;
  GetUsersUsecase getUserUsecase;
  List<User> user;

  setUp(() {
    userRepository = UserRepositoryMock();
    getUserUsecase = GetUsersUsecase(userRepository);
    user = [createUser()];
  });

  group("call", () {
    test('should return the response of userRepository', () async {
      // arrange
      when(userRepository.getList()).thenAnswer((_) => Future.value(user));
      // act
      final result = await getUserUsecase.call();
      // assert
      expect(user, result);
      verify(userRepository.getList());
    });
  });
}
