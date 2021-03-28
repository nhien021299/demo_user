import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/app/ui/list_user/list_user_view_model.dart';
import 'package:demo_user/modules/user/app/ui/list_user/widgets/address_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suga_core/suga_core.dart';

class ListAddressPage extends StatefulWidget {
  @override
  _ListAddressPageState createState() => _ListAddressPageState();
}

class _ListAddressPageState extends BaseViewState<ListAddressPage, ListUserViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: viewModel.users.length ?? 0,
        itemBuilder: (context, index) {
          return AddressItemWidget(
            address: viewModel.users[index],
          );
        },
      ),
    );
  }

  @override
  ListUserViewModel createViewModel() => injector<ListUserViewModel>();
}
