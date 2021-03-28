import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:suga_core/suga_core.dart';
import 'configs/backend_config.dart';
import 'configs/app_config.dart';
import 'injector.config.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';


final injector = GetIt.instance;

@injectableInit
Future setupInjector() => $initGetIt(injector, environment: Environment.dev);

@module
abstract class MainModule {
  @lazySingleton
  @preResolve
  Future<SharedPreferences> getSharePreferences() async => SharedPreferences.getInstance();

  @lazySingleton
  Logger getLogger() => Logger(
    level: AppConfig.LOG_LEVEL,
  );

  @lazySingleton
  HttpClientWrapper getHttpClientWrapper(Logger logger) {
    final HttpClientWrapper wrapper = HttpClientWrapper(
      options: BaseOptions(
        baseUrl: BackendConfig.BASE_URL,
        connectTimeout: BackendConfig.CONNECT_TIMEOUT,
        receiveTimeout: BackendConfig.RECEIVE_TIMEOUT,
      ),
      logger: logger,
      verbose: false
    );
    return wrapper;
  }

}