import 'package:demo_user/modules/user/app/ui/user_detail/user_detail_page.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:suga_core/suga_core.dart';

@lazySingleton
class UserItemViewModel extends BaseViewModel {
  void openDetailPage(int id) {
    Get.to(UserDetailPage(
      id: id,
    ));
  }
}
