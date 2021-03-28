// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:logger/logger.dart' as _i3;
import 'package:shared_preferences/shared_preferences.dart' as _i4;
import 'package:suga_core/suga_core.dart' as _i7;

import 'backend/services/user_service.dart' as _i6;
import 'injector.dart' as _i14;
import 'modules/user/app/ui/list_user/list_user_view_model.dart' as _i12;
import 'modules/user/app/ui/list_user/widgets/user_item_view_model.dart' as _i5;
import 'modules/user/app/ui/user_detail/user_detail_view_model.dart' as _i13;
import 'modules/user/data/datasources/user_datasoucre.dart' as _i8;
import 'modules/user/data/repositories/user_repository.dart' as _i9;
import 'modules/user/domain/usecases/get_user_detail_usecase.dart' as _i10;
import 'modules/user/domain/usecases/get_users_usecase.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String environment, _i2.EnvironmentFilter environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final mainModule = _$MainModule();
  gh.lazySingleton<_i3.Logger>(() => mainModule.getLogger());
  await gh.lazySingletonAsync<_i4.SharedPreferences>(
      () => mainModule.getSharePreferences(),
      preResolve: true);
  gh.lazySingleton<_i5.UserItemViewModel>(() => _i5.UserItemViewModel());
  gh.lazySingleton<_i6.UserService>(() => _i6.UserService());
  gh.lazySingleton<_i7.HttpClientWrapper>(
      () => mainModule.getHttpClientWrapper(get<_i3.Logger>()));
  gh.lazySingleton<_i8.UserDatasource>(
      () => _i8.UserDataSourceImpl(get<_i6.UserService>()));
  gh.lazySingleton<_i9.UserRepository>(
      () => _i9.UserRepository(get<_i8.UserDatasource>()));
  gh.lazySingleton<_i10.GetUserDetailUsecase>(
      () => _i10.GetUserDetailUsecase(get<_i9.UserRepository>()));
  gh.lazySingleton<_i11.GetUsersUsecase>(
      () => _i11.GetUsersUsecase(get<_i9.UserRepository>()));
  gh.factory<_i12.ListUserViewModel>(
      () => _i12.ListUserViewModel(get<_i11.GetUsersUsecase>()));
  gh.lazySingleton<_i13.UserDetailViewModel>(
      () => _i13.UserDetailViewModel(get<_i10.GetUserDetailUsecase>()));
  return get;
}

class _$MainModule extends _i14.MainModule {}
