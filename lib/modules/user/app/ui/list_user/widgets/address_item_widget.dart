import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/app/ui/list_user/widgets/user_item_view_model.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:suga_core/suga_core.dart';

class AddressItemWidget extends StatefulWidget {
  final User address;

  const AddressItemWidget({Key key, this.address}) : super(key: key);
  @override
  _AddressItemWidgetState createState() => _AddressItemWidgetState();
}

class _AddressItemWidgetState extends BaseViewState<AddressItemWidget, UserItemViewModel> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.openDetailPage(widget.address.id);
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(10, 10, 10,0),
          child: Container(
            width: double.infinity,
            child: Card(
              elevation: 2.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'ID: ${widget.address.id}',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Street: ${widget.address.address.street}',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  UserItemViewModel createViewModel() => injector<UserItemViewModel>();
}
