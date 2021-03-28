import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:demo_user/modules/user/domain/usecases/get_users_usecase.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:injectable/injectable.dart';
import 'package:suga_core/suga_core.dart';

@injectable
class ListUserViewModel extends BaseViewModel {
  final GetUsersUsecase _getUsersUsecase;

  ListUserViewModel(this._getUsersUsecase);

  final int tabLength = 3;
  final int userNameTabIndex = 0;
  final int addressTabIndex = 1;
  final int geoTabIndex = 2;

  RxInt selectedIndex = 0.obs;
  TabController tabController;

  bool get isUserNameTabIndex => selectedIndex.value == userNameTabIndex;

  bool get isAddressTabIndex => selectedIndex.value == addressTabIndex;

  bool get isGeoTabIndex => selectedIndex.value == geoTabIndex;

  RxList<User> _users = RxList<User>();

  List<User> initialUsers = [];

  List<User> get users => _users.toList();

  final searchNameController = TextEditingController();

  void initTabController(TickerProviderStateMixin providerStateMixin) {
    tabController = TabController(vsync: providerStateMixin, length: tabLength);
    tabController.addListener(() {
      selectedIndex.value = tabController.index;
    });
  }

  void queryName(String name) {
    name = searchNameController.text.toLowerCase();
    _users.assignAll(initialUsers.where((element) => element.name.contains(name)).toList());
  }

  void clearText() {
    searchNameController.clear();
  }

  @override
  void initState() {
    _initData();
    super.initState();
  }

  Future _initData() async {
    await call(
      () async {
        _users.assignAll(await _getUsersUsecase.call());
        initialUsers.addAll(users);
      },
      showLoading: false,
    );
  }
}
