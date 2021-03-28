import 'package:demo_user/modules/user/data/datasources/user_datasoucre.dart';
import 'package:demo_user/modules/user/data/repositories/user_repository.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../src/mocks.dart';
import '../../../../src/models.dart';

void main(){
  UserDatasourceMock userDatasource;
  UserRepository userRepository;
  User user;

  setUp((){
    userDatasource = UserDatasourceMock();
    userRepository = UserRepository(userDatasource);
    user = createUser();
  });

  group("getListUser", (){
    test('should return list of users', () async {
      // arrange
      when(userDatasource.getList()).thenAnswer((_) async =>[user]);
      // act
      final result = await userDatasource.getList();
      // assert
      expect(result[0].toJsonString(), user.toJsonString());
    });
  });

  group("getListUserDetail", (){
    test('should return list of users', () async {
      // arrange
      when(userDatasource.get(user.id)).thenAnswer((_) async => user);
      // act
      final result = await userDatasource.get(user.id);
      // assert
      expect(result.toJsonString(), user.toJsonString());
    });
  });
}