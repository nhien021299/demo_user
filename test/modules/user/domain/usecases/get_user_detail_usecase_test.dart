import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:demo_user/modules/user/domain/usecases/get_user_detail_usecase.dart';
import 'package:demo_user/modules/user/domain/usecases/get_users_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main() {
  UserRepositoryMock userRepository;
  GetUserDetailUsecase getUserDetailUsecase;
  User user;

  setUp(() {
    userRepository = UserRepositoryMock();
    getUserDetailUsecase = GetUserDetailUsecase(userRepository);
    user = createUser();
  });

  group("call", () {
    test('should return the response of userRepository', () async {
      // arrange
      when(userRepository.get(user.id)).thenAnswer((_) => Future.value(user));
      // act
      final result = await getUserDetailUsecase.call(user.id);
      // assert
      expect(user, result);
      verify(userRepository.get(user.id));
    });
  });
}
