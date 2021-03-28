import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../src/models.dart';

void main() {
  User user;
  Map<String, dynamic> userJson;
  String userJsonString;

  setUp((){
    user = createUser();
    userJson = <String, dynamic>{
      'id': user.id,
      'name': user.name,
      'username': user.username,
      'email': user.email,
      'address': user.address?.toJson(),
      'phone': user.phone,
      'website': user.website,
      'company': user.company?.toJson()
    };
    userJsonString = json.encode(userJson);
  });

  group("fromJson", () {
    test('should return a valid userCode object', () {
      // arrange
      // act
      final result = User.fromJson(userJson);
      // assert
      expect(result.toJsonString(), user.toJsonString());
    });
  });

  group("fromJsonString", () {
    test('should return a valid accountCode object', () {
      // arrange
      // act
      final result = User.fromJsonString(userJsonString);
      // assert
      expect(const DeepCollectionEquality().equals(result.toJson(), user.toJson()), isTrue);
    });
  });

  group("toJson", () {
    test('should return a valid accountCode json', () {
      // arrange
      // act
      final result = user.toJson();
      // assert
      expect(const DeepCollectionEquality().equals(result, userJson), isTrue);
    });
  });

  group("toJsonString", () {
    test('should return a valid accountCode string', () {
      // arrange
      // act
      final result = user.toJsonString();
      // assert
      expect(result, userJsonString);
    });
  });
}