import 'dart:convert';
import 'package:collection/collection.dart';
import 'package:demo_user/modules/user/domain/models/address.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../src/models.dart';

void main() {
  Address address;
  Map<String, dynamic> addressJson;
  String addressJsonString;

  setUp((){
    address = createAddress();
    addressJson = <String, dynamic>{
      'street': address.street,
      'suite': address.suite,
      'city': address.city,
      'zipCode': address.zipCode,
      'geo': address.geo?.toJson(),
    };
    addressJsonString = json.encode(addressJson);
  });

  group("fromJson", () {
    test('should return a valid userCode object', () {
      // arrange
      // act
      final result = Address.fromJson(addressJson);
      // assert
      expect(result.toJsonString(), address.toJsonString());
    });
  });

  group("fromJsonString", () {
    test('should return a valid accountCode object', () {
      // arrange
      // act
      final result = Address.fromJsonString(addressJsonString);
      // assert
      expect(const DeepCollectionEquality().equals(result.toJson(), address.toJson()), isTrue);
    });
  });

  group("toJson", () {
    test('should return a valid accountCode json', () {
      // arrange
      // act
      final result = address.toJson();
      // assert
      expect(const DeepCollectionEquality().equals(result, addressJson), isTrue);
    });
  });

  group("toJsonString", () {
    test('should return a valid accountCode string', () {
      // arrange
      // act
      final result = address.toJsonString();
      // assert
      expect(result, addressJsonString);
    });
  });
}