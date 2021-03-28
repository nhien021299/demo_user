import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:demo_user/modules/user/domain/usecases/get_user_detail_usecase.dart';
import 'package:demo_user/modules/user/domain/usecases/get_users_usecase.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:suga_core/suga_core.dart';

@lazySingleton
class UserDetailViewModel extends BaseViewModel {
  final GetUserDetailUsecase _getUserDetailUsecase;

  UserDetailViewModel(this._getUserDetailUsecase);

  int id;

  final _user = Rx<User>();

  User get user => _user.value;

  void backToListUser(){
    Get.back();
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  Future _initData() async {
    await call(
      () async => _user.value = await _getUserDetailUsecase.call(id),
    );
  }
}
