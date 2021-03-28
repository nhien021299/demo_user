import 'package:demo_user/injector.dart';
import 'package:demo_user/modules/user/app/ui/list_user/widgets/user_item_view_model.dart';
import 'package:demo_user/modules/user/domain/models/user.dart';
import 'package:flutter/material.dart';
import 'package:suga_core/suga_core.dart';

class UserItemWidget extends StatefulWidget {
  final User user;

  const UserItemWidget({Key key, this.user}) : super(key: key);

  @override
  _UserItemWidgetState createState() => _UserItemWidgetState();
}

class _UserItemWidgetState extends BaseViewState<UserItemWidget, UserItemViewModel> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewModel.openDetailPage(widget.user.id);
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
                      'ID: ${widget.user.id}',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Text(
                      'Name: ${widget.user.name}',
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
