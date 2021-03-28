import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:suga_core/suga_core.dart';

part 'user_service.g.dart';

@lazySingleton
@RestApi()
abstract class UserService {
  @factoryMethod
  factory UserService() => _UserService(injector<HttpClientWrapper>().dio);

  @GET("/users")
  Future<List<User>> getUsers();

  @GET("/users/{id}")
  Future<User> getUser(@Path() int id);
}
