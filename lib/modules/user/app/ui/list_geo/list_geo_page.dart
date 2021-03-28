import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/app/ui/list_user/list_user_view_model.dart';
import 'package:demo_user/modules/user/app/ui/list_user/widgets/geo_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suga_core/suga_core.dart';

class ListGeoPage extends StatefulWidget {
  @override
  _ListGeoPageState createState() => _ListGeoPageState();
}

class _ListGeoPageState extends BaseViewState<ListGeoPage, ListUserViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: viewModel.users.length ?? 0,
        itemBuilder: (context, index) {
          return GeoItemWidget(
            geos: viewModel.users[index],
          );
        },
      ),
    );
  }

  @override
  ListUserViewModel createViewModel() => injector<ListUserViewModel>();
}
